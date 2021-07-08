package com.duy.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duy.dao.OrderDAO;
import com.duy.dao.OrderDetailDAO;
import com.duy.entity.Order;
import com.duy.entity.OrderDetail;

@Controller
public class OrderDetailController {
	@Autowired
	OrderDetailDAO dao;
	@Autowired
	OrderDAO orderDao;
	
	@RequestMapping("/admin/order/detail/{orderid}")
	public String table(Model model, @PathVariable("orderid") Long id) {
		Order order = orderDao.findById(id).get();
		List<OrderDetail> items = dao.findByOrderid(id);
		model.addAttribute("order", order);
		model.addAttribute("items", items);
		return "admin/order/detail";
	}
	
	@RequestMapping("/admin/order/detail/deliveried/{orderid}")
	public String deliveried(Model model, @PathVariable("orderid") Long id) {
		Order order = orderDao.findById(id).get();
		order.setDeliveried(true);
		orderDao.save(order);
		return "redirect:/admin/order/detail/" + order.getId();
	}
	
	@RequestMapping("/admin/order/detail/checkout/{orderid}")
	public String checkout(Model model, @PathVariable("orderid") Long id) {
		Order order = orderDao.findById(id).get();
		order.setCheckout(true);
		orderDao.save(order);
		return "redirect:/admin/order/detail/" + order.getId();
	}
}
