package com.edu.portal.dao;


import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.edu.portal.model.User;


@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {
	Logger log = Logger.getLogger(getClass());
	
	public User findById(int id) {
		return getByKey(id);
	}

	public User findBySSO(String sso) {
		User retUser = null;
		try
		{
			Criteria crit = createEntityCriteria();
			crit.add(Restrictions.eq("ssoId", sso));
			retUser = (User) crit.uniqueResult();
		}
		catch(Exception e)
		{
			 log.debug(e.getMessage());
		}
		
		return retUser;
	}

	
}
