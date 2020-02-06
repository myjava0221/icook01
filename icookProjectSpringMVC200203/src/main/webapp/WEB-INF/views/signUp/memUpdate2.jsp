<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>會員資料修改</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<!-- //for-mobile-apps ${pageContext.request.contextPath}-->
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- load-more -->

<!-- //load-more -->
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>

</head>
<body style='background-color: #fdf5e6'>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />
	<!-- banner1 -->
	<div class="banner1">
		<div class="container"></div>
	</div>

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="index.html">Home</a><i>|</i></li>
				<li>Update Page</li>
			</ul>
		</div>
	</div>
	<!-- //banner1 -->

	<!--  -->
	<div class="login">
		<div class="container">
			<h6>會員資料修改</h6>
			

			<jsp:useBean id="mem" scope="request"
				class="com.icook.model.MemberBean" />


			<form:form method="post" modelAttribute="MemberBean">
		<div align=center>
	
			<table width=60%>
				<tr><td width=30%>會員編號:<form:hidden path="userId"  value="${LoginOK.userId}"/>
				<tr><td><h3>${LoginOK.userId}</h3>
				<tr><td>信箱:<form:hidden path="account" value="${LoginOK.account}"/>
				<tr><td><h3>${LoginOK.account}</h3>
				<tr><td>姓:<form:input path="lastname" type="text" class="form-control" name="lastname" value="${LoginOK.lastname}"/>
				<tr><td>名:<form:input path="firstname" type="text" class="form-control" name="firstname" value="${LoginOK.firstname}"/>
				<tr><td>暱稱:<form:input path="nickname" type="text" class="form-control" name="nickname" value="${LoginOK.nickname}"/>
				<tr><td>生日:<form:input path="birthday" type="date" class="form-control" name="birthday" value="${LoginOK.birthday}"/>
				<tr><td>性別:
				<tr><td><form:radiobuttons path="gender" items='${genderMap}' value="${LoginOK.gender}"/>
				<tr><td>電話:<form:input path="phone" type="text" class="form-control" name="phone" value="${LoginOK.phone}"/>
				<tr><td>地址:<form:input path="address" type="text" class="form-control" name="address" value="${LoginOK.address}"/>
				<form:input path="password" type="hidden" class="form-control" name="password" value="${LoginOK.password}"/>
			</table>
		</div>
<br>
		<input type='submit' name='butt' value='修改'>
	</form:form>
			
						<div class="agile_back_home">
							<a href="<c:url value='/'/>">back to home</a>
						</div>
						</div>
						</div> <!-- // -->
		<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
</body>
</html>




