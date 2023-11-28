package com.springboot.controller;



import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/blog/")
public class BlobController {
	@RequestMapping(value="view",method = RequestMethod.GET)
	public String home() {
		
		return "blog";
		
	}
}
