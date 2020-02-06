<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap2.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/progressBar/progressbar.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<style type="text/css">
.progressBar div span {
	position: absolute;
	display: inline-block;
	background: rgb(224, 104, 6);
	height: 10px;
	width: 98%;
}
</style>	
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />
	
	<div class="container">
		<div class="progressBar" >
			<div>
            	<h3>購物清單</h3>
            	<h3>訂單確認</h3>
            	<h3>完成購買</h3>
        	</div>
        <!-- 进度条 -->
        	<div>
            	<span></span>
        	</div>
        <!-- 三个圆 -->
        	<span style="left: 100%;">3</span>
       		<span style="left: 50%;">2</span>
            <span style="left: 0%;">1</span>
   		</div>
	</div>
	<br><br>
	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li> < 訂購完成 > </li>
			</ul>
		</div>
	</div>
	
	<div align="center">
	<br><br><br><br><br><br><br>
		<h2>感謝您的訂購<br>
		您的訂單編號 : ${UID} <br>
		您可至會員中心查看您的訂單
		</h2>
		<br><br>
		<input type="button" class="btn btn-default" onclick="javascript:location.href='${pageContext.request.contextPath}/MyOrders/Orders?page=1'"  name="OrderDetails" value="訂單">
	</div>
</body>
</html>