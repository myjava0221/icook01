package com.icook.shoppingCart.service;

import java.util.List;


import com.icook.model.CourseOrderBean;
import com.icook.model.orderBean;
import com.icook.model.orderDetail;

public interface OrderServiceDao {
	public String FinalDealFinish(orderBean order,List<orderDetail> SCar);
	public String FinalCourseFinish(orderBean order,List<CourseOrderBean> SCar);
	public int retUserId(orderBean order);
}
