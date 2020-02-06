package com.icook.courseOrder.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.icook.course.service.CourseService;
import com.icook.model.CourseBean;
import com.icook.model.CourseOrderBean;
import com.icook.model.MemberBean;
import com.icook.model.orderBean;
import com.icook.shoppingCart.service.OrderServiceDao;

@Controller
public class CourseOrderController {

	CourseService service;
	OrderServiceDao oService;

	@Autowired
	public void setService(CourseService service) {
		this.service = service;
	}
	@Autowired
	public void setoService(OrderServiceDao oService) {
		this.oService = oService;
	}
	

	ServletContext context;
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	// 單筆課程詳細資訊
	@GetMapping("/courseOrder/courseInfo")
	public String showCourseInformation(Model model, @RequestParam(value = "id", required = false) Integer id,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String requestURI = (String) session.getAttribute("requestURI");
//		System.out.println("courseInfo 的URL: " + requestURI);
//		System.out.println("id: " + id);

		if (id == null) {
			return "redirect:/course/courseHomePage";
		}
		
		model.addAttribute("course", service.getCourseById(id));
		model.addAttribute("courseStock", service.courseStock(id));
//			購物車用參數
		Integer courseId = null;
		Integer orderQty = 0;
		model.addAttribute("courseId", courseId);
		model.addAttribute("orderQty", orderQty);

		return "course/courseInfo";
	}

////	課程加入購物車
//	@PostMapping("/courseOrder/courseInfo")
//	public String addCourseCart(Model model, 
//			@RequestParam("courseId") Integer courseId,
//			@RequestParam("orderQty") Integer orderQty, HttpServletRequest request, HttpServletResponse response) {
//		
//		// 只要舊的Session物件，如果找不到，不要建立新的Session物件，直接傳回 null
//		HttpSession session = request.getSession(false);
//		if (session == null) {
//			// 請使用者登入
//			return "login/loginView";
//		}
//
//		// 取出存放在session物件內的ShoppingCart物件
//		CourseShoppingCart cart = (CourseShoppingCart) session.getAttribute("CourseShoppingCart");
//		System.out.println("cart:" + cart);
//		// 如果找不到ShoppingCart物件
//		if (cart == null) {
//			// 就新建ShoppingCart物件
//			cart = new CourseShoppingCart();
//			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
//			session.setAttribute("CourseShoppingCart", cart);
//		}
////		Map<Integer, CourseBean> courseMap = (Map<Integer, CourseBean>) session.getAttribute("courses_DPP");
//		CourseBean bean = service.getCourseById(courseId);
//
////		 將訂單資料(價格，數量，折扣與BookBean)封裝到OrderItemBean物件內
////		Integer orderId,Integer courseId,Integer orderQty,Integer coursePrice
//		CourseOrderBean cb = new CourseOrderBean(null, courseId, orderQty);
//		// 將OrderItem物件內加入ShoppingCart的物件內
//		cart.addToCart(courseId, cb);
//
//		return "redirect:/course/courseHomePage";
//	}

//	課程資訊: Id、數量、商品資訊...等
//	購買課程
	@PostMapping("/courseOrder/courseInfo")
	public String sendurseInformation(Model model,
			@RequestParam(value = "courseId") Integer courseId,
			@RequestParam(value = "orderQty") Integer orderQty,
			HttpServletRequest request, HttpServletResponse response) {
//		System.out.println("進入controller: sendurseInformation");
//		CourseBean cb = service.getCourseById(courseId);
//		model.addAttribute("CourseBean", cb);
//		model.addAttribute("orderQty", orderQty);
		
		return "course/courseCart";
	}
	
	@GetMapping("/courseOrder/courseCart")
	public String SendOrder(Model model,
			@RequestParam(value = "courseId") Integer courseId,
			@RequestParam(value = "orderQty") Integer orderQty,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("進入controller: SendOrder");
		HttpSession session = request.getSession(false);
		if (session == null) { // 使用逾時
			return "index";
		}
//		
//		// 取出session物件內的ShoppingCart物件
////		CourseShoppingCart cart = (CourseShoppingCart) session.getAttribute("CourseShoppingCart");
////		System.out.println("Controller: " +cart.getContent().keySet());
////		Map<Integer, CourseBean> courseMap = service.courseCartList(cart.getContent().keySet());
//		if (cart == null) {
//			// 如果找不到購物車(通常是Session逾時)，沒有必要往下執行
//			// 導向首頁
//			return "index";
//		}
////		Map<Integer, CourseBean> cartDetail = service.courseODMap(cart.getContent().keySet());
//		model.addAttribute("CourseShoppingCart", cart);
//		model.addAttribute("cartDetail", cartDetail);
//		System.out.println("cart: " + cart.getContent().keySet());
//		System.out.println("courseMap: " + courseMap.get(cart.getContent().keySet()));
		CourseBean cb = service.getCourseById(courseId);
		model.addAttribute("CourseBean", cb);
		model.addAttribute("orderQty", orderQty);
		
//		session.setAttribute("ShoppingOrder",list); 
		return "course/courseCart";
	}
	
	@PostMapping("/courseOrder/courseCart")
	public String CheckOrder(HttpServletRequest request,
			@RequestParam(value = "courseId") Integer courseId,
			@RequestParam(value = "orderQty") Integer orderQty,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		//返回的主頁面的網址
		if (session == null) {   // 使用逾時
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath()));
			return "index";
		}
		String finalDecision = (String)request.getParameter("finalDecision");
		//取得使用者最終的決定 送出訂單則為ORDER 取消訂單則為CANAEL 
		if(finalDecision.equals("CANCEL")) {
			System.out.println("--------------CANCEL---------------");
			return "index";
		}
		else {
			System.out.println("--------------ORDER--------------");
			MemberBean mem = (MemberBean)session.getAttribute("LoginOK");
			List<CourseOrderBean> cobL = new ArrayList<CourseOrderBean>();
			CourseBean cb = service.getCourseById(courseId);
			CourseOrderBean cob = new CourseOrderBean(null, null, courseId, orderQty);
			cobL.add(cob);
			
			// 取得登錄者資訊
//			CourseOrderBean cob = service.getCourseById(courseId);
			// 取得購物車資料
			if(mem == null || courseId == null) {
				response.sendRedirect(response.encodeRedirectURL(request.getContextPath()));
				return "index";
			}
			else {
				System.out.println("---------------1--------------");
				String ShippingMail = (String)request.getParameter("ShippingMail");
				String invoiceTitle = (String)request.getParameter("invoiceTitle");
				String ShippingAddress = null;
				if(invoiceTitle == "") {
					invoiceTitle = null;
				}
				double total =(double)cb.getCoursePrice()*cb.getCourseDiscount()*orderQty;
				System.out.println("total: " + total);
				//取得總金額
				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS");
				String date = sdFormat.format(new Date());
				// date取得今天的日期
				orderBean order = new orderBean(null,mem.getUserId(),total,ShippingAddress,ShippingMail,invoiceTitle,date,null,"N");
				System.out.println("-----------------------------");
				//存放訂單資訊
				String res = oService.FinalCourseFinish(order, cobL);
				System.out.println("res: " + res);
				if(res.equals("true")) {
					int uid = oService.retUserId(order);
					session.setAttribute("UID",uid);
//					session.removeAttribute("ShoppingOrder");
					return "shoppingCart/TheDealFinish";
				}
				else {
					System.out.println("--------------error---------------");
					response.sendRedirect(response.encodeRedirectURL(request.getContextPath()));
					return "index";
				}
			}
		}
	}
}
