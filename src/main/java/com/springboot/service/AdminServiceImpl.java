package com.springboot.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.springboot.dao.AuthoritiesDao;
import com.springboot.dao.BrandDao;
import com.springboot.dao.CategoryDao;
import com.springboot.dao.OrderDao;
import com.springboot.dao.ProductDao;
import com.springboot.dao.UsersDao;
import com.springboot.model.Authorities;
import com.springboot.model.Brand;
import com.springboot.model.Category;
import com.springboot.model.Message;
import com.springboot.model.Order;
import com.springboot.model.OrderDetail;
import com.springboot.model.User;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	UsersDao usersDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	BrandDao brandDao;
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	AuthoritiesDao authoritiesDao;
	
	@Autowired
	OrderDao orderDao;
	

	@Override
	public Message createCategort(Category c) {
		
		Optional<Category> category = categoryDao.findById(c.getCategoryCode());
		
		if(category.isPresent()) {
			
			return new Message(true, "Category code already used");
		}else {
			
			categoryDao.save(c);
			
			return new Message(false,"Success");
		}
	}

	@Override
	public Message updateCategort(Category c) {
		
		Optional<Category> category = categoryDao.findById(c.getCategoryCode());
		
		if(category.isPresent()) {
			
			categoryDao.save(c);
			
			return new Message(false,"Success");
			
		}else {
			
			return new Message(true, "error");
		}
	}

	@Override
	public Message createBrand(Brand b) {
		
		Optional<Brand> brand = brandDao.findById(b.getbrandCode());
		
		if(brand.isPresent()) {
			
			return new Message(true, "Category code already used");
		}else {
			
			brandDao.save(b);
			
			return new Message(false,"Success");
		}
	}

	@Override
	public Message updateBrand(Brand b) {
		
		Optional<Brand> brand = brandDao.findById(b.getbrandCode());
		
		if(brand.isPresent()) {
			
			brandDao.save(b);
			
			return new Message(false,"Success");
			
		}else {
			
			return new Message(true, "error");
		}
	}

	@Override
	public Message createUser(User u,String role) {
		
		Optional<User> user = usersDao.findById(u.getUserName());
		
		if(user.isPresent()) {
			
			return new Message(true, "Username already used");
			
		}else {
			
			u.setPassword("{noop}"+u.getPassword());
			
			usersDao.save(u);
			
			if(role.equals("ROLE_CUSTOMER")) {
				
				authoritiesDao.save(new Authorities(u.getUserName(),role));
				
			}else {
				
				authoritiesDao.createAuth(u.getUserName(), role);
				
				authoritiesDao.createAuth(u.getUserName(), "ROLE_CUSTOMER");
			}
			
			return new Message(false,"Success");
		}
	}

	@Override
	public Message updateUser(User u,String role) {
		
		Optional<User> user = usersDao.findById(u.getUserName());
		
		if(user.isPresent()) {
			
			u.setPassword("{noop}"+u.getPassword());
			
			usersDao.save(u);
			
			authoritiesDao.deleteAuth(u.getUserName());
			
			if(role.equals("ROLE_CUSTOMER")) {
				
				authoritiesDao.createAuth(u.getUserName(), role);
				
			}else {
				
				authoritiesDao.createAuth(u.getUserName(), role);
				
				authoritiesDao.createAuth(u.getUserName(), "ROLE_CUSTOMER");
			}
			
			return new Message(false,"Success");
			
		}else {
			
			return new Message(true, "error");
		}
	}
	
	@Override
	public List<User> getUserList() {
		
		List<User> list = usersDao.findAll();
		int size = list.size();
		for (int i = 0; i < size ; i++) {
			
			User u = list.get(i);
			
			if(u.getUserName()=="admin") {
				list.remove(i);
				i--;
				size--;
			}
		}
		
		return list;
	}

	@Override
	public List<Category> getAllCategoryList() {
		
		// TODO Auto-generated method stub
		return categoryDao.findAll();
	}

	@Override
	public List<Brand> getAllBrandList() {
		
		// TODO Auto-generated method stub
		return brandDao.findAll();
	}
	
	@Override
	public Map<String,Object> getRevenue(Date from, Date to,int total,List<Integer> price) {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		price = new ArrayList<Integer>();
		
		List<Order> list = orderDao.getOrderListbyDate(formatter.format(from),formatter.format(to));
		
		for (int i = 0; i < list.size(); i++) {
			
			List<OrderDetail> detailList= list.get(i).getOrderDetail();
			
			int countPrice = 0;
			
			for (int j = 0; j < detailList.size(); j++) {
				total += detailList.get(j).getPrice() * detailList.get(j).getQuantity();
				countPrice += detailList.get(j).getPrice() * detailList.get(j).getQuantity();
			}
			price.add(i, countPrice);
		}
		
		param.put("total",total);
		
		param.put("list",list);
		
		param.put("priceList",price);
		
		return param;
	}

}
