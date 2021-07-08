package com.duy.site.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.duy.dao.AccountDAO;
import com.duy.entity.Account;
import com.duy.service.SessionService;
import com.duy.service.UploadService;

@Controller
public class EditProfileController {
	@Autowired
	SessionService sessionService;
	@Autowired
	UploadService uploadService; 
	@Autowired
	AccountDAO dao;
	
	@GetMapping("/account/edit-profile")
	public String editProfileGet(Model model) {
		Account user = sessionService.get("user");
		model.addAttribute("user", user);
		return "site/account/edit_profile";
	}
	@PostMapping("/account/edit-profile")
	public String editProfilePost(Model model, Account user, @RequestParam("photo_file") MultipartFile file) {
		Account useredit = sessionService.get("user");
		useredit.setFullname(user.getFullname());
		if(file.getSize()==0) {
			useredit.setPhoto(user.getPhoto());
		}else {
			File savedFile = uploadService.save(file, "assets/upload/photo");
			useredit.setPhoto("/assets/upload/photo/"+file.getOriginalFilename());
		}
		dao.save(useredit);
		model.addAttribute("message", "Cập nhật thành công");
		model.addAttribute("user", useredit);
		return "site/account/edit_profile";
	}
}
