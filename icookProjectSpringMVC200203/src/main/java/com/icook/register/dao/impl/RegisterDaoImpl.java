package com.icook.register.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icook.register.dao.RegisterDao;
import com.icook.model.MemberBean;

@Repository
public class RegisterDaoImpl implements RegisterDao {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public MemberBean checkPassword(String account, String password) {
		String hql = "FROM MemberBean m WHERE m.account = :acc and m.password = :pswd";
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		mb = (MemberBean) session.createQuery(hql).setParameter("acc", account).setParameter("pswd", password).getSingleResult();
		System.out.println("進入DAO: " + mb.getNickname());
		
		return mb;
		
	}

}
