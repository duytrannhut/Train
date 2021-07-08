package com.duy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duy.dao.OrderDAO;
import com.duy.dao.OrderDetailDAO;
import com.duy.domain.Item;
import com.duy.entity.Account;
import com.duy.entity.Order;
import com.duy.entity.OrderDetail;
import com.duy.entity.Product;

@Service
public class OrderService {
	@Autowired
	CartService cart;
	@Autowired
	OrderDAO dao;
	@Autowired
	OrderDetailDAO detailDao;
	
	public Order order(Account user, String address) {
		Order order = new Order();
		order.setAccount(user);
		order.setAddress(address);
		dao.save(order);
		for(Item item:cart.getItems()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setPrice(item.getPrice());
			orderDetail.setQuantity(item.getQuantity());
			Product product = new Product();
			product.setId(item.getId());
			product.setName(item.getName());
			orderDetail.setProduct(product);
			
			detailDao.save(orderDetail);
		}
		cart.clear();
		return order;
	}
}
