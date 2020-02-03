package com.icook.shoppingCart.controller;

import java.io.UnsupportedEncodingException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.icook.model.ProductBean;
import com.icook.model.ShoppingCart;
import com.icook.model.orderItem;
import com.icook.shoppingCart.service.shoppingCartService;

@Controller
@Scope("singleton") // 只实例化一个bean对象（即每次请求都使用同一个bean对象），默认是singleton
public class ProductListController {
	private static String hexString = "0123456789ABCDEF"; //此處不可隨意改動methodStringToHex要用到;
	shoppingCartService service;
	@Autowired
	public void setService(shoppingCartService service) {
		this.service = service;
	}
	
	@GetMapping(value = "/productSearch")
	public String productSearch_get() {
		return "shoppingCart/productSearch";
	}
	@PostMapping(value = "/productSearch")
	public String productSearch_post() {
		return "shoppingCart/productSearch";
	}
	
	@GetMapping(value = "shoppingCart/productList")
	public String productList_get(Model model, HttpServletRequest request) {
		System.out.println("進入controller1");
		HttpSession session = request.getSession(false);
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		System.out.println("cart0:" + cart);
		if (cart == null) {
			cart = new ShoppingCart();
			session.setAttribute("ShoppingCart", cart);
		}
		String productName = request.getParameter("productName");
		List<ProductBean> products = new LinkedList<ProductBean>();
		List<String[]> prosImg = new LinkedList<String[]>();
		if (productName == null) {
			System.out.println("products is null.");
			products = service.getAllProduct();
			
//			將字串用split(",")分割成陣列
			for(ProductBean p : products) {
				String imgString = p.getImage1().trim();
//				System.out.println(imgString);
				String[] productsImg = imgString.split(",");
				prosImg.add(productsImg);
			}
			
		} else {
			System.out.println("products is not null.");
			products = service.queryProduct(productName);
			for(ProductBean p : products) {
				String imgString = p.getImage1().trim();
				String[] productsImg = imgString.split(",");
				prosImg.add(productsImg);
			}
		}
		model.addAttribute("prosList", products);
		model.addAttribute("ImgList", prosImg);
		orderItem oib = new orderItem();
		model.addAttribute("orderItem", oib);
		return "shoppingCart/productList";
	}

	@PostMapping(value = "shoppingCart/productList" ,produces = "application/json; charset=utf-8")
	public ModelAndView productList_post(
			@ModelAttribute("orderItem") orderItem oib, 
			HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		System.out.println("進入controller2");
		String productName = request.getParameter("productName");
		System.out.println("productName:"+productName);
		
		if(productName!=null) {
//			呼叫StringToHex(中文字串)，將中文字串轉16進制
			mv.setViewName("redirect:productList?productName="+StringToHex(productName));
			return mv;
		}else{
			mv.setViewName("redirect:productList");
			return mv;
		}
	}

	@PostMapping(value="shoppingCart/addToCar")
	@ResponseBody
		public int addToCar(
				@ModelAttribute("orderItem") orderItem oib, 
				HttpServletRequest request,
				HttpServletResponse response
				) throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView();
		System.out.println("進入controller加入購物車");
		HttpSession session = request.getSession(false);
		String productName = request.getParameter("productName");
		
//		處理將空字串轉為null
		if(oib.getDiscount().isEmpty() && oib.getDiscount().length()==0) {
			System.out.println("isEmpty");
			oib.setDiscount(null);
		}else {
			Double discount = 10*Double.valueOf(oib.getDiscount());
			oib.setDiscount(discount.toString());
		}
		
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		System.out.println("cart:" + cart);
		if (cart == null) {
			cart = new ShoppingCart();
			session.setAttribute("ShoppingCart", cart);
		}
		String MapKey = oib.getProductId() + "_" + oib.getTypeId();
		cart.addToCart(MapKey, oib);
		return cart.getItemNumber();
	}

	
	@RequestMapping(value = "/productList/productDetail")
	public ModelAndView productDetail(
			HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("進入controller");
		ModelAndView modelAndView = new ModelAndView("shoppingCart/productDetail");
		return modelAndView;
	}

	@GetMapping(value = "shoppingCart/shopCart")
	public String shoppingCart(Model model, @ModelAttribute("orderItem") orderItem oib, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");

		if (cart == null) {
			cart = new ShoppingCart();
			session.setAttribute("ShoppingCart", cart);
		} else {
			System.out.println("Cart" + cart.getContent());
		}
		model.addAttribute("ShoppingCart", cart);
		return "shoppingCart/shopCart";
	}

	@PostMapping(value = "shoppingCart/shopCart" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String UpdateICookServlet(Model model, @ModelAttribute("orderItem") orderItem oib,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		System.out.println("cart:" + cart);
		if (cart == null) {
			cart = new ShoppingCart();
			session.setAttribute("ShoppingCart", cart);
		}
		Gson gson = new Gson();
		String cmd = request.getParameter("cmd");
		
//		String pid_ptyStr = request.getParameter("mapKey");
//		String pid_pty = pid_ptyStr.trim();
		String itemNumber = "";
		if (cmd.equalsIgnoreCase("DEL")) {
			String pid_ptyStr = request.getParameter("mapKey");
			List<String> pid_ptyStrList = gson.fromJson(pid_ptyStr, new TypeToken<List<String>>() {}.getType());
			
			for(int i=0;i<pid_ptyStrList.size();i++) {
				cart.deleteProduct(pid_ptyStrList.get(i));
			}
			itemNumber = String.valueOf(cart.getItemNumber());
			return itemNumber;
		} else if (cmd.equalsIgnoreCase("MOD")) {
			String pid_ptyStr = request.getParameter("mapKey");
			String pid_pty = pid_ptyStr.trim();
			String newQtyStr = request.getParameter("qty");
			int newQty = Integer.parseInt(newQtyStr.trim());
			cart.modifyQty(pid_pty, newQty); // 修改某項商品的數項
			itemNumber = String.valueOf(cart.getItemNumber());
			System.out.println("itemNumber:"+itemNumber);
			return itemNumber;
		}
		return itemNumber;
	}
	
	//中文字串 轉 16進制
	public static String StringToHex(String str) {
		   // 根據預設編碼獲取位元組陣列
		   byte[] bytes = str.getBytes();
		   StringBuilder sb = new StringBuilder(bytes.length * 2);
		   // 將位元組陣列中每個位元組拆解成2位16進位制整數
		   for (int i = 0; i < bytes.length; i++) {
		    sb.append(hexString.charAt((bytes[i] & 0xf0) >> 4));
		    sb.append(hexString.charAt((bytes[i] & 0x0f) >> 0));
		   }
		   
		   String HexString = sb.toString();
		   String queryVariable="";
	       for(int i=0;i<HexString.length();i+=2) {
	    	   	queryVariable += "%"+HexString.substring(i,i+2);
	        }
		   return queryVariable;
		}
}