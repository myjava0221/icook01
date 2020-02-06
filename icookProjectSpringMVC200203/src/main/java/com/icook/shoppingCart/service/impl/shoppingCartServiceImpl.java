package com.icook.shoppingCart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icook.model.ProductBean;
import com.icook.shoppingCart.dao.ShoppingCartDao;
import com.icook.shoppingCart.service.shoppingCartService;

@Service
public class shoppingCartServiceImpl implements shoppingCartService {
	ShoppingCartDao dao;
	
	@Autowired
	public void setDao(ShoppingCartDao dao) {
		this.dao = dao;
	}
	@Transactional
	@Override
	public List<ProductBean> getAllProduct() {
		System.out.println("進入Service");
		return dao.getAllProduct();
	}
	@Transactional
	@Override
	public List<ProductBean> queryProduct(String productName) {
		System.out.println("進入queryProduct Service");
		return dao.queryProduct(productName);
	}
	@Transactional
	@Override
	public ProductBean getProduct(String productID) {
		System.out.println("進入getProduct Service");
		return dao.getProduct(productID);
	}

}
