package com.duy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.duy.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, String>{
	@Query("SELECT o FROM Category o WHERE o.name LIKE ?1")
	List<Category> findByKeywords(String keywords);
}
