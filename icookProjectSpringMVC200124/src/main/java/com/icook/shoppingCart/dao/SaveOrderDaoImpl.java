package com.icook.shoppingCart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icook.model.CourseOrderBean;
import com.icook.model.orderBean;
import com.icook.model.orderDetail;
@Repository
public class SaveOrderDaoImpl implements SaveOrderDao{
	
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	public boolean saveOrder(orderBean memord) {
		try {
			Session session = factory.getCurrentSession();
			session.save(memord);
			System.out.println("---------------correct----------------");
		} catch (Exception e) {
			System.out.println("---------------error----------------");
			return false;
		}
		return true;
	}
	@Override
	public boolean saveOrderDetails(List<orderDetail> SCar) {
		try {
			Session session = factory.getCurrentSession();
			for(int i=0;i<SCar.size();i++) {
				session.save(SCar.get(i));				
			}
			System.out.println("---------------correct----------------");
		} catch (Exception e) {
			System.out.println("---------------error----------------");
			return false;
		}
		return true;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<orderBean> getAllOrderDetails(int userId){
		Session session = factory.getCurrentSession();
		List<orderBean> temp = null;
		String hql = "from orderBean m where m.userId = :mid";
		temp = session.createQuery(hql).setParameter("mid",userId).getResultList();
		return temp;
	}

	@Override
	public boolean saveCourseDetails(List<CourseOrderBean> SCar) {
		try {
			Session session = factory.getCurrentSession();
			System.out.println("----------------" + SCar.get(0).getOrderId());
			System.out.println("----------------" + SCar.get(0).getCourseId());
			System.out.println("----------------" + SCar.get(0).getOrderQty());
			for(int i=0;i<SCar.size();i++) {
				session.save(SCar.get(i));
			}
			System.out.println("---------------correct----------------");
		} catch (Exception e) {
			System.out.println("---------------error----------------");
			return false;
		}
		return true;
	}
}
