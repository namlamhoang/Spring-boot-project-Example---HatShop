package com.springboot.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.model.Message;
import com.springboot.model.OrderDetail;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

	@Override
	public Message order(List<OrderDetail> list) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Message changePassword(String oldP, String newP) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
