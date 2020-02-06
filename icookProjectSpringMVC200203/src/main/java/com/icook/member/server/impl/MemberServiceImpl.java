package com.icook.member.server.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icook.member.dao.MemberDao;
import com.icook.member.server.MemberService;
import com.icook.member.server.mailService;
import com.icook.model.MemberBean;
import com.icook.model.ProductOrder;





@Service
public class MemberServiceImpl implements MemberService {
	MemberDao dao;
	
	@Transactional
	@Override
	public void save(MemberBean mb) {
		dao.insertMem(mb);
	}
    
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
    
    
    @Autowired
    mailService mailService;
    
	@Override
	public void sendOrderConfirmation(ProductOrder productOrder) {
		mailService.sendEmail(productOrder);
	}
	
	
	@Transactional
	@Override
	public boolean searchAccount(String account) {
		return dao.searchAccount(account);
		
	}
	
	@Transactional
	@Override
	public MemberBean searchMemberBean(String account) {
		return dao.searchMemberBean(account);
	}
   
}