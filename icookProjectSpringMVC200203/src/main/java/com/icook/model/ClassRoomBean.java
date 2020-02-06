package com.icook.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="classRoom")
public class ClassRoomBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	String roomNo;
	String roomCapacity;
	
//	@OneToMany(mappedBy="classRoomBean", cascade=CascadeType.ALL)
//	Set<CourseBean> items = new LinkedHashSet<>();

}
