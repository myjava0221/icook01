package com.icook.register.dao;

import com.icook.model.MemberBean;

public interface RegisterDao {
	MemberBean checkPassword(String account, String password);
}
