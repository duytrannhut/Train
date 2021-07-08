package com.duy.admin.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
import com.duy.service.SessionService;
import com.duy.service.UploadService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO dao;
	@Autowired
	CategoryDAO cdao;
	@Autowired
	UploadService uploadService;
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/admin/product")
	public String table(Model model, @RequestParam("keywords") Optional<String> kw,@RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse(sessionService.get("keywords", ""));
		sessionService.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		Page<Product> page = dao.findByKeywords("%"+kwords+"%", pageable);
		model.addAttribute("page", page);
		model.addAttribute("p", p.orElse(0));
		return "admin/product/table";
	}
	@RequestMapping("/admin/product/create")
	public String form(Model model) {
		Product item = new Product();
		model.addAttribute("item", item);
		return "admin/product/form";
	}
	@RequestMapping("/admin/product/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Product item = dao.findById(id).get();
		model.addAttribute("item", item);
		return "admin/product/form";
	}
	@RequestMapping("/admin/product/save/{c}")
	public String save(Product item, @RequestParam("photo_file") MultipartFile file, @PathVariable("c") boolean c) {
		File savedFile = uploadService.save(file, "assets/upload/product");
		item.setImage("/assets/upload/product/"+file.getOriginalFilename());
		dao.save(item);
		if(c) {
			return "redirect:/admin/product";
		}
		return "redirect:/admin/product/create";
	}
	@RequestMapping("/admin/product/update/{c}")
	public String update(Product item, @RequestParam("photo_file") MultipartFile file, @PathVariable("c") boolean c) {
		if(file.getSize()==0) {
			Product oldItem = dao.findById(item.getId()).get();
			item.setImage(oldItem.getImage());
		}else {
			File savedFile = uploadService.save(file, "assets/upload/product");
			item.setImage("/assets/upload/product/"+file.getOriginalFilename());
		}
		dao.save(item);
		if(c) {
			return "redirect:/admin/product";
		}
		return "redirect:/admin/product/edit/" + item.getId();
	}
	@RequestMapping("/admin/product/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		dao.deleteById(id);
		return "redirect:/admin/product";
	}
	@ModelAttribute("availables")
	public Map<Boolean, String> getAvailables(){
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, "Có sẵn");
		map.put(false, "Không có sẵn");
		return map;
	}
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		return cdao.findAll();
	}
}
