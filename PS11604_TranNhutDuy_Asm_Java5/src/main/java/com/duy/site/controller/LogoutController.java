package com.duy.site.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duy.service.SessionService;

@Controller
public class LogoutController {
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/logout")
	public String logout() {
		sessionService.remove("user");
		return "redirect:/home";
	}
}
