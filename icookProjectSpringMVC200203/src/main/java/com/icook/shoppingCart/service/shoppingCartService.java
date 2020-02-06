package com.icook.shoppingCart.service;

import java.util.List;

import com.icook.model.ProductBean;

public interface shoppingCartService {
	List<ProductBean> getAllProduct();
	ProductBean getProduct(String productID);
	List<ProductBean> queryProduct(String productName);
}
