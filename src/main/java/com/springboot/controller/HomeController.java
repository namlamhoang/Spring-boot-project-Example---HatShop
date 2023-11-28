package com.springboot.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.dao.BrandDao;
import com.springboot.dao.CategoryDao;
import com.springboot.dao.ProductDao;
import com.springboot.model.Category;
import com.springboot.model.Message;
import com.springboot.model.Product;
import com.springboot.service.ProductService;

@Controller
@RequestMapping("/home/")
public class HomeController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="view",method = RequestMethod.GET)
	public String home(ModelMap model, HttpSession session,
			@RequestParam(value="p",defaultValue = "1") int p) { 
		List<Product> list = productService.getProductList();
		
		int totalPage = list.size() / 12;
		
		if(list.size() % 12 > 0) totalPage++;

		model.addAttribute("page",p);
		
		model.addAttribute("totalPage",totalPage);
		
		model.addAttribute("productList", list);
		
		model.addAttribute("brandList", productService.getBrandList());
		
		List<Category> categoryList =  productService.getCategoryList();
		
		model.addAttribute("categoryList",categoryList);
		
		model.addAttribute("mess", new Message());
		
		return "index";
		
	}
	
}
