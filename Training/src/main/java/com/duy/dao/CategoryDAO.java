package com.duy.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.duy.entity.Category;

public interface CategoryDao extends JpaRepository<Category, String>{

}
