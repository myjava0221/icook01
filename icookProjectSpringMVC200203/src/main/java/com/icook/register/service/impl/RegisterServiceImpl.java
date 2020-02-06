package com.icook.register.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icook.model.MemberBean;
import com.icook.register.dao.RegisterDao;
import com.icook.register.service.RegisterService;

@Service
public class RegisterServiceImpl implements RegisterService {
	RegisterDao dao;
	
	@Autowired
	public void setDao(RegisterDao dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public MemberBean checkPassword(String account, String password) {
		System.out.println("進入Srevice");
		return dao.checkPassword(account, password);
	}

}
