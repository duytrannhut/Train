package com.duy.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.duy.domain.ReportDoanhThu;
import com.duy.domain.Top12;
import com.duy.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
	@Query("SELECT o FROM OrderDetail o WHERE o.order.id = ?1")
	List<OrderDetail> findByOrderid(Long orderid);
	@Query("SELECT new ReportDoanhThu(d.product.category, sum(d.price*d.quantity), "
			+ "sum(d.quantity)) FROM OrderDetail d GROUP BY d.product.category")
	List<ReportDoanhThu> revenueByCategory();
	@Query("SELECT new Top12(o.product, sum(o.quantity)) "
			+ "FROM OrderDetail o GROUP BY o.product "
			+ "ORDER BY sum(o.quantity) DESC")
	Page<Top12> getTop12product(Pageable pageable);
}
