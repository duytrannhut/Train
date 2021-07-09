package com.duy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.duy.dao.CategoryDAO;
import com.duy.dao.ProductDAO;
import com.duy.entity.Category;
import com.duy.entity.Product;
import com.duy.service.UploadService;

@Controller
public class ProductController {
	@Autowired
	CategoryDAO cdao;
	@Autowired
	ProductDAO dao;
	@Autowired
	UploadService upload;
	
	@RequestMapping("/product/index")
	public String index(Model model) {
		Product item = new Product();
		model.addAttribute("item", item);
		return "product/index";
	}
	@RequestMapping("/product/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Product item = dao.findById(id).get();
		model.addAttribute("item", item);
		return "product/index";
	}
	@RequestMapping("/product/save")
	public String save(Product item, @RequestParam("photo_file") MultipartFile file) {
		upload.save(file, "upload");
		item.setImage(file.getOriginalFilename());
		dao.save(item);
		return "redirect:/product/index";
	}
	@RequestMapping("/product/update")
	public String update(Product item, @RequestParam("photo_file") MultipartFile file) {
		if(!file.isEmpty()) {
			upload.save(file, "upload");
			item.setImage(file.getOriginalFilename());
		}else {
			Product old = dao.findById(item.getId()).get();
			item.setImage(old.getImage());
		}
		dao.save(item);
		return "redirect:/product/edit/"+item.getId();
	}
	@RequestMapping("/product/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		dao.deleteById(id);
		return "redirect:/product/index";
	}
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		return cdao.findAll();
	}
	@ModelAttribute("items")
	public List<Product> getProducts(){
		return dao.findAll();
	}
}
