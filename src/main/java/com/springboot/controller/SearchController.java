package com.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.model.Product;
import com.springboot.service.ProductService;


@Controller
@RequestMapping("/search/")
public class SearchController {
	
	@Autowired
	ProductService productService;

	@RequestMapping(value="view",method = RequestMethod.GET)
	public String index(ModelMap model
			,@RequestParam(name="k",required=false) String keyName
			,@RequestParam(name="b",defaultValue = "0") int brandCode
			,@RequestParam(name="c",defaultValue = "0") int categoryCode) {
		
		List<Product> list = productService.searchProductByKey(keyName,brandCode,categoryCode);
		
		model.addAttribute("productList", list);
		
		model.addAttribute("brandList", productService.getBrandList());
		
		model.addAttribute("categoryList", productService.getCategoryList());
	
		return "search";
	}
}
