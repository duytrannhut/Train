package com.duy.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

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

import com.duy.dao.AccountDAO;
import com.duy.entity.Account;
import com.duy.entity.Product;
import com.duy.service.UploadService;

@Controller
public class AccountController {
	@Autowired
	AccountDAO dao;
	@Autowired
	UploadService uploadService;
	
	@RequestMapping("/admin/account")
	public String table(Model model, @RequestParam("p") Optional<Integer> p, 
			@RequestParam("admin") Optional<Boolean> admin) {
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		Page<Account> page = dao.findByAdmin(admin.orElse(false), pageable);
		model.addAttribute("page", page);
		model.addAttribute("p", p.orElse(0));
		return "admin/account/table";
	}
	@RequestMapping("/admin/account/create")
	public String form(Model model) {
		Account user = new Account();
		model.addAttribute("user", user);
		return "admin/account/form";
	}
	@RequestMapping("/admin/account/edit/{userId}")
	public String edit(Model model, @PathVariable("userId") String username) {
		Account user = dao.findById(username).get();
		model.addAttribute("user", user);
		return "admin/account/form";
	}
	@RequestMapping("/admin/account/save/{c}")
	public String save(Account user, @RequestParam("photo_file") MultipartFile file, @PathVariable("c") boolean c, @RequestParam("cpassword") String cpassword) {
		if(!user.getPassword().equals(cpassword)) {
			System.out.println("mk k ch s");
		}else {
			File savedFile = uploadService.save(file, "assets/upload/photo");
			user.setPhoto("/assets/upload/photo/"+file.getOriginalFilename());
			dao.save(user);
		}
		if(c) {
			return "redirect:/admin/account";
		}
		return "redirect:/admin/account/create";
	}
	@RequestMapping("/admin/account/update/{c}")
	public String update(Account user, @RequestParam("photo_file") MultipartFile file, @PathVariable("c") boolean c, @RequestParam("cpassword") String cpassword) {
		if(!user.getPassword().equals(cpassword)) {
			System.out.println("mk k ch s");
		}else {
			if(file.getSize()==0) {
				Account oldUser = dao.findById(user.getUsername()).get();
				user.setPhoto(oldUser.getPhoto());
			}else {
				File savedFile = uploadService.save(file, "assets/upload/photo");
				user.setPhoto("/assets/upload/photo/"+file.getOriginalFilename());
			}
			dao.save(user);
		}
		if(c) {
			return "redirect:/admin/account";
		}
		return "redirect:/admin/account/edit/" + user.getUsername();
	}
	@RequestMapping("/admin/account/delete/{userId}")
	public String delete(@PathVariable("userId") String username) {
		dao.deleteById(username);
		return "redirect:/admin/account";
	}
	@ModelAttribute("activates")
	public Map<Boolean, String> getActivates(){
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, "Đã kích hoạt");
		map.put(false, "Chưa kích hoạt");
		return map;
	}
	@ModelAttribute("admins")
	public Map<Boolean, String> getAdmins(){
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, "Admin");
		map.put(false, "User");
		return map;
	}
	
}
