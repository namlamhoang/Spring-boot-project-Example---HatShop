package com.springboot.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.dao.AuthoritiesDao;
import com.springboot.dao.UsersDao;
import com.springboot.model.Authorities;
import com.springboot.model.Message;
import com.springboot.model.User;

@Service
@Transactional
public class AcountServiceImpl implements AccountService {
	
	@Autowired
	UsersDao usersDao;
	
	@Autowired
	AuthoritiesDao authoritiesDao;

	@Override
	public User getUser(String userName) {

		Optional<User> user = usersDao.findById(userName);

		if(user.isPresent()) {

			return user.get();

		}else {

			return null;
		}
			
	}

	@Override
	public Message CreateUser(User u) {
		
		if(this.getUser(u.getUserName())==null) {
			
			u.setEnabled(1);
			
			u.setPassword("{noop}"+u.getPassword());
			
			usersDao.save(u);
			
			authoritiesDao.save(new Authorities(u.getUserName(),"ROLE_CUSTOMER"));
			
			return new Message();
		}
		
		return new Message(true, "Username already used");
	}

	@Override
	public Message UpdateUser(User u) {
		// TODO Auto-generated method stub	
		return null;
	}

}
