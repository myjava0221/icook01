package com.icook.register.service;

import com.icook.model.MemberBean;

public interface RegisterService {
	MemberBean checkPassword(String account, String password);
}
