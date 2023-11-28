package com.springboot.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.dao.UsersDao;
import com.springboot.model.User;




@Controller
@RequestMapping("/info/")
public class UpdatepassController {
	@Autowired
	UsersDao dao;
	@RequestMapping(value="view",method = RequestMethod.GET)
	public String home() { 
		
		
		return "updatePass";
		
	}
	@RequestMapping(value="updateUser",method = RequestMethod.POST)
	public String updateUser(Model model
			,@RequestParam("username") String userName
			,@RequestParam("oldpassword") String oldpassword
			,@RequestParam("newpassword") String newpassword
			,@RequestParam("newwpassword") String newwpassword
			)  {
		int trangthai;
		User u = dao.getById(userName);
		System.out.println(u.getPassword());
		System.out.println(oldpassword);
		if(u.getPassword().equals("{noop}"+oldpassword)) {
			if(newpassword.equals(newwpassword)) {
				u.setPassword("{noop}"+newpassword);
				dao.save(u);
				System.out.println("thanh cong");
				trangthai = 1;
			}else {
				trangthai = 3;
			}
		}else {
			System.out.println("thất bại");
			trangthai = 2;
		}
		model.addAttribute("trangthai",trangthai);
		
		
		return "updatePass";
	}
}
