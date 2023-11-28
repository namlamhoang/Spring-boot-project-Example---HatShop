package com.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.dao.BrandDao;
import com.springboot.dao.CategoryDao;
import com.springboot.dao.ProductDao;
import com.springboot.model.Brand;
import com.springboot.model.Category;
import com.springboot.model.Product;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	BrandDao brandDao;

	@Override
	public List<Product> getProductList() {
		return productDao.listProduct();
	}
	
	@Override
	public Product getProductbyCode(int productCode) {
		return productDao.getById(productCode);
	}

	@Override
	public List<Product> getProductListByCategory(String category) {
		return productDao.listProductByCategory(category);
	}

	@Override
	public List<Product> getProductListByBranch(String branch) {
		return productDao.listProductByCategory(branch);
	}

	@Override
	public List<Product> getProductListByName(String name) {
		return productDao.listProductByCategory("%" + name + "%");
	}

	@Override
	public List<Category> getCategoryList() {
		return categoryDao.getCategoryList();
	}

	@Override
	public List<Brand> getBrandList() {
		return brandDao.getBrandList();
	}
	
	@Override
	public List<Product> searchProductByKey(String keyName, int brandCode , int categoryCode) {
		if(keyName==null || keyName=="") {
			keyName = "";
		} else {
			keyName="%"+keyName+"%";
		}
		List<Product> list =  productDao.searchFliter(keyName,Integer.toString(brandCode), Integer.toString(categoryCode));
		
		return list;
	}
}
