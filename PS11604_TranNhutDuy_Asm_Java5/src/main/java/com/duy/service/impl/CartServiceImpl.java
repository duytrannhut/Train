package com.duy.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.duy.dao.ProductDAO;
import com.duy.domain.Item;
import com.duy.entity.Product;
import com.duy.service.CartService;

@SessionScope
@Service
public class CartServiceImpl implements CartService {
	Map<Integer, Item> map = new HashMap<>();
	@Autowired
	ProductDAO dao;
	
	@Override
	public Item add(Integer id) {
		Item item = map.get(id);
		if(item==null) {
			Product product = dao.findById(id).get();
			item = new Item();
			item.setId(product.getId());
			item.setImage(product.getImage());
			item.setName(product.getName());
			item.setPrice(product.getPrice());
			item.setQuantity(1);
			map.put(id, item);
		}else {
			item.setQuantity(item.getQuantity() + 1);
		}
		return item;
	}

	@Override
	public void remove(Integer id) {
		map.remove(id);
	}

	@Override
	public Item update(Integer id, int quantity) {
		Item item = map.get(id);
		item.setQuantity(quantity);
		return item;
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public Collection<Item> getItems() {
		return map.values();
	}

	@Override
	public int getCount() {
		return (int) map.values().stream().mapToInt(item->item.getId()).count();
	}

	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item->item.getPrice()).sum();
	}

	@Override
	public double getTotal() {
		double total=0;
		for(Item item:map.values()) {
			total+=(item.getPrice()*item.getQuantity());
		}
		return total ;
	}
	
	

}
