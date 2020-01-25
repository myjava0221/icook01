package com.icook.member.server.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icook.member.dao.MemberDao;
import com.icook.member.server.MemberService;
import com.icook.model.MemberBean;



@Service
public class MemberServiceImpl implements MemberService {
	MemberDao dao;
    
	@Autowired
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
    
   
    @Transactional
	@Override
	public void insertMem(MemberBean memberBean) {
		dao.insertMem(memberBean);
	}
    
    @Transactional
	@Override
	public void updateMem(MemberBean memberBean) {
		dao.updateMem(memberBean);
	}
    
   
}