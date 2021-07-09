package com.duy.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.duy.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {

}
