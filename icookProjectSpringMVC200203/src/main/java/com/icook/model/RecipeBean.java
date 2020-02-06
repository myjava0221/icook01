package com.icook.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Recipe")
public class RecipeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer recipeNo;
	private String recipeName;
	private String cookingTime;
	private String serving;
	private Blob coverImg;
	private String description;
	private String ingredName;
	private String ingredQty;
	private String group1;
	private String group1IngredName;
	private String group1IngredQty;
	private String group2;
	private String group2IngredName;
	private String group2IngredQty;
	private String group3;
	private String group3IngredName;
	private String group3IngredQty;
	private String step;
	private Blob stepPic01;
	private Blob stepPic02;
	private Blob stepPic03;
	private Blob stepPic04;
	private Blob stepPic05;
	private Blob stepPic06;
	private Blob stepPic07;
	private Blob stepPic08;
	private Blob stepPic09;
	private Blob stepPic10;
	private String remark;
	private Date lastUpdated;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="userId") 	
	private MemberBean memberBean;
	
	@Transient
	private Integer userId;
	
	@Transient
	MultipartFile RecipeImage;
	
//	@Transient
//	MultipartFile[] StepImage;
	
	public RecipeBean() {
	}
	public RecipeBean(Integer recipeNo,String recipeName, String cookingTime, String serving
	, Blob coverImg, String description, String ingredName, String ingredQty, String group1
	, String group1IngredName, String group1IngredQty, String group2, String group2IngredName
	, String group2IngredQty, String group3, String group3IngredName, String group3IngredQty
	, String step, String remark, Date lastUpdated
	, Blob stepPic01, Blob stepPic02, Blob stepPic03, Blob stepPic04, Blob stepPic05
	, Blob stepPic06, Blob stepPic07, Blob stepPic08, Blob stepPic09, Blob stepPic10
	, Integer userId) {
		this.recipeNo = recipeNo;
		this.recipeName = recipeName;
		this.cookingTime = cookingTime;
		this.serving = serving;
		this.coverImg = coverImg;
		this.description = description;
		this.ingredName = ingredName;
		this.ingredQty = ingredQty;
		this.group1 = group1;
		this.group1IngredName = group1IngredName;
		this.group1IngredQty = group1IngredQty;
		this.group2 = group2;
		this.group2IngredName = group2IngredName;
		this.group2IngredQty = group2IngredQty;
		this.group3 = group3;
		this.group3IngredName = group3IngredName;
		this.group3IngredQty = group3IngredQty;
		this.step = step;
		this.stepPic01 = stepPic01;
		this.stepPic02 = stepPic02;
		this.stepPic03 = stepPic03;
		this.stepPic04 = stepPic04;
		this.stepPic05 = stepPic05;
		this.stepPic06 = stepPic06;
		this.stepPic07 = stepPic07;
		this.stepPic08 = stepPic08;
		this.stepPic09 = stepPic09;
		this.stepPic10 = stepPic10;
		this.remark = remark;
		this.lastUpdated = lastUpdated;
		this.userId = userId;
	}
	
	public RecipeBean(Integer recipeNo, MemberBean memberBean) {
		this.recipeNo = recipeNo;
		this.memberBean = memberBean;
	}
	
	public MemberBean getMemberBean() {
		return memberBean;
	}
	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}
	public Integer getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(Integer recipeNum) {
		this.recipeNo = recipeNum;
	}
	public String getRecipeName() {
		return recipeName;
	}
	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}
	public String getCookingTime() {
		return cookingTime;
	}
	public void setCookingTime(String cookingTime) {
		this.cookingTime = cookingTime;
	}
	public String getServing() {
		return serving;
	}
	public void setServing(String serving) {
		this.serving = serving;
	}
	public Blob getCoverImg() {
		return coverImg;
	}
	public void setCoverImg(Blob coverImg) {
		this.coverImg = coverImg;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIngredName() {
		return ingredName;
	}
	public void setIngredName(String ingredName) {
		this.ingredName = ingredName;
	}
	public String getIngredQty() {
		return ingredQty;
	}
	public void setIngredQty(String ingredQty) {
		this.ingredQty = ingredQty;
	}
	public String getGroup1() {
		return group1;
	}
	public void setGroup1(String group1) {
		this.group1 = group1;
	}
	public String getGroup1IngredName() {
		return group1IngredName;
	}
	public void setGroup1IngredName(String group1IngredName) {
		this.group1IngredName = group1IngredName;
	}
	public String getGroup1IngredQty() {
		return group1IngredQty;
	}
	public void setGroup1IngredQty(String group1IngredQty) {
		this.group1IngredQty = group1IngredQty;
	}
	public String getGroup2() {
		return group2;
	}
	public void setGroup2(String group2) {
		this.group2 = group2;
	}
	public String getGroup2IngredName() {
		return group2IngredName;
	}
	public void setGroup2IngredName(String group2IngredName) {
		this.group2IngredName = group2IngredName;
	}
	public String getGroup2IngredQty() {
		return group2IngredQty;
	}
	public void setGroup2IngredQty(String group2IngredQty) {
		this.group2IngredQty = group2IngredQty;
	}
	public String getGroup3() {
		return group3;
	}
	public void setGroup3(String group3) {
		this.group3 = group3;
	}
	public String getGroup3IngredName() {
		return group3IngredName;
	}
	public void setGroup3IngredName(String group3IngredName) {
		this.group3IngredName = group3IngredName;
	}
	public String getGroup3IngredQty() {
		return group3IngredQty;
	}
	public void setGroup3IngredQty(String group3IngredQty) {
		this.group3IngredQty = group3IngredQty;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public Blob getStepPic01() {
		return stepPic01;
	}
	public void setStepPic01(Blob stepPic01) {
		this.stepPic01 = stepPic01;
	}
	public Blob getStepPic02() {
		return stepPic02;
	}
	public void setStepPic02(Blob stepPic02) {
		this.stepPic02 = stepPic02;
	}
	public Blob getStepPic03() {
		return stepPic03;
	}
	public void setStepPic03(Blob stepPic03) {
		this.stepPic03 = stepPic03;
	}
	public Blob getStepPic04() {
		return stepPic04;
	}
	public void setStepPic04(Blob stepPic04) {
		this.stepPic04 = stepPic04;
	}
	public Blob getStepPic05() {
		return stepPic05;
	}
	public void setStepPic05(Blob stepPic05) {
		this.stepPic05 = stepPic05;
	}
	public Blob getStepPic06() {
		return stepPic06;
	}
	public void setStepPic06(Blob stepPic06) {
		this.stepPic06 = stepPic06;
	}
	public Blob getStepPic07() {
		return stepPic07;
	}
	public void setStepPic07(Blob stepPic07) {
		this.stepPic07 = stepPic07;
	}
	public Blob getStepPic08() {
		return stepPic08;
	}
	public void setStepPic08(Blob stepPic08) {
		this.stepPic08 = stepPic08;
	}
	public Blob getStepPic09() {
		return stepPic09;
	}
	public void setStepPic09(Blob stepPic09) {
		this.stepPic09 = stepPic09;
	}
	public Blob getStepPic10() {
		return stepPic10;
	}
	public void setStepPic10(Blob stepPic10) {
		this.stepPic10 = stepPic10;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	public MultipartFile getRecipeImage() {
		return RecipeImage;
	}
	public void setRecipeImage(MultipartFile recipeImage) {
		this.RecipeImage = recipeImage;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
