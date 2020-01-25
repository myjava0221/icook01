package com.icook.courseOrder.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.icook.courseOrder.dao.CourseOrderDao;
import com.icook.courseOrder.service.CourseOrderService;
import com.icook.model.CourseOrderDetailBean;

@Service
public class CourseOrderServiceImpl implements CourseOrderService{

//	訂單明細的View
	CourseOrderDao dao;
	@Autowired
	public void setDao(CourseOrderDao dao) {
		this.dao = dao;
	}
	
//	@Transactional
//	@Override
//	public Map<Integer, CourseOrderDetailBean> courseODMap(Set<Integer> cartSet) {
//		Map<Integer, CourseOrderDetailBean> courseMap = null;
//		for(Integer c:cartSet) {
//			System.out.println("c: " + c);
//			courseMap.put(c, dao.courseODById(c));
//		}
//		return courseMap;
//	}

}
