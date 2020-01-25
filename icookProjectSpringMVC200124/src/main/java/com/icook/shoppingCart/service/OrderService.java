package com.icook.shoppingCart.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icook.model.CourseOrderBean;
import com.icook.model.orderBean;
import com.icook.model.orderDetail;
import com.icook.shoppingCart.dao.SaveOrderDao;

@Transactional
@Service
public class OrderService implements OrderServiceDao{
	SaveOrderDao dao;
	int userId = 0;
	@Autowired
	public void setDao(SaveOrderDao dao) {
		this.dao = dao;
	}
	
	@Override
	public String FinalDealFinish(orderBean order,List<orderDetail> SCar) {
		String result = "";
		int userId = order.getUserId();
		boolean resOrd = dao.saveOrder(order);
		List<orderBean> getAllUserId = dao.getAllOrderDetails(userId);
		userId = getAllUserId.get(getAllUserId.size()-1).getOrderId();
		for(int i=0;i<SCar.size();i++) {
			SCar.get(i).setOrderId(userId);
		}
		boolean resDet = dao.saveOrderDetails(SCar);
		if(resOrd == true && resDet == true) {
			result = "true";
		}
		else {
			result = "false";
		}
		return result;
	}
	
	public int retUserId(orderBean order) {
		int Id = order.getUserId();
		List<orderBean> getAllUserId = dao.getAllOrderDetails(Id);
		int UId = getAllUserId.get(getAllUserId.size()-1).getOrderId();
		return UId;
	}

	@Override
	public String FinalCourseFinish(orderBean order, List<CourseOrderBean> SCar) {
		String result = "";
		int userId = order.getUserId();
		boolean resOrd = dao.saveOrder(order);
		System.out.println(resOrd + "----123-----");
		List<orderBean> getAllUserId = dao.getAllOrderDetails(userId);
		userId = getAllUserId.get(getAllUserId.size()-1).getOrderId();
		System.out.println(userId);
		for(int i=0;i<SCar.size();i++) {
			SCar.get(i).setOrderId(userId);
			System.out.println(SCar.get(i).getOrderId());
		}
		boolean resDet = dao.saveCourseDetails(SCar);
		System.out.println(resDet);
		if(resOrd == true && resDet == true) {
			result = "true";
		}
		else {
			result = "false";
		}
		return result;
	
	}
}
