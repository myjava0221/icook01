package com.icook.member.server;

import com.icook.model.MemberBean;
import com.icook.model.ProductOrder;

public interface MemberService {
	
	void insertMem(MemberBean memberBean);

	void updateMem(MemberBean memberBean);

	void save(MemberBean mb);
	
	public void sendOrderConfirmation(ProductOrder productOrder);

	boolean searchAccount(String account);

	MemberBean searchMemberBean(String account);
}
