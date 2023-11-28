package com.springboot.service;

import java.util.List;

import com.springboot.model.Message;
import com.springboot.model.OrderDetail;

public interface CustomerService {

	Message order(List<OrderDetail> list);
	
	Message changePassword(String oldP, String newP);
	
}
