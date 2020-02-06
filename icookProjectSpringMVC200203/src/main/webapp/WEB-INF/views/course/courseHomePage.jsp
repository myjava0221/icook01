<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>愛料理首頁</title>
	<!-- for-mobile-apps -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	<!-- 商品套版 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/course/main.css" />
	<!-- //商品套版 -->

</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />	
	<!-- 搜尋功能 -->
	<div class="contain align-items-center">
		<fieldset >
			<form method="POST" class="form-horizontal" style="text-align: center">
				<div class="form-group row">
				<input class="form-control" type="text"
					placeholder="請輸入關鍵字" aria-label="Search" name="courseName">
				&nbsp;&nbsp;<button class="btn btn-outline-success" type="submit">Search</button>
				</div>
			</form>
		</fieldset>
	</div>	
			
		<section id="one" class="wrapper style1">
			<div class="inner">
				<c:forEach var='course' items='${courses}'>
					<article class="feature left">
						<span class="image"><img src="../css/images/pic01.jpg" alt="" /></span>
						<div class="content">
							<h2>${course.courseName}</h2>
							<p>${course.courseCategory}</p>
							<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est.</p>
							<ul class="actions">
								<li>
									<a href="<spring:url value='/courseOrder/courseInfo?id=${course.courseId}' />" class="button alt">詳細資料</a>
								</li>
							</ul>
						</div>
					</article>
				</c:forEach> 
			</div>
		</section>
	
	<!-- 		Scripts -->
	<script src="/js/course/jquery.min.js"></script>
	<script src="/js/course//skel.min.js"></script>
	<script src="/js/course/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif] -->
	<script src="/js/course/main.js"></script>
			
</body>
</html>