package com.springboot.dao;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.model.OrderDetail;


public interface OrderDetailDao extends JpaRepository<OrderDetail, Integer> {
	
	@Query(value = "SELECT * FROM orderdetail od WHERE od.order_code = ?1 and od.is_delete = 0", nativeQuery = true)
	List<OrderDetail> getOrderDetailList(int orderCode);
	
	@Modifying
    @Query(value = "insert into orderdetail (order_code,product_code,price,quantity,is_delete,product_name) "
    		+ "values (:orderCode,:productCode,:price,:quantity,:isDelete,:productName)", nativeQuery = true)
    @Transactional
    void createOrderDetail(@Param("orderCode") int orderCode
    		,@Param("productCode") int productCode
    		,@Param("price") double price
    		,@Param("quantity") int quantity
    		,@Param("isDelete") int isDelete
    		,@Param("productName") String productName);
}
