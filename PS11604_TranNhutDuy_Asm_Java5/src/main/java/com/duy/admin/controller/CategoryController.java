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

import com.duy.dao.CategoryDAO;
import com.duy.entity.Category;

@Controller
public class CategoryController {
	@Autowired
	CategoryDAO dao;
	
	@RequestMapping("/admin/category")
	public String table(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 15);
		Page<Category> page = dao.findAll(pageable);
		model.addAttribute("page", page);
		model.addAttribute("p", p.orElse(0));
		return "admin/category/table";
	}
	@RequestMapping("/admin/category/create")
	public String form(Model model) {
		Category item = new Category();
		model.addAttribute("item", item);
		return "admin/category/form";
	}
	@RequestMapping("/admin/category/edit/{id}")
	public String edit(Model model,@PathVariable("id") String id) {
		Category item = dao.findById(id).get();
		model.addAttribute("item", item);
		return "admin/category/form";
	}
	@RequestMapping("/admin/category/save/{c}")
	public String save(Category item, @PathVariable("c") boolean c) {
		dao.save(item);
		if(c) {
			return "redirect:/admin/category";
		}
		return "redirect:/admin/category/create";
	}
	@RequestMapping("/admin/category/update/{c}")
	public String update(Category item, @PathVariable("c") boolean c) {
		dao.save(item);
		if(c) {
			return "redirect:/admin/category";
		}
		return "redirect:/admin/category/edit/" + item.getId();
	}
	@RequestMapping("/admin/category/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		dao.deleteById(id);
		return "redirect:/admin/category";
	}
}
