package com.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springboot.service.AccountService;


@Controller
@RequestMapping("/account/")
public class CustomerController {
	
	@Autowired
	AccountService accountService;

	@RequestMapping(value="changePassword",method = RequestMethod.POST)
	public String changePassword(ModelMap model) {
		
		
		
		return "redirect:/home/view";
	}
	
}
