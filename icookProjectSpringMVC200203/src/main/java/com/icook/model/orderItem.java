package com.icook.model;

import java.io.Serializable;

public class orderItem implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer seqno;
	private Integer orderId;
	private Integer productId;
	private String describe;
	private Integer qty;
	private Double unitPrice;
	private Double onSale;
	private String discount;
	private Integer typeId;
	private String image1;
	public orderItem() {
	}
	public orderItem(Integer seqno, Integer orderId, Integer productId, String describe, Integer qty,
			Double unitPrice,Double onSale, String discount, Integer typeId) {
		super();
		this.seqno = seqno;
		this.orderId = orderId;
		this.productId = productId;
		this.describe = describe;
		this.qty = qty;
		this.unitPrice = unitPrice;
		this.onSale = onSale;
		this.discount = discount;
		this.typeId = typeId;
	}
	public Integer getSeqno() {
		return seqno;
	}
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public Integer getQty() {
		return qty;
	}
	public void setQty(Integer qty) {
		this.qty = qty;
	}
	
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Double getOnSale() {
		double tranDiscount = 1;
		if(this.discount==null || this.discount.isEmpty() || this.discount.length()==0) {
			this.onSale =  tranDiscount * this.unitPrice;
		}else{
			this.onSale = Double.valueOf(this.discount) * this.unitPrice/10;
		}

		return (double) Math.round(onSale);
	}
	public void setOnSale(Double onSale) {
		this.onSale = onSale;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
//	
//	public static void main(String[] args) {
//		orderItem oi = new orderItem();
//		oi.setUnitPrice((double) 200);
//		System.out.println(oi.getUnitPrice());
//		oi.setDiscount(null);
//		System.out.println(oi.getDiscount());
//		oi.setDiscount("");
//		System.out.println(oi.getDiscount());
//		System.out.println(oi.getDiscount().isEmpty());
//		System.out.println(oi.getDiscount().length()==0);
//		
//		System.out.println("OnSale:"+oi.getOnSale());
//	}
}
