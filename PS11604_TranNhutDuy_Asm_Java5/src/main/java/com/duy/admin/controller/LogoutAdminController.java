package com.duy.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duy.service.SessionService;

@Controller
public class LogoutAdminController {
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/admin/logout")
	public String logoutAdmin() {
		sessionService.remove("user");
		return "redirect:/admin/login";
	}
}
