package com.duy.service;

import java.util.Collection;

import com.duy.domain.Item;

public interface CartService {
	Item add(Integer id);
	void remove(Integer id);
	Item update(Integer id, int quantity);
	void clear();
	Collection<Item> getItems();
	int getCount();
	double getAmount();
	double getTotal();
}
