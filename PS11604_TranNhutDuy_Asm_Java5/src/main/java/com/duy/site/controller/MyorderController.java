package com.duy.site.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duy.dao.OrderDAO;
import com.duy.entity.Account;
import com.duy.entity.Order;
import com.duy.service.SessionService;

@Controller
public class MyorderController {
	@Autowired
	OrderDAO dao;
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/account/myorder")
	public String myorder(Model model) {
		Account user = sessionService.get("user");
		List<Order> items = dao.findByUsername(user.getUsername());
		model.addAttribute("items", items);
		return "site/order/myorder";
	}
}
