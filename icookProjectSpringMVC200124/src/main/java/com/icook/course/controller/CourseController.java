package com.icook.course.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.icook.course.service.CourseService;
import com.icook.model.CourseBean;

@Controller
public class CourseController {
	CourseService service;
	@Autowired
	public void setService(CourseService service) {
		this.service = service;
	}
	
	ServletContext context;
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	
	//課程首頁: 搜尋表單 + 全部課程清單
	@GetMapping("/course/courseHomePage")
	public String searchCoursesForm(Model model) {
		System.out.println("進入controller: searchCoursesForm");
		String courseName = null;
		List<CourseBean> list = service.queryAllCourse();
		model.addAttribute("courseName", courseName);
		model.addAttribute("courses", list);
		return "course/courseHomePage";
	}
	
	//課程首頁: 模糊搜尋課程清單
	@PostMapping("/course/courseHomePage")
	public String searchCoursesList(@RequestParam("courseName") String courseName, Model model) {
		System.out.println("進入controller: searchCoursesList");
		List<CourseBean> list = null;
		if(courseName == null) {
			System.out.println("courses is null.");
			list = service.queryAllCourse();
		}else {
			System.out.println("courses is not null.");
			list = service.queryCourse(courseName);
		}
		model.addAttribute("courses", list);
		return "course/courseHomePage";
	}
	
	@InitBinder
	public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields(
				"courseId",
				"hostId",
				"courseName",
				"courseCategory",
				"courseImage",
				"hostName",
				"courseStartDate",
				"courseEndDate",
				"roomNo",
				"courseIntrod",
				"coursePrice",
				"saleStartDate",
				"saleEndDate",
				"coursePhone",
				"courseMail"
				);
	}

}
