package com.icook.model;

import java.util.LinkedHashMap;
import java.util.Map;

public class CourseShoppingCart {   
	
	private Map<Integer, CourseOrderBean> cart = new LinkedHashMap<>();
	
	public CourseShoppingCart() {
	}
	
	public Map<Integer, CourseOrderBean>  getContent() { // ${ShoppingCart.content}
		return cart;
	}
	public void addToCart(int courseId, CourseOrderBean codb) {
		
		if (codb.getOrderQty()<= 0 ) {
			return;
		}
		//用map寫判斷是比較好操作
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(courseId) == null ) {
		    cart.put(courseId, codb);
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			CourseOrderBean oiBean = cart.get(courseId);
			// 加購的數量：bean.getQuantity()
			// 原有的數量：oBean.getQuantity()			
			oiBean.setOrderQty(codb.getOrderQty() + oiBean.getOrderQty());
		}
	}

	public boolean modifyQty(int courseId, int newQty) {
		if ( cart.get(courseId) != null ) {
			CourseOrderBean  bean = cart.get(courseId);
		   bean.setOrderQty(newQty);
	       return true;
		} else {
		   return false;
		}
	}
	// 刪除某項商品
	public int deleteBook(int courseId) {
		if ( cart.get(courseId) != null ) {
	       cart.remove(courseId);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return cart.size();
	}
	
//	購物車商品列表
	
	
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
//	public double getSubtotal(){
//		double subTotal = 0 ;
//		Set<Integer> set = cart.keySet();
//		for(int n : set){
//			CourseOrderBean cob = cart.get(n);
//			double price    = cob.getUnitPrice();
//			double discount = cob.getDiscount();
//			int qty      = cob.getQuantity();
//			subTotal +=  price * discount * qty;
//		}
//		return subTotal;
//	}

	
}
