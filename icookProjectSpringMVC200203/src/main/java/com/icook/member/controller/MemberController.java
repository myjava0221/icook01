package com.icook.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.icook.member.server.MemberService;
import com.icook.member.validator.MemberValidator;
import com.icook.model.CustomerInfo;
import com.icook.model.MemberBean;
import com.icook.model.ProductOrder;
import com.icook.register.service.RegisterService;

@Controller
public class MemberController {
	@Autowired
	MemberService service;

	@Autowired
	RegisterService service2;// 呼叫RegisterService

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
	public String RegistrationSuccess(@ModelAttribute("MemberBean") MemberBean mb, BindingResult result) {
		MemberValidator validator = new MemberValidator();
		validator.validate(mb, result);
		if (result.hasErrors()) {
//          下列敘述可以理解Spring MVC如何處理錯誤			
//			List<ObjectError> list = result.getAllErrors();
//			for (ObjectError error : list) {
//				System.out.println("有錯誤：" + error);
//			}
			return "signUp/memberSignUp2";
		}
		try {
			service.save(mb);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			result.rejectValue("account", "", "帳號已存在，請重新輸入");
			return "signUp/memberSignUp2";
		}
//		catch (Exception ex) {
//			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
//			result.rejectValue("account", "", "請通知系統人員...");
//			return "signUp/memberSignUp2";
//		}
		// 呼叫service.insertMem(mb)
		// service.insertMem(mb);
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

	@ModelAttribute // Map${路徑寫在這裡}
	public void commonData(Model model) {
		Map<String, String> genderMap = new HashMap<>();
		genderMap.put("男生", "男生");
		genderMap.put("女生", "女生");
		genderMap.put("其他", "其他");
		model.addAttribute("genderMap", genderMap);// 性別

	}
	// 丟空白表單
	@RequestMapping(value = "/signUp/forgetPassword", method = RequestMethod.GET)
	public String getforgetPassword() {
		return "signUp/forgetPassword";
	}
	
	@RequestMapping(value = "/signUp/forgetPassword", method = RequestMethod.POST)
	public String getaccAccount(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String account = request.getParameter("account");
		session.setAttribute("account", account);
		Boolean aaa = service.searchAccount(account);
		if(aaa == true) {
			return "redirect:/sendmail";
		}
		else {
			return null;
		}
	}
	
	
	
	
	@RequestMapping(value = "/sendmail", method = RequestMethod.GET)
	public String sendEmail(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String account = (String)session.getAttribute("account");
		MemberBean temp = service.searchMemberBean(account);
		service.sendOrderConfirmation(getDummyOrder(temp));
		return "index";
	}
	
	public static ProductOrder getDummyOrder(MemberBean memberBean){
        ProductOrder order = new ProductOrder();
        order.setOrderId(memberBean.getPassword());
        order.setProductName("Thinkpad T510");
        order.setStatus("confirmed");
         
        CustomerInfo customerInfo = new CustomerInfo();
        customerInfo.setName("這是測試這是測試");
        customerInfo.setAddress("WallStreet");
        customerInfo.setEmail(memberBean.getAccount());
        order.setCustomerInfo(customerInfo);
        return order;
    }
}
