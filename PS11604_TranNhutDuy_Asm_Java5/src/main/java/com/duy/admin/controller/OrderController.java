package com.duy.admin.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duy.dao.OrderDAO;
import com.duy.entity.Order;

@Controller
public class OrderController {
	@Autowired
	OrderDAO dao;
	
	@RequestMapping("/admin/order")
	public String table(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		Page<Order> page = dao.findAll(pageable);
		model.addAttribute("page", page);
		model.addAttribute("p", p.orElse(0));
		return "admin/order/table";
	}
	@RequestMapping("/admin/order/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		dao.deleteById(id);
		return "redirect:/admin/order";
	}
}
