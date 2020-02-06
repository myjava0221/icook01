package com.icook.course.dao;

import java.util.List;

import com.icook.model.CourseBean;


public interface CourseDao {
	List<CourseBean> queryAllCourse();
	List<CourseBean> queryCourse(String courseName);
	public CourseBean getCourseById(int courseId);
	public Integer courseCapacity(int courseId);
	List<Integer> courseOrderQty(int courseId);
	
	
}
 