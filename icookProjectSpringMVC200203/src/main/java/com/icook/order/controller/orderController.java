package com.icook.order.controller;

import java.io.IOException;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.icook.model.MemberBean;
import com.icook.model.orderBean;
import com.icook.model.orderDetail;
import com.icook.order.service.SearchOrdersServiceDao;

@Controller
public class orderController {

	@Autowired
	SearchOrdersServiceDao service;

	@Autowired
	public void setService(SearchOrdersServiceDao service) {
		this.service = service;
	}

	// @RequestBody這個一般是在處理ajax請求中 contentType:"application/json";
	// charset=utf-8 時候會用到的
	// 如不使用 則回傳沒辦法是本身型態 而是一整個html
	@RequestMapping(value = "/appJson", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String changeJson(@RequestParam(value = "page") String page, Model model, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		HttpSession session = request.getSession(false);
		Gson gson = new Gson();
		MemberBean mem = (MemberBean) session.getAttribute("LoginOK");
		int pag = Integer.parseInt(page);
		session.setAttribute("page", pag);
		int UID = mem.getUserId();
		List<orderBean> orderData = service.searchAllDetails(UID);
		String json = gson.toJson(orderData);
		return json;
	}

	// @RequestParam(value="page", required=false) required代表非必要傳入的參數
	@RequestMapping(value = "/MyOrders/Orders", method = RequestMethod.GET)
	public String SearchOrders(@RequestParam(value = "page", required = false) String page, HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {
		// 如果url沒有帶?page=?進來，則自動導入第一頁
		if (page == null) {
			page = "1";
		}
		HttpSession session = request.getSession(false);
		MemberBean mem = (MemberBean) session.getAttribute("LoginOK");
		// 取得登入者資訊
		if (mem == null) { // 使用逾時
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath()));
			return "index";
		} else {
			session.setAttribute("LogYesNo", "Yes");
			int pag = Integer.parseInt(page);
			session.setAttribute("page", pag);
			int UID = mem.getUserId();
			List<orderBean> orderData = service.searchAllDetails(UID);
			for (int i = 0; i < orderData.size(); i++) {
				switch (orderData.get(i).getStatus()) {
				case "N":
					orderData.get(i).setStatus("未出貨");
					break;
				case "S":
					orderData.get(i).setStatus("出貨中");
					break;
				case "F":
					orderData.get(i).setStatus("已到貨");
					break;
				case "C":
					orderData.get(i).setStatus("已取消");
					break;
				}
			}
			if (orderData.isEmpty()) {
				session.setAttribute("stat", false);
			} else {
				session.setAttribute("stat", true);
			}
			session.setAttribute("orderData", orderData);
			model.addAttribute("orderSize", orderData.size());
			
			//一頁的數量
			int onePageQuantity = 8;
			model.addAttribute("onePageQuantity", onePageQuantity);
			//每一頁的起始號碼
			int pageNo = (pag - 1) * onePageQuantity;
			model.addAttribute("pageNo", pageNo);
			//存放當前頁數的數量 以便知道是不是最後一頁
			int temp = (orderData.size() - pageNo);
			model.addAttribute("onePageTotalQuantity", temp);
			//如果 當前頁數 < 一頁的數量 代表目前頁數為最後一頁 
			int endPage = 0;
			if(orderData.size() != 0) {
				if (temp >= onePageQuantity) {
					endPage = pageNo + onePageQuantity;
					model.addAttribute("endPage", endPage - 1);
				} else {
					endPage = orderData.size();
					model.addAttribute("endPage", endPage - 1);
				}
			}
			else {
				model.addAttribute("endPage", 0);
			}

			// range 帶表總共的頁數
			int range = 0;
			if ((orderData.size() % onePageQuantity) == 0) {
				range = orderData.size() / onePageQuantity;
				model.addAttribute("range", range);
			} else {
				range = (orderData.size() / onePageQuantity) + 1;
				model.addAttribute("range", range);
			}

			return "MyOrders/Orders";
		}
	}

	@RequestMapping(value = "/MyOrders/SearchOrderDetails", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String SearchOrdDetail(@RequestParam(value = "id") String id, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Gson gson = new Gson();
		int orderId = Integer.parseInt(id);
		List<orderDetail> detail = service.searchAllOrdDetails(orderId);
		for (int i = 0; i < detail.size(); i++) {
			if (detail.get(i).getDiscount() == null) {
			} else {
				double discount = Double.valueOf(detail.get(i).getDiscount()) / 10;
				for (double j = 1.0; j <= 9.0; j++) {
					if ((discount * 10) == j) {
						detail.get(i).setDiscount(String.valueOf(Math.round(discount * 10)));
						break;
					} else {
						detail.get(i).setDiscount(String.valueOf(discount * 10));
					}
				}
			}
		}
		String json = gson.toJson(detail);
		return json;
	}

	@RequestMapping(value = "/MyOrders/DeleteOrders", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String DeleteOrders(@RequestParam(value = "delId") String delId,HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false);
		String cancel = " 已取消";
		int page = (int) session.getAttribute("page");
		int orderId = Integer.parseInt(delId);
		service.Delete(orderId);
		return cancel;
	}
}
