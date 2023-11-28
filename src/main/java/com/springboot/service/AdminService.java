package com.springboot.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.springboot.model.Brand;
import com.springboot.model.Category;
import com.springboot.model.Message;
import com.springboot.model.Order;
import com.springboot.model.Product;
import com.springboot.model.User;

public interface AdminService {
	
	Message createCategort (Category c);
	
	Message updateCategort (Category c);
	
	Message createBrand (Brand b);
	
	Message updateBrand (Brand b);
	
	List<User> getUserList();
	
	Message createUser (User u,String role);
	
	Message updateUser (User u,String role);
	
	List<Category> getAllCategoryList();
	
	List<Brand> getAllBrandList();
	
	Map<String,Object> getRevenue(Date from,Date to,int total,List<Integer> price);

}
