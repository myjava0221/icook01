<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>愛料理首頁</title>
	<!-- for-mobile-apps -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //for-mobile-apps ${pageContext.request.contextPath}-->
	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<!-- load-more -->
	
	<!-- //load-more -->
	<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />
	
	<!-- banner -->
	<div class="banner">
		<div class="container">
			<div class="w3ls_banner_info">
				<div class="wthree_more">
					<a href=<c:url value='recipes' /> class="button--wayra button--border-thick button--text-upper button--size-s">找食譜</a>
					<a href=<c:url value='/productSearch' /> class="button--wayra button--border-thick button--text-upper button--size-s">找商品</a>
					<a href=<c:url value='/course/courseHomePage' /> class="button--wayra button--border-thick button--text-upper button--size-s">找課程</a>
				</div>
			</div>
		</div>
	</div>
	
<!-- //banner -->
	

</body>
</html>