package com.icook.member.validator;

import org.springframework.stereotype.Component;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.icook.model.MemberBean;



@Component
public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
//		System.out.println(clazz.getName());
		boolean b = MemberBean.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberBean mb = (MemberBean)target;
		ValidationUtils.rejectIfEmptyOrWhitespace
			(errors, "account", "member.account.not.empty","帳號欄不能空白(預設值)");
		ValidationUtils.rejectIfEmptyOrWhitespace
			(errors, "nickname", "member.name.not.empty","暱稱欄不能空白(預設值)");
		ValidationUtils.rejectIfEmptyOrWhitespace
		(errors, "lastname", "member.name.not.empty","姓欄不能空白(預設值)");
		ValidationUtils.rejectIfEmptyOrWhitespace
		(errors, "firstname", "member.name.not.empty","名欄不能空白(預設值)");
		ValidationUtils.rejectIfEmptyOrWhitespace
		(errors, "birthday", "", "生日欄不能空白(MemberValidator)");
		ValidationUtils.rejectIfEmptyOrWhitespace
		(errors, "phone", "","電話不能是空白");
		if (!mb.getAccount().contains("@")) {
			errors.rejectValue("account","", "信箱格式錯誤.");
		}
		
		if (mb.getAccount().length()<10) {
			errors.rejectValue("account","", "信箱欄不會小於十個字元");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace
		(errors, "address", "","地址不能是空白");
//		Double d = member.getWeight();

	

	}

}
