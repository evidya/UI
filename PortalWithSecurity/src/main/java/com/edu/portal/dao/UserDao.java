package com.edu.portal.dao;

import com.edu.portal.model.User;

public interface UserDao {

	User findById(int id);
	
	User findBySSO(String sso);
	
}

