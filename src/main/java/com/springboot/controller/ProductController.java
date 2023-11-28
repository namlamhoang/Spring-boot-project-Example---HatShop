package com.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.model.Product;
import com.springboot.service.ProductService;

@Controller
@RequestMapping("/product/")
public class ProductController {
	
	@Autowired
	ProductService productService;

	@RequestMapping(value="view",method = RequestMethod.GET)
	public String index(ModelMap model
			,@RequestParam(value="p") int p) {
		
		Product product = productService.getProductbyCode(p);
		
		model.addAttribute("product", product);
		
		model.addAttribute("brandList", productService.getBrandList());
		
		model.addAttribute("categoryList", productService.getCategoryList());
		
		return "product";
	}
	
}
