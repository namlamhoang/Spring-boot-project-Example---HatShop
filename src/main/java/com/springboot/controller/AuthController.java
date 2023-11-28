package com.springboot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.model.User;
import com.springboot.service.AccountService;

@Controller
public class AuthController {
	
	@Autowired
	AccountService accountService;

	@RequestMapping(value={"index","/"})
	public String index(HttpServletRequest request,HttpSession session) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		// check user login by spring security
		if(!auth.getPrincipal().equals("anonymousUser")) {
			
			User a = accountService.getUser(auth.getName());
			
			// add infor user to session
			session.setAttribute("user", a);

			if(auth.getAuthorities().stream()
			          .anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN"))) {
				
				// add user role to session
				session.setAttribute("role","ROLE_ADMIN");
				
				return "redirect:/system/view";
				
			} else if (auth.getAuthorities().stream()
			          .anyMatch(r -> r.getAuthority().equals("ROLE_EMPLOYEE"))) {
				
				// add user role to session
				session.setAttribute("role","ROLE_EMPLOYEE");
				
				return "redirect:/employee/view";
				
			} else {
				
				// add user role to session
				session.setAttribute("role","ROLE_CUSTOMER");
				
				return "redirect:/home/view";
			}
			
		}else {
			
			// remove user infor
			session.removeAttribute("user");
			
			return "redirect:/home/view";
		}

	}

}
