package com.icook.order.service;

import java.util.List;

import com.icook.model.orderBean;
import com.icook.model.orderDetail;

public interface SearchOrdersServiceDao {
	public List<orderBean> searchAllDetails(int userId);
	public List<orderDetail> searchAllOrdDetails(int orderId);
	public void Delete(int orderId);
}
