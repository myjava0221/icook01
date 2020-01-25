package com.icook.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.icook.member.server.MemberService;
import com.icook.model.MemberBean;
import com.icook.register.service.RegisterService;

@Controller
public class MemberController {

	MemberService service;
	RegisterService service2;//呼叫RegisterService

	@Autowired
	public void setService(MemberService service) {
		this.service = service;
	}

	@Autowired
	public void setService2(RegisterService service) {
		this.service2 = service;
	}

	@RequestMapping("/signUp/memRegistrationSuccess2")
	public String RegistrationPage(Model model) {
		return "signUp/memRegistrationSuccess2";
	}

	@RequestMapping("/SignUp/memUpdate")
	public String memUpdatePage(Model model) {
		return "redirect:/signUp/memUpdate";
	}
//	@RequestMapping("redirect:/signUp/memRegistrationSuccess2")
//	public String bacHRegistrationPage(Model model) {
//		return "redirect:/signUp/memRegistrationSuccess2";
//	}

	// 丟空白表單
	// 請求映射 ( 值 = "連結名稱(首頁超連結)", 方法 = 請求方法 . GET )
	@RequestMapping(value = "/SignUp/memberSignUp", method = RequestMethod.GET)
	public String getAddNewMemberForm(Model model) {
		MemberBean mb = new MemberBean();
		// model.添加屬性("MemberBean", mb)
		model.addAttribute("MemberBean", mb);
		// 回傳 "增加產品表單"
		return "signUp/memberSignUp2";
	}

	// 註冊成功頁面
	// 請求映射 ( 值 = "連結名稱" , 方法 = 請求方法 .POST )
	@RequestMapping(value = "/SignUp/memberSignUp", method = RequestMethod.POST) //
	public String RegistrationSuccess(@ModelAttribute("MemberBean") MemberBean mb) {
		// 呼叫service.insertMem(mb)
		service.insertMem(mb);
		// 回傳 重新整理後 轉跳到products
		return "signUp/memRegistrationSuccess2";
	}

	// 會員資料頁面
	// 請求映射 ( 值 = "連結名稱(首頁超連結)", 方法 = 請求方法 . GET )
	@RequestMapping(value = "/SignUp/memUpdate", method = RequestMethod.GET)
	public String getMember(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberBean mb = new MemberBean();
		MemberBean mem = (MemberBean) session.getAttribute("LoginOK");
		mb = service2.checkPassword(mem.getAccount(), mem.getPassword());
		// model.添加屬性("MemberBean", mb)
		model.addAttribute("MemberBean", mb);
		session.setAttribute("LoginOK", mb);
		// 回傳 "會員資料頁面"
		return "signUp/memUpdate";
	}

	// 會員資料修改頁面
	// 請求映射 ( 值 = "連結名稱(首頁超連結)", 方法 = 請求方法 . GET )
	@RequestMapping(value = "/SignUp/memUpdate2", method = RequestMethod.GET)
	public String getMemberUpdate(Model model) {
		MemberBean mb = new MemberBean();
		// model.添加屬性("MemberBean", mb)
		model.addAttribute("MemberBean", mb);
		// 回傳 "回傳會員資料修改表單"
		return "signUp/memUpdate2";
	}

	// 請求映射 ( 值 = "連結名稱" , 方法 = 請求方法 .POST )
	@RequestMapping(value = "/SignUp/memUpdate2", method = RequestMethod.POST) //
	public String UpdateSuccess(@ModelAttribute("MemberBean") MemberBean mb) {
		// 呼叫service.updateMem(mb)

		service.updateMem(mb);
		// 回傳 重新整理後 轉跳到回"會員資料頁面"
		return "redirect:/SignUp/memUpdate";
	}

	
}
