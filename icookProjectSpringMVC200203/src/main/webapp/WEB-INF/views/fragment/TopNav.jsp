<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<head>
<!-- 卡車套版 -->
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<!-- //卡車套版 -->
</head>

<body>
	<header>
			<div class="header">
			<div class="container">
				<div class="navbar-header">
					  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					  </button>
					  <!-- 確定一下網頁名稱 -->
						<div class="logo">
							<a class="navbar-brand" href=<c:url value='/' />>
								<img alt="首頁" src="${pageContext.request.contextPath}/css/images/Logo.jpg" height=50px;>
							</a>
<!-- 							<h1><a class="navbar-brand" href=<c:url value='/' />>iCook</a></h1> -->
						</div>
					</div>
				<div class="w3l_header_right">
					<c:choose>
						<c:when test="${empty LoginOK}">
							<ul>					
								<li><a href=<c:url value='/login/loginView' /> style="margin: 10px"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>登入</a></li>
								<li><a href=<c:url value='/SignUp/memberSignUp' /> style="margin: 10px"><span class="glyphicon glyphicon-user" aria-hidden="true" ></span>註冊</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul>
								<li><h4>Hello, ${LoginOK.nickname} !!</h4>
								<li><a href=<c:url value='/login/logout'/> style="margin: 10px"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>登出</a></li>
								<li><a href=<c:url value='/SignUp/memUpdate'/> style="margin: 10px"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>會員資料</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<c:choose>
			<c:when test="${!empty LoginOK}">
				<div class="logo_nav">
					<div class="container">
						<nav class="navbar navbar-default">
							<!-- Brand and toggle get grouped for better mobile display -->
		<!-- 					<div class="navbar-header"> -->
		<!-- 					  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> -->
		<!-- 						<span class="sr-only">Toggle navigation</span> -->
		<!-- 						<span class="icon-bar"></span> -->
		<!-- 						<span class="icon-bar"></span> -->
		<!-- 						<span class="icon-bar"></span> -->
		<!-- 					  </button> -->
		<!-- 					  確定一下網頁名稱 -->
		<!-- 						<div class="logo"> -->
		<!-- 							<h1><a class="navbar-brand">i<span>c</span>ook</a></h1> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
			
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
								<nav class="link-effect-2 fixed-top" id="link-effect-2">
									<ul class="nav navbar-nav">
										<li class="active"><a href=<c:url value='/' />><span data-hover="Home">首頁</span></a></li>
										<li><a href=<c:url value='/recipes/list?userId=${LoginOK.userId}' />><span data-hover="Recipe">會員食譜列表</span></a></li>
										<li><a href=<c:url value='/shoppingCart/productList' />><span data-hover="Market">市集</span></a></li>
										<li><a href=<c:url value='/MyOrders/Orders?page=1'/>><span data-hover="Order">訂單</span></a></li>
										<li><a href=<c:url value='/shoppingCart/shopCart' />><span data-hover="Car">購物車<span class="badge" id="cartNo"></span></span></a></li>
										<li><a href=<c:url value='/course/courseHomePage' />><span data-hover="course ">課程</span></a></li>
										
									</ul>
								</nav>
							</div>
							<!-- /.navbar-collapse -->
						</nav>
					</div>
				</div>
			</c:when>
			</c:choose>
<!-- 	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<%-- 	<script type="text/javascript" src="<c:url value='/WEB-INF/views/js/jquery-2.1.4.min.js' />"></script> --%>
	</header>
	<!-- //header -->
</body>
<script>
$(document).ready(function() {
	$("#cartNo").text("${ShoppingCart.itemNumber}");
})
</script>