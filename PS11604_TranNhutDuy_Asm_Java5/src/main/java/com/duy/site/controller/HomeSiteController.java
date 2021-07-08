package com.duy.site.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duy.dao.AccountDAO;
import com.duy.dao.OrderDetailDAO;
import com.duy.dao.ProductDAO;
import com.duy.domain.Top12;
import com.duy.service.SessionService;

@Controller
public class HomeSiteController {
	@Autowired
	ProductDAO dao;
	@Autowired
	OrderDetailDAO odDao;
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/home")
	public String home(Model model) {
		Pageable pageable = PageRequest.of(0, 12);
		Page<Top12> top12 = odDao.getTop12product(pageable);
		model.addAttribute("top12", top12);
		return "site/home/index";
	}
//	public String home(Model model, 
//			@RequestParam("p") Optional<Integer> p, 
//			@RequestParam("keywords") Optional<String> kw) {
//		String kwords = kw.orElse(sessionService.get("keywords", ""));
//		sessionService.set("keywords", kwords);
//		Pageable pageable = PageRequest.of(p.orElse(0), 12);
//		Page<Product> page = dao.findByKeywords("%"+kwords+"%", pageable);
//		model.addAttribute("page", page);
//		model.addAttribute("p", p.orElse(0));
//		return "site/home/index";
//	}
	
}
