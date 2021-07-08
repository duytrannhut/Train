package com.duy.site.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duy.dao.AccountDAO;
import com.duy.entity.Account;
import com.duy.service.CookieService;
import com.duy.service.ParamService;
import com.duy.service.SessionService;

@Controller
public class LoginController {
	@Autowired
	AccountDAO dao;
	@Autowired
	SessionService sessionService;
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	
	@GetMapping("/login")
	public String loginGet(Model model) {
		String username = cookieService.get("username");
		model.addAttribute("username", username);
		return "site/account/login";
	}
	@PostMapping("/login")
	public String loginPost(Model model) {
		String username = paramService.getString("username", "");
		String password = paramService.getString("password", "");
		boolean remember = paramService.getBoolean("remember", false);
		try {
			Account user = dao.findById(username).get();
			if(!user.getPassword().equals(password)) {
					model.addAttribute("error", "Mật khẩu không chính xác!");
			}else {
				if(!user.isActivated()) {
					model.addAttribute("error", "Tài khoản chưa được xác nhận");
				}else {
					sessionService.set("user", user);
					if(remember) {
							cookieService.add("username", user.getUsername(), 10);
							cookieService.add("password", user.getPassword(), 10);
					}else {
							cookieService.remove("username");
							cookieService.remove("password");
					}
					model.addAttribute("message", "Đăng nhập thành công");
					return "redirect:/home";
				}
			}
		} catch (Exception e) {
			model.addAttribute("error", "Tài khoản không tồn tại!");
		}
		
		return "site/account/login";
	}
}
