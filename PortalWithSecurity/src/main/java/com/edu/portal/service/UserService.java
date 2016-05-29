package com.edu.portal.service;

import com.edu.portal.model.User;

public interface UserService {

	User findById(int id);
	
	User findBySso(String sso);
	
}