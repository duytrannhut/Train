package com.duy.site.controller;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duy.dao.CategoryDAO;
import com.duy.dao.ProductDAO;
import com.duy.domain.SortItem;
import com.duy.entity.Category;
import com.duy.entity.Product;
import com.duy.service.ParamService;
import com.duy.service.SessionService;

@Controller
public class ProductSiteController {
	@Autowired
	CategoryDAO categoryDao;
	@Autowired
	ProductDAO productDao;
	@Autowired
	SessionService sessionService;
	@Autowired
	ParamService paramService;
	
	
	@RequestMapping("/product")
	public String product(Model model, 
			@RequestParam("category_id") Optional<String> categoryId, 
			@RequestParam("keywords") Optional<String> kw,
			@RequestParam("limit") Optional<Integer> limit, 
			@RequestParam("p") Optional<Integer> p,
			@RequestParam("sort") Optional<String> sort,
			@RequestParam("order") Optional<String> order) {
		String cid = categoryId.orElse(sessionService.get("category_id", ""));
		sessionService.set("category_id", cid);
		String kwords = kw.orElse(sessionService.get("keywords", ""));
		sessionService.set("keywords", kwords);
		Sort sorts = Sort.by(order.orElse("asc").equals("asc")?Direction.ASC:Direction.DESC, sort.orElse("id"));
		Pageable pageable = PageRequest.of(p.orElse(0), limit.orElse(12), sorts);
		Page<Product> page = productDao.findByCategoryidAndKeywords("%"+cid+"%", "%"+kwords+"%", pageable);
		model.addAttribute("page", page);
		model.addAttribute("p", p.orElse(0));
		model.addAttribute("sort", sort.orElse("id"));
		model.addAttribute("order", order.orElse("asc"));
		model.addAttribute("limit", limit.orElse(12));
		Category category = null;
		if(!cid.equals("")) {
			category = categoryDao.findById(cid).get();
		}
		model.addAttribute("category", category);
		return "site/product/product";
	}
	
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		return categoryDao.findAll();
	}
	@ModelAttribute("limits")
	public List<Integer> getLimits(){
		return Arrays.asList(10, 12, 20);
	}
	@ModelAttribute("sortItems")
	public Collection<SortItem> getSortItems(){
		Map<Integer, SortItem> map = new HashMap<>();
		map.put(1, new SortItem("id", "asc", "Mặc định"));
		map.put(2, new SortItem("price", "asc", "Giá tăng dần"));
		map.put(3, new SortItem("price", "desc", "Giá giảm dần"));
		map.put(4, new SortItem("name", "asc", "Tên sản phẩm: A to Z"));
		map.put(5, new SortItem("name", "desc", "Tên sản phẩm: Z to A"));
		return map.values();
	}
}
