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
	private String ingredName01;
	private String ingredName02;
	private String ingredName03;
	private String ingredName04;
	private String ingredName05;
	private String ingredName06;
	private String ingredName07;
	private String ingredName08;
	private String ingredName09;
	private String ingredName10;
	private String ingredQty01;
	private String ingredQty02;
	private String ingredQty03;
	private String ingredQty04;
	private String ingredQty05;
	private String ingredQty06;
	private String ingredQty07;
	private String ingredQty08;
	private String ingredQty09;
	private String ingredQty10;	
	private String group1;
	private String group1IngredName1;
	private String group1IngredName2;
	private String group1IngredName3;
	private String group1IngredName4;
	private String group1IngredName5;
	private String group1IngredQty1;
	private String group1IngredQty2;
	private String group1IngredQty3;
	private String group1IngredQty4;
	private String group1IngredQty5;
	private String group2;
	private String group2IngredName1;
	private String group2IngredName2;
	private String group2IngredName3;
	private String group2IngredName4;
	private String group2IngredName5;
	private String group2IngredQty1;
	private String group2IngredQty2;
	private String group2IngredQty3;
	private String group2IngredQty4;
	private String group2IngredQty5;
	private String group3;
	private String group3IngredName1;
	private String group3IngredName2;
	private String group3IngredName3;
	private String group3IngredName4;
	private String group3IngredName5;
	private String group3IngredQty1;
	private String group3IngredQty2;
	private String group3IngredQty3;
	private String group3IngredQty4;
	private String group3IngredQty5;
	private String step01;
	private String step02;
	private String step03;
	private String step04;
	private String step05;
	private String step06;
	private String step07;
	private String step08;
	private String step09;
	private String step10;
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
	
	@Transient
	private String[] ingredNameList;
	@Transient
	private String[] ingredQtyList;
	
