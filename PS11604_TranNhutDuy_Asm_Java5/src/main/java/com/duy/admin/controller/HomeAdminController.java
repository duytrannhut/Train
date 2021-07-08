package com.duy.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duy.entity.Account;
import com.duy.service.SessionService;

@Controller
public class HomeAdminController {
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/admin/home")
	public String home(Model model) {
		Account user = sessionService.get("user");
		model.addAttribute("user", user);
		return "admin/home/index";
	}
}
