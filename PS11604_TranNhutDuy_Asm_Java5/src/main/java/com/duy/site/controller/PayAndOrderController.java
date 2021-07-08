package com.duy.site.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duy.dao.OrderDAO;
import com.duy.dao.OrderDetailDAO;
import com.duy.entity.Account;
import com.duy.entity.Order;
import com.duy.entity.OrderDetail;
import com.duy.service.CartService;
import com.duy.service.OrderService;
import com.duy.service.ParamService;
import com.duy.service.SessionService;

@Controller
public class PayAndOrderController {
	@Autowired
	CartService cart;
	@Autowired
	SessionService sessionService;
	@Autowired
	OrderDetailDAO dao;
	@Autowired
	ParamService paramService;
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/order/pay")
	public String pay(Model model) {
		Account user = sessionService.get("user");
		model.addAttribute("user", user);
		model.addAttribute("cart", cart);
		return "site/cart/pay";
	}
	@RequestMapping("/order/pay/{id}")
	public String paydetail(Model model, @PathVariable("id") Integer id) {
		Account user = sessionService.get("user");
		cart.add(id);
		model.addAttribute("user", user);
		model.addAttribute("cart", cart);
		return "site/cart/pay";
	}
	@RequestMapping("/order/success")
	public String order(Model model) {
		String address = paramService.getString("address", "");
		if(!cart.getItems().isEmpty()) {
			if(address.equals("")) {
				return "redirect:/order/pay";
			}
			Account user = sessionService.get("user");
			Order order = orderService.order(user, address);
			List<OrderDetail> items = dao.findByOrderid(order.getId());
			model.addAttribute("order", order);
			model.addAttribute("items", items);
			return "site/cart/success";
		}
		return "redirect:/home";
	}
}
