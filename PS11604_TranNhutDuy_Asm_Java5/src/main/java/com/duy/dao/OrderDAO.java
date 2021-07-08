package com.duy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.duy.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Long>{
	@Query("SELECT o FROM Order o WHERE o.account.username = ?1 ORDER BY o.createDate DESC")
	List<Order> findByUsername(String username);
}
