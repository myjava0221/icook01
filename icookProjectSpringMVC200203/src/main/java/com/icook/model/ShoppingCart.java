package com.icook.model;

import java.util.LinkedHashMap;
import java.util.Map;
public class ShoppingCart {   
	private Map<String, orderItem> cart = new LinkedHashMap<>();
	private double subTotal;
	
	public ShoppingCart() {
	}
	
	public Map<String, orderItem>  getContent() { // ${ShoppingCart.content}
		return cart;
	}
	public void addToCart(String proId_typeId, orderItem oib) {
		if (oib.getQty() <= 0 ) {
			return;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(proId_typeId) == null ) {
		    cart.put(proId_typeId, oib);
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			orderItem oiBean = cart.get(proId_typeId);
			// 加購的數量：bean.getQuantity()
			// 原有的數量：oBean.getQuantity()
			// 更新的數量:oib.getQty()
//			oiBean.setQty(oib.getQty() + oiBean.getQty());
			oiBean.setQty(+oib.getQty());
		}
	}

	public boolean modifyQty(String proId_typeId, int newQty) {
		if ( cart.get(proId_typeId) != null ) {
		   orderItem  bean = cart.get(proId_typeId);
		   bean.setQty(newQty);
	       return true;
		} else {
		   return false;
		}
	}
	// 刪除某項商品
	public int deleteProduct(String proId_typeId) {
		if ( cart.get(proId_typeId) != null ) {
			cart.remove(proId_typeId);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	
	public void clearCart(){   // clear:清空Map
		cart.clear();
	}
	
	//購物車商品數量
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return cart.size();
	}
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
//	public double getSubtotal(){
//		double subTotal = 0 ;
//		Set<String> set = cart.keySet();
//		for(String n : set){
//			orderItem oib = cart.get(n);
//			double price    = oib.getUnitPrice();
////			Double discount = Double.valueOf(oib.getDiscount());
//			int qty      = oib.getQty();
////			subTotal +=  price * discount * qty;
//			subTotal +=  price * qty;
//		}
//		return subTotal;
//	}

	//計算
	public double getSubtotal(String proId_typeId){
		orderItem oib = cart.get(proId_typeId);
		double price    = oib.getUnitPrice();
		int qty = oib.getQty();
		subTotal =  price * qty;
		return subTotal;
	}
}
