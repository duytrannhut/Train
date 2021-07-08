package com.duy.site.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duy.service.CartService;

@Controller
public class CartController {
	@Autowired
	CartService cart;
	
	@RequestMapping("/cart")
	public String cart(Model model) {
		model.addAttribute("cart", cart);
		return "site/cart/cart";
	}
	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/cart";
	}
	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/cart";
	}
	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") Integer id, 
			@RequestParam("quantity") Integer quantity) {
		cart.update(id, quantity);
		return "redirect:/cart";
	}
	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart";
	}
	@RequestMapping("/remove/{uri}/{id}")
	public String removeByUrl(@PathVariable("uri") String uri, 
			@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/"+uri;
	}
}
