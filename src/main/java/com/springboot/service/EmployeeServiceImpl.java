package com.springboot.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.dao.OrderDao;
import com.springboot.dao.OrderDetailDao;
import com.springboot.dao.ProductDao;
import com.springboot.model.Message;
import com.springboot.model.Order;
import com.springboot.model.OrderDetail;
import com.springboot.model.Product;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	ProductDao productDao;
	
	@Autowired
	OrderDao orderDao;
	
	@Autowired
	OrderDetailDao orderDetailDao;
	
	@Override
	public List<Product> getAllProductList() {
		
		// TODO Auto-generated method stub
		return productDao.findAll();
	}
	
	@Override
	public Message createProduct(Product p) {
		
		// TODO Auto-generated method stub
		Optional<Product> product = productDao.findById(p.getProductCode());
		
		if(product.isPresent()) {
		
			return new Message(true, "Product code already use");
			
		}else {
			
			productDao.save(p);
			
			return new Message(false, "Success");
		}
	}
	
	@Override
	public Message updateProduct(Product p) {
		
		// TODO Auto-generated method stub
		Optional<Product> product = productDao.findById(p.getProductCode());
		
		if(product.isPresent()) {
			
			if(p.getImage()==null) {
				
				p.setImage(product.get().getImageByte());
			}
			
			productDao.save(p);
			
			return new Message(false, "Success");
		}else {
			
			return new Message(true, "error");
		}
	
	}

	@Override
	public Message confirmOrder(int orderCode,int confirm) {

		Optional<Order> order = orderDao.findById(orderCode);
		
		if(order.isPresent()) {
			
			Order o = order.get();
			
			o.setStatus(confirm);
			
			orderDao.save(o);
			
			return new Message();
		}
		
		return new Message(true, "false");
	}

	@Override
	public List<Order> getOrerList(int status) {
		
		return orderDao.getOrderListbyStatus(status);
	}

	@Override
	public List<OrderDetail> getOrerDetailList(int orderCode) {
		
		List<OrderDetail> list =  orderDetailDao.getOrderDetailList(orderCode);
		
		return list;
	}

}
