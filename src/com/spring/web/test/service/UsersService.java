package com.spring.web.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import com.spring.web.test.dao.Offer;
import com.spring.web.test.dao.OffersDAO;
import com.spring.web.test.dao.User;
import com.spring.web.test.dao.UsersDAO;

@Service("usersService")
public class UsersService {
	
	private UsersDAO usersDao;
	
	@Autowired
	public void setOffersDao(UsersDAO usersDao) {
		this.usersDao = usersDao;
	}

	public void create(User user) {
		usersDao.create(user);
	}

	public boolean exists(String username) {
		
		return usersDao.exists(username);
	}

	@Secured("ROLE_ADMIN")
	public List<User> getAllUsers() {
		
		return usersDao.getAllUsers();
	}

}
