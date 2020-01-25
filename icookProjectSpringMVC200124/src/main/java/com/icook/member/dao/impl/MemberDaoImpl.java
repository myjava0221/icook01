package com.icook.member.dao.impl;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icook.member.dao.MemberDao;
import com.icook.model.MemberBean;
 


@Repository
public class MemberDaoImpl implements MemberDao {
	SessionFactory factory;
	

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public void insertMem(MemberBean memberBean) {// 將新增會員資料放入資料庫
		Session session = factory.getCurrentSession();
		session.save(memberBean);
	}

	@Override
	public void updateMem(MemberBean memberBean) {// 更新會員資料
		Session session = factory.getCurrentSession();
		session.update(memberBean);
	}

	@Override
	public void InquireMem(MemberBean memberBean) {// 查詢
		Session session = factory.getCurrentSession();

	}
	

  
  

}