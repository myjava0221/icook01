package com.icook.courseOrder.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icook.courseOrder.dao.CourseOrderDao;
import com.icook.model.CourseOrderDetailBean;
@Repository
public class CourseOrderDaoImpl implements CourseOrderDao{
	
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	public CourseOrderDetailBean courseODById(int courseId) {
		Session session = factory.getCurrentSession();
		CourseOrderDetailBean codb = session.get(CourseOrderDetailBean.class, courseId);
		return codb;
	}
}
