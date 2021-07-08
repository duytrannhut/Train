package com.duy.site.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duy.dao.ProductDAO;
import com.duy.entity.Product;

@Controller
public class ProductDetailController {
	@Autowired
	ProductDAO productDao;
	
	@RequestMapping("/product/detail/{id}")
	public String productDetail(Model model, @PathVariable("id") Integer id) {
		Product item =productDao.findById(id).get();
		List<Product> items = productDao.findByCategoryid(item.getCategory().getId());
		model.addAttribute("item", item);
		model.addAttribute("items", items);
		return "site/product/productDetail";
	}
}
