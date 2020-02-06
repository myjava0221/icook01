package com.icook.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="course")
public class CourseBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//請依資料表欄位名稱取名
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		Integer courseId;
		Integer hostId;
		String courseName;
		String courseCategory;
		String courseImage; //資料類型待確認
		String hostName;
		Date courseStartDate;
		Date courseEndDate;
		String courseIntrod;
		Integer coursePrice;
		Date saleStartDate;
		Date saleEndDate;
		String coursePhone;
		String courseMail;
		Double courseDiscount;
		
//		課程多 => 教室一
		String roomNo;
//		@ManyToOne
//		@JoinColumn(name = "roomNo")
//		ClassRoomBean classRoomBean;
//		
//		public ClassRoomBean getClassRoomBean() {
//			return classRoomBean;
//		}
//		public void setClassRoomBean(ClassRoomBean classRoomBean) {
//			this.classRoomBean = classRoomBean;
//		}
		
		public CourseBean() {}
		
		public CourseBean(
			Integer courseId,
			Integer hostId,
			String courseName,
			String courseCategory,
			String courseImage, //資料類型待確認
			String hostName,
			Date courseStartDate,
			Date courseEndDate,
			String roomNo,
			String courseIntrod,
			Integer coursePrice,
			Date saleStartDate,
			Date saleEndDate,
			String coursePhone,
			String courseMail,
			Double courseDiscount) {
				this.courseId = courseId;
				this.hostId = hostId;
				this.courseName = courseName;
				this.courseCategory =courseCategory;
				this.courseImage = courseImage;
				this.hostName = hostName;
				this.courseStartDate = courseStartDate;
				this.courseEndDate = courseEndDate;
				this.roomNo = roomNo;
				this.courseIntrod = courseIntrod;
				this.coursePrice = coursePrice;
				this.saleStartDate = saleStartDate;
				this.saleEndDate = saleEndDate;
				this.coursePhone = coursePhone;
				this.courseMail = courseMail;
				this.courseDiscount = courseDiscount;
		}
		
		
		
		public Integer getCourseId() {
			return courseId;
		}

		public void setCourseId(Integer courseId) {
			this.courseId = courseId;
		}
		public Integer getHostId() {
			return hostId;
		}
		public void setHostId(Integer hostId) {
			this.hostId = hostId;
		}
		public String getCourseName() {
			return courseName;
		}
		public void setCourseName(String courseName) {
			this.courseName = courseName;
		}
		public String getCourseCategory() {
			return courseCategory;
		}
		public void setCourseCategory(String courseCategory) {
			this.courseCategory = courseCategory;
		}
		public String getCourseImage() {
			return courseImage;
		}
		public void setCourseImage(String courseImage) {
			this.courseImage = courseImage;
		}
		public String getHostName() {
			return hostName;
		}
		public void setHostName(String hostName) {
			this.hostName = hostName;
		}
		public Date getCourseStartDate() {
			return courseStartDate;
		}
		public void setCourseStartDate(Date courseStartDate) {
			this.courseStartDate = courseStartDate;
		}
		public Date getCourseEndDate() {
			return courseEndDate;
		}
		public void setCourseEndDate(Date courseEndDate) {
			this.courseEndDate = courseEndDate;
		}
		public String getRoomNo() {
			return roomNo;
		}
		public void setRoomNo(String roomNo) {
			this.roomNo = roomNo;
		}
		public String getCourseIntrod() {
			return courseIntrod;
		}
		public void setCourseIntrod(String courseIntrod) {
			this.courseIntrod = courseIntrod;
		}
		public Integer getCoursePrice() {
			return coursePrice;
		}
		public void setCoursePrice(Integer coursePrice) {
			this.coursePrice = coursePrice;
		}
		public Date getSaleStartDate() {
			return saleStartDate;
		}
		public void setSaleStartDate(Date saleStartDate) {
			this.saleStartDate = saleStartDate;
		}
		public Date getSaleEndDate() {
			return saleEndDate;
		}
		public void setSaleEndDate(Date saleEndDate) {
			this.saleEndDate = saleEndDate;
		}
		public String getCoursePhone() {
			return coursePhone;
		}
		public void setCoursePhone(String coursePhone) {
			this.coursePhone = coursePhone;
		}
		public String getCourseMail() {
			return courseMail;
		}
		public void setCourseMail(String courseMail) {
			this.courseMail = courseMail;
		}
		public static long getSerialversionuid() {
			return serialVersionUID;
		}

		public Double getCourseDiscount() {
			return courseDiscount;
		}

		public void setCourseDiscount(Double courseDiscount) {
			this.courseDiscount = courseDiscount;
		}
		
		
		
}
