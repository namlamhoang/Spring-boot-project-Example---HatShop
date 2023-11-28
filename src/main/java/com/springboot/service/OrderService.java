package com.springboot.service;

import java.util.List;

import com.springboot.model.Message;
import com.springboot.model.OrderDetail;
import com.springboot.model.User;

public interface OrderService {
	
	List<OrderDetail> addCart(int productCode,int quantity,List<OrderDetail> list);
	
	List<OrderDetail> saveCart(String odl);
	
	int countCartPrice(List<OrderDetail> list);
	
	Message order(List<OrderDetail> list);
	
}
