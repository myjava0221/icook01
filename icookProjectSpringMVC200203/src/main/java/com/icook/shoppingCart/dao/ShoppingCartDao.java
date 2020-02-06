package com.icook.shoppingCart.dao;

import java.util.List;

import com.icook.model.ProductBean;

public interface ShoppingCartDao{
	List<ProductBean> getAllProduct();
	ProductBean getProduct(String productID);
	List<ProductBean> queryProduct(String productName);
}
