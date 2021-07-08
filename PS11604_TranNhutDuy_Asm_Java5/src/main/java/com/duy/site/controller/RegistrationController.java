package com.duy.site.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.duy.dao.AccountDAO;
import com.duy.domain.MailInfo;
import com.duy.entity.Account;
import com.duy.service.MailerService;
import com.duy.service.ParamService;
import com.duy.service.UploadService;

@Controller
public class RegistrationController {
	@Autowired
	AccountDAO dao;
	@Autowired
	ParamService paramService;
	@Autowired
	UploadService uploadService;
	@Autowired
	MailerService mailer;
	
	@GetMapping("/registration")
	public String registrationGet(Model model) {
		Account user = new Account();
		model.addAttribute("user", user);
		return "site/account/registration";
	}
	
	@PostMapping("/registration")
	public String registrationPost(Model model,Account user, @RequestParam("photo_file") MultipartFile file) {
		String rePassword = paramService.getString("repassword", "");
		if(!rePassword.equals(user.getPassword())) {
			model.addAttribute("error", "Xác nhận mật khẩu không trùng khớp");
			model.addAttribute("user", user);
		}else {
			File saveFile = uploadService.save(file, "assets/upload/photo");
			user.setPhoto("/assets/upload/photo/"+file.getOriginalFilename());
			dao.save(user);
			MailInfo mailInfo = new MailInfo();
			mailInfo.setTo(user.getEmail());
			mailInfo.setSubject("Xác minh tài khoản");
			StringBuilder sb = new StringBuilder();
			sb.append("Kính chào Anh/Chị ").append(user.getFullname()).append("<br>");
			sb.append("Để sử dụng được dịch vụ của shop vui lòng xác minh tài khoản<br>");
			sb.append("Nhấn vào đây để xác minh").append("<a href='http://localhost:8080/").append("account/verification/").append(user.getUsername()).append("'>here</a><br>");
			sb.append("Trân trọng.<br>");
			sb.append("Administrator");
			mailInfo.setBody(sb.toString());
			mailer.queue(mailInfo.getTo(), mailInfo.getSubject(), mailInfo.getBody());
			model.addAttribute("message", "Đăng ký thành công");
			return "redirect:/login";
		}
		return "site/account/registration";
	}
	
	@RequestMapping("/account/verification/{username}")
	public String verification(Model model,@PathVariable("username") String username) {
		Account user = dao.findById(username).get();
		user.setActivated(true);
		dao.save(user);
		return "redirect:/login";
	}
}
