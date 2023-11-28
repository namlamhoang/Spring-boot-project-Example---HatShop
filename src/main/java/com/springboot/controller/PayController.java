package com.springboot.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.model.Message;
import com.springboot.model.OrderDetail;
import com.springboot.model.Product;
import com.springboot.service.OrderService;
import com.springboot.service.ProductService;

@Controller
@RequestMapping("/pay/")
public class PayController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="view",method = RequestMethod.GET)
	public String index(ModelMap model,HttpSession session) {
		
		List<OrderDetail> list = (List<OrderDetail>) session.getAttribute("orderList");
		
		int price = orderService.countCartPrice(list);
		
		model.addAttribute("total", price);

		return "pay";
	}
	
	@RequestMapping(value="confirm",method = RequestMethod.GET)
	public String confirm(ModelMap model,HttpSession session
			,@RequestParam(value="p",defaultValue = "1") int p) {
		
		List<OrderDetail> orderList = (List<OrderDetail>) session.getAttribute("orderList");
		
		Message mess = orderService.order(orderList);
		
		if(!mess.isError()) {
			
			model.addAttribute("mess",mess);
			
			session.removeAttribute("orderList");
		} else {
			
			model.addAttribute("mess",mess);
		}
		
		return "pay";
	}

}
