package com.springboot.service;

import java.util.List;

import com.springboot.model.Brand;
import com.springboot.model.Category;
import com.springboot.model.Product;

public interface ProductService {
	
	List<Product> getProductList();
	
	Product getProductbyCode(int productCode);
	
	List<Product> getProductListByCategory(String category);
	
	List<Product> getProductListByBranch(String brand);
	
	List<Product> getProductListByName(String name);
	
	List<Category> getCategoryList();
	
	List<Brand> getBrandList();
	
	List<Product> searchProductByKey(String keyName, int brandCode ,int categoryCode);
	
}
