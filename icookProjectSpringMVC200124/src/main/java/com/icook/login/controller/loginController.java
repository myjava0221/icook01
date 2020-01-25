package com.icook.login.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.icook.model.MemberBean;
import com.icook.register.service.RegisterService;

@Controller
public class loginController {
	RegisterService service;

	@Autowired
	public void setService(RegisterService service) {
		this.service = service;
	}

	@RequestMapping("/")
	public String homePage(Model model) {
		return "index";
	}
	
	@RequestMapping("/login/index")
	public String bacHhomePage(Model model) {
		return "redirect:/index";
	}

	// 從導覽列進入登入畫面
	// 提供登入表單用GET
	@GetMapping("/login/loginView")
	public String getLoginForm(Model model) {
		String account = null;
		String password = null;
		model.addAttribute("account", account);
		model.addAttribute("password", password);
		return "login/loginView";
	}

	// 登入成功後進入首頁
	// 登入失敗還沒設定
	@PostMapping(value = "/login/loginView")
	public void loginCheck(@RequestParam("account") String account, 
							@RequestParam("password") String password,
							HttpServletRequest request,
							HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		// 定義存放錯誤訊息的Map物件
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		// 將errorMsgMap放入request物件內，識別字串為 "ErrorMsgKey"
		request.setAttribute("ErrorMsgKey", errorMsgMap);

//		ServletContext sc = getServletContext();
//		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sc);

		String requestURI = (String) session.getAttribute("requestURI");
		System.out.println("進入Servlet，requestURI: "+requestURI);
		MemberBean mb = null;

		// 4. 進行 Business Logic 運算
		// 將MemberServiceImpl類別new為物件，存放物件參考的變數為 loginService
		try {
			// 呼叫 loginService物件的 checkIDPassword()，傳入userid與password兩個參數
			mb = service.checkPassword(account, password);
			if (mb != null) {
				// OK, 登入成功, 將mb物件放入Session範圍內，識別字串為"LoginOK"
				session.setAttribute("LoginOK", mb);
			} else {
				// NG, 登入失敗, userid與密碼的組合錯誤，放相關的錯誤訊息到 errorMsgMap 之內
				errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
			}
		} catch (RuntimeException ex) {
			errorMsgMap.put("LoginError", ex.getMessage());
		}

		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		// 如果 errorMsgMap 是空的，表示沒有任何錯誤，交棒給下一棒
		if (errorMsgMap.isEmpty()) {
			if (requestURI != null) {
				requestURI = (requestURI.length() == 0 ? request.getContextPath() : requestURI);
				try {
					response.sendRedirect(response.encodeRedirectURL(requestURI));
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				try {
					response.sendRedirect(response.encodeRedirectURL(request.getContextPath()));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp
		}
	}
		
		@RequestMapping("/login/logout")
		public String redirectA(Model model) {
		    return "login/logout";
		}

	}


