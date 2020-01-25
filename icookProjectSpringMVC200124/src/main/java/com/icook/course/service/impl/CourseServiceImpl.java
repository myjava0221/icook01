package com.icook.course.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icook.course.dao.CourseDao;
import com.icook.course.service.CourseService;
import com.icook.model.CourseBean;
import com.icook.model.CourseOrderDetailBean;

@Service
public class CourseServiceImpl implements CourseService{

	CourseDao dao;
	@Autowired
	public void setDao(CourseDao dao) {
		this.dao = dao;
	}
	
	@Transactional
	@Override
	public List<CourseBean> queryCourse(String courseName) {
		return dao.queryCourse(courseName);
	}

	@Transactional
	@Override
	public List<CourseBean> queryAllCourse() {
		return dao.queryAllCourse();
	}

	@Transactional
	@Override
	public CourseBean getCourseById(int courseId) {
		return dao.getCourseById(courseId);
	}

	@Transactional
	@Override
	public Integer courseStock(int courseId) {
		int courseCapacity = dao.courseCapacity(courseId);
		List<Integer> courseOrderQty = dao.courseOrderQty(courseId);
		
		int sum = 0;
		for(int i:courseOrderQty) {
			sum += i;
		}
		Integer courseStock = courseCapacity-sum;
		
		return courseStock;
	}
	
	@Transactional
	@Override
	public Map<Integer, CourseBean> courseODMap(Set<Integer> cartSet) {
		Map<Integer, CourseBean> courseMap = null;
		for(Integer c:cartSet) {
			System.out.println("c: " + c);
			courseMap.put(c, dao.getCourseById(c));
		}
		return courseMap;
	}

//	@Transactional
//	@Override
//	public Map<Integer,CourseBean> courseCartList(Set<Integer> courseId) {
//		Map<Integer,CourseBean> cbm = null;
//		System.out.println("Set courseId: " + courseId);
//		for(int i:courseId) {
//			cbm.put(i, dao.getCourseById(i));
//		}		
//		return cbm;
//	}

}