//	@Transient
//	MultipartFile[] StepImage;
	
	public RecipeBean() {
	}
	public RecipeBean(Integer recipeNo,String recipeName, String cookingTime, String serving
	, Blob coverImg, String description, String ingredName, String ingredQty, String ingredName01, String ingredName02
	, String ingredName03, String ingredName04, String ingredName05, String ingredName06
	, String ingredName07,String ingredName08, String ingredName09, String ingredName10
	, String ingredQty01, String ingredQty02, String ingredQty03, String ingredQty04
	, String ingredQty05, String ingredQty06, String ingredQty07, String ingredQty08
	, String ingredQty09, String ingredQty10, String group1, String group1IngredName1
	, String group1IngredName2, String group1IngredName3, String group1IngredName4
	, String group1IngredName5, String group1IngredQty1, String group1IngredQty2
	, String group1IngredQty3, String group1IngredQty4, String group1IngredQty5, String group2
	, String group2IngredName1, String group2IngredName2, String group2IngredName3
	, String group2IngredName4, String group2IngredName5, String group2IngredQty1
	, String group2IngredQty2, String group2IngredQty3, String group2IngredQty4
	, String group2IngredQty5, String group3, String group3IngredName1, String group3IngredName2
	, String group3IngredName3, String group3IngredName4, String group3IngredName5
	, String group3IngredQty1, String group3IngredQty2, String group3IngredQty3, String group3IngredQty4
	, String group3IngredQty5, String step01, String step02, String step03, String step04, String step05
	, String step06, String step07, String step08, String step09, String step10
	, String remark, Date lastUpdated, Blob stepPic01, Blob stepPic02, Blob stepPic03, Blob stepPic04
	, Blob stepPic05, Blob stepPic06, Blob stepPic07, Blob stepPic08, Blob stepPic09, Blob stepPic10
	, Integer userId) {
		this.recipeNo = recipeNo;
		this.recipeName = recipeName;
		this.cookingTime = cookingTime;
		this.serving = serving;
		this.coverImg = coverImg;
		this.description = description;
		this.ingredName = ingredName;
		this.ingredQty = ingredQty;
		this.ingredName01 = ingredName01;
		this.ingredName02 = ingredName02;
		this.ingredName03 = ingredName03;
		this.ingredName04 = ingredName04;
		this.ingredName05 = ingredName05;
		this.ingredName06 = ingredName06;
		this.ingredName07 = ingredName07;
		this.ingredName08 = ingredName08;
		this.ingredName07 = ingredName09;
		this.ingredName10 = ingredName10;
		this.ingredQty01 = ingredQty01;
		this.ingredQty02 = ingredQty02;
		this.ingredQty03 = ingredQty03;
		this.ingredQty04 = ingredQty04;
		this.ingredQty05 = ingredQty05;
		this.ingredQty06 = ingredQty06;
		this.ingredQty07 = ingredQty07;
		this.ingredQty08 = ingredQty08;
		this.ingredQty09 = ingredQty09;
		this.ingredQty10 = ingredQty10;
		this.group1 = group1;
		this.group1IngredName1 = group1IngredName1;
		this.group1IngredName2 = group1IngredName2;
		this.group1IngredName3 = group1IngredName3;
		this.group1IngredName4 = group1IngredName4;
		this.group1IngredName5 = group1IngredName5;
		this.group1IngredQty1 = group1IngredQty1;
		this.group1IngredQty2 = group1IngredQty2;
		this.group1IngredQty3 = group1IngredQty3;
		this.group1IngredQty4 = group1IngredQty4;
		this.group1IngredQty5 = group1IngredQty5;
		this.group2 = group2;
		this.group2IngredName1 = group2IngredName1;
		this.group2IngredName2 = group2IngredName2;
		this.group2IngredName3 = group2IngredName3;
		this.group2IngredName4 = group2IngredName4;
		this.group2IngredName5 = group2IngredName5;
		this.group2IngredQty1 = group2IngredQty1;
		this.group2IngredQty2 = group2IngredQty2;
		this.group2IngredQty3 = group2IngredQty3;
		this.group2IngredQty4 = group2IngredQty4;
		this.group2IngredQty5 = group2IngredQty5;
		this.group3 = group3;
		this.group3IngredName1 = group3IngredName1;
		this.group3IngredName2 = group3IngredName2;
		this.group3IngredName3 = group3IngredName3;
		this.group3IngredName4 = group3IngredName4;
		this.group3IngredName5 = group3IngredName5;
		this.group3IngredQty1 = group3IngredQty1;
		this.group3IngredQty2 = group3IngredQty2;
		this.group3IngredQty3 = group3IngredQty3;
		this.group3IngredQty4 = group3IngredQty4;
		this.group3IngredQty5 = group3IngredQty5;
		this.step01 = step01;
		this.step02 = step02;
		this.step03 = step03;
		this.step04 = step04;
		this.step05 = step05;
		this.step06 = step06;
		this.step07 = step07;
		this.step08 = step08;
		this.step09 = step09;
		this.step10 = step10;
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
	
	public RecipeBean(Integer recipeNo,String recipeName, String cookingTime, String serving
	, Blob coverImg, String description, String ingredName01, String ingredName02
	, String ingredName03, String ingredName04, String ingredName05, String ingredName06
	, String ingredName07,String ingredName08, String ingredName09, String ingredName10
	, String ingredQty01, String ingredQty02, String ingredQty03, String ingredQty04
	, String ingredQty05, String ingredQty06, String ingredQty07, String ingredQty08
	, String ingredQty09, String ingredQty10, String group1, String group1IngredName1
	, String group1IngredName2, String group1IngredName3, String group1IngredName4
	, String group1IngredName5, String group1IngredQty1, String group1IngredQty2
	, String group1IngredQty3, String group1IngredQty4, String group1IngredQty5, String group2
	, String group2IngredName1, String group2IngredName2, String group2IngredName3
	, String group2IngredName4, String group2IngredName5, String group2IngredQty1
	, String group2IngredQty2, String group2IngredQty3, String group2IngredQty4
	, String group2IngredQty5, String group3, String group3IngredName1, String group3IngredName2
	, String group3IngredName3, String group3IngredName4, String group3IngredName5
	, String group3IngredQty1, String group3IngredQty2, String group3IngredQty3, String group3IngredQty4
	, String group3IngredQty5, String step01, String step02, String step03, String step04, String step05
	, String step06, String step07, String step08, String step09, String step10
	, String remark, Date lastUpdated, Blob stepPic01, Blob stepPic02, Blob stepPic03, Blob stepPic04
	, Blob stepPic05, Blob stepPic06, Blob stepPic07, Blob stepPic08, Blob stepPic09, Blob stepPic10
	, MemberBean memberBean) {
		this.recipeNo = recipeNo;
		this.recipeName = recipeName;
		this.cookingTime = cookingTime;
		this.serving = serving;
		this.coverImg = coverImg;
		this.description = description;
		this.ingredName01 = ingredName01;
		this.ingredName02 = ingredName02;
		this.ingredName03 = ingredName03;
		this.ingredName04 = ingredName04;
		this.ingredName05 = ingredName05;
		this.ingredName06 = ingredName06;
		this.ingredName07 = ingredName07;
		this.ingredName08 = ingredName08;
		this.ingredName07 = ingredName09;
		this.ingredName10 = ingredName10;
		this.ingredQty01 = ingredQty01;
		this.ingredQty02 = ingredQty02;
		this.ingredQty03 = ingredQty03;
		this.ingredQty04 = ingredQty04;
		this.ingredQty05 = ingredQty05;
		this.ingredQty06 = ingredQty06;
		this.ingredQty07 = ingredQty07;
		this.ingredQty08 = ingredQty08;
		this.ingredQty09 = ingredQty09;
		this.ingredQty10 = ingredQty10;
		this.group1 = group1;
		this.group1IngredName1 = group1IngredName1;
		this.group1IngredName2 = group1IngredName2;
		this.group1IngredName3 = group1IngredName3;
		this.group1IngredName4 = group1IngredName4;
		this.group1IngredName5 = group1IngredName5;
		this.group1IngredQty1 = group1IngredQty1;
		this.group1IngredQty2 = group1IngredQty2;
		this.group1IngredQty3 = group1IngredQty3;
		this.group1IngredQty4 = group1IngredQty4;
		this.group1IngredQty5 = group1IngredQty5;
		this.group2 = group2;
		this.group2IngredName1 = group2IngredName1;
		this.group2IngredName2 = group2IngredName2;
		this.group2IngredName3 = group2IngredName3;
		this.group2IngredName4 = group2IngredName4;
		this.group2IngredName5 = group2IngredName5;
		this.group2IngredQty1 = group2IngredQty1;
		this.group2IngredQty2 = group2IngredQty2;
		this.group2IngredQty3 = group2IngredQty3;
		this.group2IngredQty4 = group2IngredQty4;
		this.group2IngredQty5 = group2IngredQty5;
		this.group3 = group3;
		this.group3IngredName1 = group3IngredName1;
		this.group3IngredName2 = group3IngredName2;
		this.group3IngredName3 = group3IngredName3;
		this.group3IngredName4 = group3IngredName4;
		this.group3IngredName5 = group3IngredName5;
		this.group3IngredQty1 = group3IngredQty1;
		this.group3IngredQty2 = group3IngredQty2;
		this.group3IngredQty3 = group3IngredQty3;
		this.group3IngredQty4 = group3IngredQty4;
		this.group3IngredQty5 = group3IngredQty5;
		this.step01 = step01;
		this.step02 = step02;
		this.step03 = step03;
		this.step04 = step04;
		this.step05 = step05;
		this.step06 = step06;
		this.step07 = step07;
		this.step08 = step08;
		this.step09 = step09;
		this.step10 = step10;
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
	public String getIngredName01() {
		return ingredName01;
	}
	public void setIngredName01(String ingredName01) {
		this.ingredName01 = ingredName01;
	}
	public String getIngredName02() {
		return ingredName02;
	}
	public void setIngredName02(String ingredName02) {
		this.ingredName02 = ingredName02;
	}
	public String getIngredName03() {
		return ingredName03;
	}
	public void setIngredName03(String ingredName03) {
		this.ingredName03 = ingredName03;
	}
	public String getIngredName04() {
		return ingredName04;
	}
	public void setIngredName04(String ingredName04) {
		this.ingredName04 = ingredName04;
	}
	public String getIngredName05() {
		return ingredName05;
	}
	public void setIngredName05(String ingredName05) {
		this.ingredName05 = ingredName05;
	}
	public String getIngredName06() {
		return ingredName06;
	}
	public void setIngredName06(String ingredName06) {
		this.ingredName06 = ingredName06;
	}
	public String getIngredName07() {
		return ingredName07;
	}
	public void setIngredName07(String ingredName07) {
		this.ingredName07 = ingredName07;
	}
	public String getIngredName08() {
		return ingredName08;
	}
	public void setIngredName08(String ingredName08) {
		this.ingredName08 = ingredName08;
	}
	public String getIngredName09() {
		return ingredName09;
	}
	public void setIngredName09(String ingredName09) {
		this.ingredName09 = ingredName09;
	}
	public String getIngredName10() {
		return ingredName10;
	}
	public void setIngredName10(String ingredName10) {
		this.ingredName10 = ingredName10;
	}
	public String getIngredQty01() {
		return ingredQty01;
	}
	public void setIngredQty01(String ingredQty01) {
		this.ingredQty01 = ingredQty01;
	}
	public String getIngredQty02() {
		return ingredQty02;
	}
	public void setIngredQty02(String ingredQty02) {
		this.ingredQty02 = ingredQty02;
	}
	public String getIngredQty03() {
		return ingredQty03;
	}
	public void setIngredQty03(String ingredQty03) {
		this.ingredQty03 = ingredQty03;
	}
	public String getIngredQty04() {
		return ingredQty04;
	}
	public void setIngredQty04(String ingredQty04) {
		this.ingredQty04 = ingredQty04;
	}
	public String getIngredQty05() {
		return ingredQty05;
	}
	public void setIngredQty05(String ingredQty05) {
		this.ingredQty05 = ingredQty05;
	}
	public String getIngredQty06() {
		return ingredQty06;
	}
	public void setIngredQty06(String ingredQty06) {
		this.ingredQty06 = ingredQty06;
	}
	public String getIngredQty07() {
		return ingredQty07;
	}
	public void setIngredQty07(String ingredQty07) {
		this.ingredQty07 = ingredQty07;
	}
	public String getIngredQty08() {
		return ingredQty08;
	}
	public void setIngredQty08(String ingredQty08) {
		this.ingredQty08 = ingredQty08;
	}
	public String getIngredQty09() {
		return ingredQty09;
	}
	public void setIngredQty09(String ingredQty09) {
		this.ingredQty09 = ingredQty09;
	}
	public String getIngredQty10() {
		return ingredQty10;
	}
	public void setIngredQty10(String ingredQty10) {
		this.ingredQty10 = ingredQty10;
	}
	public String getGroup1() {
		return group1;
	}
	public void setGroup1(String group1) {
		this.group1 = group1;
	}
	public String getGroup1IngredName1() {
		return group1IngredName1;
	}
	public void setGroup1IngredName1(String group1IngredName1) {
		this.group1IngredName1 = group1IngredName1;
	}
	public String getGroup1IngredName2() {
		return group1IngredName2;
	}
	public void setGroup1IngredName2(String group1IngredName2) {
		this.group1IngredName2 = group1IngredName2;
	}
	public String getGroup1IngredName3() {
		return group1IngredName3;
	}
	public void setGroup1IngredName3(String group1IngredName3) {
		this.group1IngredName3 = group1IngredName3;
	}
	public String getGroup1IngredName4() {
		return group1IngredName4;
	}
	public void setGroup1IngredName4(String group1IngredName4) {
		this.group1IngredName4 = group1IngredName4;
	}
	public String getGroup1IngredName5() {
		return group1IngredName5;
	}
	public void setGroup1IngredName5(String group1IngredName5) {
		this.group1IngredName5 = group1IngredName5;
	}
	public String getGroup1IngredQty1() {
		return group1IngredQty1;
	}
	public void setGroup1IngredQty1(String group1IngredQty1) {
		this.group1IngredQty1 = group1IngredQty1;
	}
	public String getGroup1IngredQty2() {
		return group1IngredQty2;
	}
	public void setGroup1IngredQty2(String group1IngredQty2) {
		this.group1IngredQty2 = group1IngredQty2;
	}
	public String getGroup1IngredQty3() {
		return group1IngredQty3;
	}
	public void setGroup1IngredQty3(String group1IngredQty3) {
		this.group1IngredQty3 = group1IngredQty3;
	}
	public String getGroup1IngredQty4() {
		return group1IngredQty4;
	}
	public void setGroup1IngredQty4(String group1IngredQty4) {
		this.group1IngredQty4 = group1IngredQty4;
	}
	public String getGroup1IngredQty5() {
		return group1IngredQty5;
	}
	public void setGroup1IngredQty5(String group1IngredQty5) {
		this.group1IngredQty5 = group1IngredQty5;
	}
	public String getGroup2() {
		return group2;
	}
	public void setGroup2(String group2) {
		this.group2 = group2;
	}
	public String getGroup2IngredName1() {
		return group2IngredName1;
	}
	public void setGroup2IngredName1(String group2IngredName1) {
		this.group2IngredName1 = group2IngredName1;
	}
	public String getGroup2IngredName2() {
		return group2IngredName2;
	}
	public void setGroup2IngredName2(String group2IngredName2) {
		this.group2IngredName2 = group2IngredName2;
	}
	public String getGroup2IngredName3() {
		return group2IngredName3;
	}
	public void setGroup2IngredName3(String group2IngredName3) {
		this.group2IngredName3 = group2IngredName3;
	}
	public String getGroup2IngredName4() {
		return group2IngredName4;
	}
	public void setGroup2IngredName4(String group2IngredName4) {
		this.group2IngredName4 = group2IngredName4;
	}
	public String getGroup2IngredName5() {
		return group2IngredName5;
	}
	public void setGroup2IngredName5(String group2IngredName5) {
		this.group2IngredName5 = group2IngredName5;
	}
	public String getGroup2IngredQty1() {
		return group2IngredQty1;
	}
	public void setGroup2IngredQty1(String group2IngredQty1) {
		this.group2IngredQty1 = group2IngredQty1;
	}
	public String getGroup2IngredQty2() {
		return group2IngredQty2;
	}
	public void setGroup2IngredQty2(String group2IngredQty2) {
		this.group2IngredQty2 = group2IngredQty2;
	}
	public String getGroup2IngredQty3() {
		return group2IngredQty3;
	}
	public void setGroup2IngredQty3(String group2IngredQty3) {
		this.group2IngredQty3 = group2IngredQty3;
	}
	public String getGroup2IngredQty4() {
		return group2IngredQty4;
	}
	public void setGroup2IngredQty4(String group2IngredQty4) {
		this.group2IngredQty4 = group2IngredQty4;
	}
	public String getGroup2IngredQty5() {
		return group2IngredQty5;
	}
	public void setGroup2IngredQty5(String group2IngredQty5) {
		this.group2IngredQty5 = group2IngredQty5;
	}
	public String getGroup3() {
		return group3;
	}
	public void setGroup3(String group3) {
		this.group3 = group3;
	}
	public String getGroup3IngredName1() {
		return group3IngredName1;
	}
	public void setGroup3IngredName1(String group3IngredName1) {
		this.group3IngredName1 = group3IngredName1;
	}
	public String getGroup3IngredName2() {
		return group3IngredName2;
	}
	public void setGroup3IngredName2(String group3IngredName2) {
		this.group3IngredName2 = group3IngredName2;
	}
	public String getGroup3IngredName3() {
		return group3IngredName3;
	}
	public void setGroup3IngredName3(String group3IngredName3) {
		this.group3IngredName3 = group3IngredName3;
	}
	public String getGroup3IngredName4() {
		return group3IngredName4;
	}
	public void setGroup3IngredName4(String group3IngredName4) {
		this.group3IngredName4 = group3IngredName4;
	}
	public String getGroup3IngredName5() {
		return group3IngredName5;
	}
	public void setGroup3IngredName5(String group3IngredName5) {
		this.group3IngredName5 = group3IngredName5;
	}
	public String getGroup3IngredQty1() {
		return group3IngredQty1;
	}
	public void setGroup3IngredQty1(String group3IngredQty1) {
		this.group3IngredQty1 = group3IngredQty1;
	}
	public String getGroup3IngredQty2() {
		return group3IngredQty2;
	}
	public void setGroup3IngredQty2(String group3IngredQty2) {
		this.group3IngredQty2 = group3IngredQty2;
	}
	public String getGroup3IngredQty3() {
		return group3IngredQty3;
	}
	public void setGroup3IngredQty3(String group3IngredQty3) {
		this.group3IngredQty3 = group3IngredQty3;
	}
	public String getGroup3IngredQty4() {
		return group3IngredQty4;
	}
	public void setGroup3IngredQty4(String group3IngredQty4) {
		this.group3IngredQty4 = group3IngredQty4;
	}
	public String getGroup3IngredQty5() {
		return group3IngredQty5;
	}
	public void setGroup3IngredQty5(String group3IngredQty5) {
		this.group3IngredQty5 = group3IngredQty5;
	}
	public String getStep01() {
		return step01;
	}
	public void setStep01(String step01) {
		this.step01 = step01;
	}
	public String getStep02() {
		return step02;
	}
	public void setStep02(String step02) {
		this.step02 = step02;
	}
	public String getStep03() {
		return step03;
	}
	public void setStep03(String step03) {
		this.step03 = step03;
	}
	public String getStep04() {
		return step04;
	}
	public void setStep04(String step04) {
		this.step04 = step04;
	}
	public String getStep05() {
		return step05;
	}
	public void setStep05(String step05) {
		this.step05 = step05;
	}
	public String getStep06() {
		return step06;
	}
	public void setStep06(String step06) {
		this.step06 = step06;
	}
	public String getStep07() {
		return step07;
	}
	public void setStep07(String step07) {
		this.step07 = step07;
	}
	public String getStep08() {
		return step08;
	}
	public void setStep08(String step08) {
		this.step08 = step08;
	}
	public String getStep09() {
		return step09;
	}
	public void setStep09(String step09) {
		this.step09 = step09;
	}
	public String getStep10() {
		return step10;
	}
	public void setStep10(String step10) {
		this.step10 = step10;
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
//	public MultipartFile[] getStepImage() {
//		return StepImage;
//	}
//	public void setStepImage(MultipartFile[] stepImage) {
//		StepImage = stepImage;
//	}
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
	public String[] getIngredNameList() {
		return ingredNameList;
	}
	public void setIngredNameList(String[] ingredNameList) {
		this.ingredNameList = ingredNameList;
	}
	public String[] getIngredQtyList() {
		return ingredQtyList;
	}
	public void setIngredQtyList(String[] ingredQtyList) {
		this.ingredQtyList = ingredQtyList;
	}
	
}
