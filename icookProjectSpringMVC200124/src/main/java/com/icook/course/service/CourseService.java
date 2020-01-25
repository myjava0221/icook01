package com.icook.course.service;


import java.util.List;
import java.util.Map;
import java.util.Set;

import com.icook.model.CourseBean;


public interface CourseService {
	
	List<CourseBean> queryAllCourse();
	List<CourseBean> queryCourse(String courseName);
	public CourseBean getCourseById(int courseId);
	Integer courseStock(int courseId);
//	Map<Integer, CourseBean> courseCartList(Set<Integer> courseId);
	Map<Integer, CourseBean> courseODMap(Set<Integer> cartSet);
	

}
