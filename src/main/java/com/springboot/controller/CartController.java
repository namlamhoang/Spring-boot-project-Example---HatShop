package com.springboot.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.springboot.model.OrderDetail;
import com.springboot.service.OrderService;
import com.springboot.service.ProductService;


@Controller
@RequestMapping("/cart/")
public class CartController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="view",method = RequestMethod.GET)
	public String index(ModelMap model) {
		
		model.addAttribute("productList", productService.getProductList());
		
		return "cart";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="addAndViewCart",method = RequestMethod.GET)
	public String addAndViewCart(ModelMap model,HttpSession session
		,@RequestParam(value="p",defaultValue = "1",required = false) int productCode
		,@RequestParam(value = "q" ,defaultValue = "1",required = false) int quantity) {
		
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		
		if(session.getAttribute("orderList") == null) {
			
			list = orderService.addCart(productCode, quantity,list);
			
		}else {
			
			list = orderService.addCart(productCode, quantity, ((List<OrderDetail>) session.getAttribute("orderList")));
		}
		
		session.setAttribute("orderList", list);
		
		model.addAttribute("productList", productService.getProductList());
		
		return "cart";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="addCart",method = RequestMethod.POST)
	public ResponseEntity<List<OrderDetail>>  addCart(ModelMap model,HttpSession session
		,@RequestParam(value="p",defaultValue = "1",required = false) int productCode
		,@RequestParam(value = "q" ,defaultValue = "1",required = false) int quantity) {
		
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		
		if(session.getAttribute("orderList") == null) {
			
			list = orderService.addCart(productCode, quantity,list);
			
		}else {
			
			list = orderService.addCart(productCode, quantity, ((List<OrderDetail>) session.getAttribute("orderList")));
		}
		
		session.setAttribute("orderList", list);

		return new ResponseEntity<List<OrderDetail>> (list,HttpStatus.OK);
	}
	
	@RequestMapping(value="saveCart",method = RequestMethod.POST)
	public String saveCart(ModelMap model,HttpSession session
		,@RequestParam(value="p",defaultValue = "1",required = false) int productCode
		,@RequestParam(value = "q" ,defaultValue = "1",required = false) int quantity
		,@RequestParam(value="odl") String odl) throws Exception {
		
		session.setAttribute("orderList", orderService.saveCart(odl));
		
		model.addAttribute("productList", productService.getProductList());
		
		return "cart";
	}
}
