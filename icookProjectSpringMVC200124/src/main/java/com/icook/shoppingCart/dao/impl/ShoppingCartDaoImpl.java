package com.icook.shoppingCart.dao.impl;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icook.model.ProductBean;
import com.icook.shoppingCart.dao.ShoppingCartDao;

@Repository
public class ShoppingCartDaoImpl implements ShoppingCartDao {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public ShoppingCartDaoImpl() {
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllProduct() {
		System.out.println("進入DAO: ");
		StringBuilder qryStmt = new StringBuilder();
		qryStmt.append(" FROM ProductBean WHERE itemStatus='True' ");
		String hql = qryStmt.toString();
		Session session = factory.getCurrentSession();
		List<ProductBean> productList = new LinkedList<>();
		productList = session.createQuery(hql).getResultList();
		
//		for(ProductBean pb:productList) {
//			System.out.println(pb.getCategory());
//			Set<ProductTypeBean> pbt = pb.getType();
		
//			toArray可將Set放的資料轉成陣列方式儲存，括號()依照API設定new ProductTypeBean[0]
//			就會正確得到ProductTypeBean的陣列，原因還在研究
//			ProductTypeBean[] ptbo = pbt.toArray(new ProductTypeBean[0]);

//			for(int i=0;i<ptbo.length;i++) {
//				System.out.println(ptbo[i].getTypeTitle());
//			}
//			System.out.println(o[0]);
//		}
		return productList;
	}

//	搜尋指定商品商品ID
	@SuppressWarnings("unused")
	@Override
	public ProductBean getProduct(String productID) {
		System.out.println("進入DAO productID :" + productID);
		List<ProductBean> getProduct = new LinkedList<>();
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductBean AS p WHERE p.itemStatus='True' AND p.productID like :PID";
		ProductBean pb = (ProductBean) session.createQuery(hql).setParameter("PID", productID).getSingleResult();
		return pb;
	}
	
//	關鍵字查詢商品
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> queryProduct(String productName) {
		System.out.println("進入DAO productName :" + productName);
		
		List<ProductBean> queryProduct = new LinkedList<>();
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductBean AS p WHERE p.itemStatus='True' AND p.productName like :name";
		queryProduct = session.createQuery(hql).setParameter("name", "%"+productName+"%").getResultList();
		
		return queryProduct;
	}



}
