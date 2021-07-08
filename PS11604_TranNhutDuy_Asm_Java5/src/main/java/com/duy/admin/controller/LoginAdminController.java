package com.duy.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duy.dao.AccountDAO;
import com.duy.entity.Account;
import com.duy.service.CookieService;
import com.duy.service.ParamService;
import com.duy.service.SessionService;

@Controller
public class LoginAdminController {
	@Autowired
	AccountDAO dao;
	@Autowired
	SessionService sessionService;
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;

	@RequestMapping("/admin/login")
	public String loginAdminGet() {
		return "/admin/auth/login";
	}
	
	@PostMapping("/admin/login")
	public String loginAdminPost(Model model) {
		String username = paramService.getString("username", "");
		String password = paramService.getString("password", "");
		boolean remember = paramService.getBoolean("remember", false);
		Account user = dao.findById(username).get();
		if(user==null) {
			model.addAttribute("message", "Tài khoản không tồn tại!");
		}else {
			if(!user.getPassword().equals(password)) {
				model.addAttribute("message", "Mật khẩu không chính xác!");
			}else {
				sessionService.set("user", user);
				if(remember) {
					cookieService.add("username", user.getUsername(), 10);
					cookieService.add("password", user.getPassword(), 10);
				}else {
					cookieService.remove("username");
					cookieService.remove("password");
				}
				model.addAttribute("messgae", "Đăng nhập thành công");
				return "redirect:/admin/home";
			}
		}
		return "/admin/auth/login";
	}
}
