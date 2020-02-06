package com.icook.shoppingCart.dao;

import java.util.List;

import com.icook.model.CourseOrderBean;
import com.icook.model.orderBean;
import com.icook.model.orderDetail;

public interface SaveOrderDao {
	public boolean saveOrder(orderBean memtemp);
	public boolean saveOrderDetails(List<orderDetail> SCar);
	public boolean saveCourseDetails(List<CourseOrderBean> SCar);
	public List<orderBean> getAllOrderDetails(int userId);
}
