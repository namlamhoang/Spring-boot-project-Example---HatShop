package com.springboot.service;

import java.util.List;

import com.springboot.model.Message;
import com.springboot.model.Order;
import com.springboot.model.OrderDetail;
import com.springboot.model.Product;

public interface EmployeeService {
	
	List<Product> getAllProductList();
	
	List<Order> getOrerList(int status);
	
	List<OrderDetail> getOrerDetailList(int orderCode);
	
	Message createProduct(Product p);
	
	Message updateProduct(Product p);
	
	Message confirmOrder(int orderCode,int confirm);

}
