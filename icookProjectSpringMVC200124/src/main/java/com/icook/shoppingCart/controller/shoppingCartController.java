package com.icook.shoppingCart.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.icook.model.MemberBean;
import com.icook.model.ShoppingCart;
import com.icook.model.orderBean;
import com.icook.model.orderDetail;
import com.icook.shoppingCart.service.OrderServiceDao;

@Controller
public class shoppingCartController {
	
	@Autowired
	OrderServiceDao service;
	
	@Autowired
	public void setService(OrderServiceDao service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/ShoppingCar/OrderCheck", method = RequestMethod.GET)
	public String SendOrder(HttpServletRequest request,
			HttpServletResponse response,Model model) {
		HttpSession session = request.getSession(false);
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		ShoppingCart cart2 =(ShoppingCart) session.getAttribute("ShoppingCart2");
		System.out.println("cart:"+cart);
		System.out.println("cart2:"+cart2);
		List<orderDetail> list = new LinkedList<>();
		int k=0;
		for (Object key : cart.getContent().keySet()) {
			orderDetail ord = new orderDetail(null,null,cart.getContent().get(key).getProductId(),
					cart.getContent().get(key).getDescribe(),cart.getContent().get(key).getQty(),
					cart.getContent().get(key).getUnitPrice(),cart.getContent().get(key).getDiscount(),
					cart.getContent().get(key).getTypeId());
            list.add(k, ord);
            k++;
        }
		
//		將未check商品還原
		cart.clearCart();
		cart.getContent().putAll(cart2.getContent());
		cart2.clearCart();
		
//		orderDetail ord1 = new orderDetail(null,null,1,"雞胸肉",5,60,"9.0000",1);
//		orderDetail ord2 = new orderDetail(null,null,2,"平底鍋 紅色",2,500,null,2);
//		orderDetail ord3 = new orderDetail(null,null,3,"高麗菜",10,100,"6.0000",3);
//		List<orderDetail> list = new LinkedList<>();
//		list.add(0, ord1);
//		list.add(1, ord2);
//		list.add(2, ord3);
		
		
		double total=0,allTotal=0;;
		for (int i = 0; i < list.size(); i++) {
			System.out.println("discount:"+list.get(i).getDiscount());
			total = 0;
			if (list.get(i).getDiscount() == null) {
				total = list.get(i).getUnitPrice() * list.get(i).getQty();
				allTotal += total;
			} 
			else {
				double discount = Double.valueOf(list.get(i).getDiscount()) / 10;
				for (double j = 1.0; j <= 9.0; j++) {
					if ((discount * 10) == j) {
						list.get(i).setDiscount(String.valueOf(Math.round(discount * 10)));
						break;
					} else {
						list.get(i).setDiscount(String.valueOf(discount * 10));
						
					}
				}
				total = list.get(i).getUnitPrice() * list.get(i).getQty() * discount;
				allTotal += total;
			}
		}
		int freight = 20;
		session.setAttribute("ShoppingOrder",list);
		model.addAttribute("freight", freight);
		model.addAttribute("totalMoney", allTotal);
		session.setAttribute("total", allTotal + freight);
		return "shoppingCart/OrderCheck";
	}
	
	@RequestMapping(value = "/ShoppingCar/CheckOrder", method = RequestMethod.GET)
	public String CheckOrder(HttpServletRequest request,
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
			session.removeAttribute("ShoppingOrder");
			return "index";
		}
		else {
			System.out.println("--------------ORDER--------------");
			MemberBean mem = (MemberBean)session.getAttribute("LoginOK");
			// 取得登錄者資訊
			@SuppressWarnings("unchecked")
			List<orderDetail> SCar = (List<orderDetail>)session.getAttribute("ShoppingOrder");
			// 取得購物車資料
			if(mem == null || SCar == null) {
				response.sendRedirect(response.encodeRedirectURL(request.getContextPath()));
				return "index";
			}
			else {
				String ShippingAddress = (String)request.getParameter("ShippingAddress");
				String email = (String)request.getParameter("Email");
				String invoiceTitle = (String)request.getParameter("invoiceTitle");
				if(invoiceTitle == "") {
					invoiceTitle = null;
				}
				//判斷invoiceTitle 有沒有輸入 無則為null
				double total = (double)session.getAttribute("total");
				//取得總金額
				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS");
				String date = sdFormat.format(new Date());
				// date取得今天的日期
				orderBean order = new orderBean(null,mem.getUserId(),total,ShippingAddress,email,invoiceTitle,date,null,"N");
				//存放訂單資訊
				String res = service.FinalDealFinish(order,SCar);
				if(res.equals("true")) {
					int uid = service.retUserId(order);
					session.setAttribute("UID",uid);
					session.removeAttribute("ShoppingOrder");
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
