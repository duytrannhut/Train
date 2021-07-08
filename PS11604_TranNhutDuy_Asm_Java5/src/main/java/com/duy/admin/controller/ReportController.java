package com.duy.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duy.dao.OrderDetailDAO;
import com.duy.dao.ProductDAO;
import com.duy.domain.ReportDoanhThu;
import com.duy.domain.ReportTonKho;

@Controller
public class ReportController {
	@Autowired
	ProductDAO dao;
	@Autowired
	OrderDetailDAO odao;
	
	@RequestMapping("/admin/report-ton-kho")
	public String reportTonKho(Model model) {
		List<ReportTonKho> items = dao.getInventoryByCategory();
		model.addAttribute("items", items);
		return "admin/report/report-ton-kho";
	}
	
	@RequestMapping("/admin/report-doanh-thu")
	public String reportDoanhThu(Model model) {
		List<ReportDoanhThu> items = odao.revenueByCategory();
		model.addAttribute("items", items);
		return "admin/report/report-doanh-thu";
	}
}
