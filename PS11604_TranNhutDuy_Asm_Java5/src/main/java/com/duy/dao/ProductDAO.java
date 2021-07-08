package com.duy.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.duy.domain.ReportTonKho;
import com.duy.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer>{
	@Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
	Page<Product> findByKeywords(String keywords, Pageable pageable);
	@Query("SELECT new ReportTonKho(o.category, sum(o.price), count(o)) "
			+ " FROM Product o "
			+ " GROUP BY o.category"
			+ " ORDER BY sum(o.price) DESC")
	List<ReportTonKho> getInventoryByCategory();
	@Query("SELECT o FROM Product o WHERE o.category.id LIKE ?1 AND o.name LIKE ?2")
	Page<Product> findByCategoryidAndKeywords(String categoryId, String keywords, Pageable pageable);
	@Query("SELECT o FROM Product o WHERE o.category.id LIKE ?1")
	List<Product> findByCategoryid(String categoryId);
}
