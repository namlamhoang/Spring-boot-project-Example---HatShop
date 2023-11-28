package com.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error/")
public class ErrorController {

	@RequestMapping("access-denied")
	public String accessDenied() {
		return "error";
	}
}
