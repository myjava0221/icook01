package com.icook.order.dao;

import java.util.List;

import com.icook.model.orderBean;
import com.icook.model.orderDetail;

public interface OrdersDao {
	public List<orderBean> getAllOrders(int userId); 
	public boolean checkOrders(int userId);
	public List<orderDetail> getAllOrderDetails(int orderId);
	public List<orderBean> Reverse(List<orderBean> list);
	public void DeleteOrders(int orderId);
}
