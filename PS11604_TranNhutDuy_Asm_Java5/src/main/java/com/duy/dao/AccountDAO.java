package com.duy.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.duy.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String>{
	@Query("SELECT o FROM Account o WHERE o.admin = ?1")
	Page<Account> findByAdmin(Boolean admin, Pageable pageable);
}
