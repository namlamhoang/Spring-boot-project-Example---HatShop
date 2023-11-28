package com.springboot.service;


import com.springboot.model.Message;
import com.springboot.model.User;

public interface AccountService {
	
	User getUser(String userName);

	Message CreateUser(User u);
	
	Message UpdateUser(User u);

}
