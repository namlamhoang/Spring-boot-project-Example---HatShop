package com.springboot.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.dao.OrderDao;
import com.springboot.dao.OrderDetailDao;
import com.springboot.dao.ProductDao;
import com.springboot.model.Message;
import com.springboot.model.Order;
import com.springboot.model.OrderDetail;
import com.springboot.model.Product;
import com.springboot.model.User;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	OrderDao orderDao;
	
	@Autowired
	OrderDetailDao orderDetailDao;
	
	@Autowired
	AccountService accountService;

	@Override
	public List<OrderDetail> addCart(int productCode,int quantity,List<OrderDetail> list) {
		
		return customeCart(productCode, quantity, list);
	}
	
	@Override
	public List<OrderDetail> saveCart(String odl) {
		
		JSONObject jsonObject = new JSONObject(odl);
		
		JSONArray jsonArray = jsonObject.getJSONArray("odl");  
		
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		
		if (jsonArray != null) {   
             
		    for (int i=0;i<jsonArray.length();i++){  
		    	
		    	JSONObject ob =  new JSONObject(jsonArray.get(i).toString());
		    	
		    	customeCart(Integer.parseInt((String) ob.get("productCode"))
		    			,Integer.parseInt((String) ob.get("quantity")),list);
		    	
		    }   
	    }  

		return list;
		
	}
	
	private List<OrderDetail> customeCart(int productCode,int quantity,List<OrderDetail> list) {
		
		Optional<Product> product = productDao.findById(productCode);
		
		if(product.isPresent()) {
			
			Product p = product.get();
			
			for (int i = 0; i < list.size(); i++) {
				
				if(list.get(i).getProductCode()==p.getProductCode()) {
					
					if(list.get(i).getQuantity() >= p.getQuantity()) {
						
						list.get(i).setQuantity(p.getQuantity());
					} else {
						
						list.get(i).setQuantity(list.get(i).getQuantity()+quantity);
					}
					
					return list;
				}
			}
			
			if(quantity >= p.getQuantity()){
				list.add(new OrderDetail(p.getProductCode(),p.getImage(),p.getProductName(),-1, p.getPrice(),p.getQuantity(), 0));
			} else {
				list.add(new OrderDetail(p.getProductCode(),p.getImage(),p.getProductName(),-1, p.getPrice(),quantity, 0));
			}
			
			
		}
		
		return list;
	}

	@Override
	public int countCartPrice(List<OrderDetail> list) {

		int price = 0;
		
		for (int i = 0; i < list.size(); i++) {
			price += list.get(i).getPrice() * list.get(i).getQuantity();
		}
		
		return price;
	}

	@Override
	public Message order(List<OrderDetail> list) {
		
		try {
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			
			User u = accountService.getUser(auth.getName());
			
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			
			LocalDateTime now = LocalDateTime.now(); 
			
			Order order = orderDao.save(new Order(0,dtf.format(now),u.getAddress(),0, u.getUserName(), 1, 0));
			
			for (int i = 0; i < list.size(); i++) {
				
				OrderDetail orderDetail = list.get(i);
				
				
				Product p = productDao.getById(orderDetail.getProductCode());
				
				if(p.getQuantity() < orderDetail.getQuantity()) {
					throw new Exception();
				} else {
					p.setQuantity(p.getQuantity() - orderDetail.getQuantity());
					
					productDao.save(p);
				}
				
				orderDetail.setOrderCode(order.getOrderCode());
				
				orderDetailDao.createOrderDetail(orderDetail.getOrderCode()
						,orderDetail.getProductCode()
						,orderDetail.getPrice()
						,orderDetail.getQuantity()
						,0,orderDetail.getProductName());
			}
			
			return new Message(false, "Order Success");
			
		} catch (Exception e) {
			return new Message(true, "fail");
		}
		
	}

}
