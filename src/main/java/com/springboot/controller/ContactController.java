package com.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
@RequestMapping("/contact/")
public class ContactController {
	@RequestMapping(value="view",method = RequestMethod.GET)
	public String home() { 
	
		return "contact";
		
	}
}
