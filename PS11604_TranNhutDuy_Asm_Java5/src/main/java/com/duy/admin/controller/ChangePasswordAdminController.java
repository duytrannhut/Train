package com.duy.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.duy.dao.AccountDAO;
import com.duy.entity.Account;
import com.duy.service.ParamService;
import com.duy.service.SessionService;

@Controller
public class ChangePasswordAdminController {
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountDAO dao;
	@Autowired
	ParamService paramService;
	
	@GetMapping("/admin/change-password")
	public String changeGet() {
		return "admin/auth/change_password";
	}
	
	@PostMapping("/admin/change-password")
	public String changePost(Model model) {
		String password = paramService.getString("passwordOld", "");
		String newpassword = paramService.getString("password", "");
		String repassword = paramService.getString("rePassword", "");
		try {
			Account user = sessionService.get("user");
			if(!password.equals(user.getPassword())) {
				model.addAttribute("error", "Mật khẩu không chính xác");
			}else {
				if(!newpassword.equals(repassword)) {
					model.addAttribute("error", "Mật khẩu xác nhận không trùng khớp");
				}else {
					user.setPassword(newpassword);
					dao.save(user);
					model.addAttribute("message", "Đổi mật khẩu thành công");
				}
			}
		} catch (Exception e) {
			model.addAttribute("error", "Vui lòng đăng nhập");
		}
		return "admin/auth/change_password";
	}
}
