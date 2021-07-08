package com.duy.site.controller;

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
public class MyorderDetailController {
	@Autowired
	OrderDAO orderDao;
	@Autowired
	OrderDetailDAO orderDetailDao;
	
	@RequestMapping("/account/myorder/detail/{orderid}")
	public String myOrderDetail(Model model, @PathVariable("orderid") Long orderid) {
		Order order = orderDao.findById(orderid).get();
		List<OrderDetail> items = orderDetailDao.findByOrderid(orderid);
		model.addAttribute("order", order);
		model.addAttribute("items", items);
		return "site/order/myorder_detail";
	}
}
