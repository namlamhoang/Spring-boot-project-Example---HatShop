package com.springboot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.model.Message;
import com.springboot.model.User;
import com.springboot.service.AccountService;

@Controller
@RequestMapping("/loginPage/")
public class LoginController {
	
	@Autowired
	AccountService accountService;

	@RequestMapping("view")
	public String loginPage(HttpServletRequest request,HttpSession session) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		// check user login by spring security
		if(!auth.getPrincipal().equals("anonymousUser")) {

			return "redirect:/home/view";
			
		}else {

			return "login";
		}
		
	}
	
	@RequestMapping(value="toRegister",method = RequestMethod.GET)
	public String toRegister(ModelMap model) {

		return "register";
	}

	
	@RequestMapping(value="register",method = RequestMethod.POST)
	public String register(ModelMap model,@ModelAttribute("User") User u ,@RequestParam(value="image",required = false) MultipartFile image) {
		
		Message mess = null;
		
		if(image==null) {
			
			u.setImage(null);
			
			mess = accountService.CreateUser(u);
		}else {
			mess = accountService.CreateUser(u);
		}
		
		if(mess.isError()) {
			
			model.addAttribute("mess", mess);
			
			return "register";
		}
		
		return "login";
	}
}
