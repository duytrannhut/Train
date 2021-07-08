package com.duy.site.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.duy.dao.AccountDAO;
import com.duy.domain.MailInfo;
import com.duy.entity.Account;
import com.duy.service.MailerService;
import com.duy.service.ParamService;

@Controller
public class ForgotPasswordController {
	@Autowired
	AccountDAO dao;
	@Autowired
	ParamService paramService;
	@Autowired
	MailerService mailer;
	
	@GetMapping("/forgotpassword")
	public String forgotGet() {
		return "site/account/forgot_password";
	}
	@PostMapping("/forgotpassword")
	public String forgotPost(Model model) {
		String username = paramService.getString("username", "");
		String email = paramService.getString("email", "");
		try {
			Account user = dao.findById(username).get();
			if(!user.getEmail().equals(email)) {
				model.addAttribute("error", "Email không chính xác");
			}else {
				MailInfo mailInfo = new MailInfo();
				mailInfo.setTo(email);
				mailInfo.setSubject("Quên mật khẩu");
				StringBuilder sb = new StringBuilder();
				sb.append("Kính chào ").append(user.getFullname()).append("<br>");
				sb.append("Bạn đã sử dụng chức năng quên mật khẩu. <br>");
				sb.append("Mật khẩu của bạn là <b>").append(user.getPassword()).append("</b><br>");
				sb.append("Trân trọng.<br>");
				sb.append("Administrator");
				mailInfo.setBody(sb.toString());
				mailer.queue(mailInfo.getTo(), mailInfo.getSubject(), mailInfo.getBody());
				model.addAttribute("message", "Gửi mail thành công");
			}
		} catch (Exception e) {
			model.addAttribute("error", "Tài khoản không tồn tại");
		}
		return "site/account/forgot_password";
	}
}
