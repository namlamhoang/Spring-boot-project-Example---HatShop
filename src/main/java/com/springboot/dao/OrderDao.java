package com.springboot.dao;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.springboot.model.Order;

public interface OrderDao extends JpaRepository<Order, Integer> {

	@Query(value = "SELECT * FROM `ORDER` o WHERE o.status = ?1 and o.is_delete = 0 ", nativeQuery = true)
	List<Order> getOrderListbyStatus(int status);
	
	@Query(value = "SELECT * FROM `ORDER` o WHERE order_date BETWEEN ?1 AND ?2 and status = 1 ", nativeQuery = true)
	List<Order> getOrderListbyDate(String from,String to);
}
