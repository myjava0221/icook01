<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="com.icook.model.ProductTypeBean"
	import="com.icook.model.ProductBean"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>市集</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/shoppingCart.css"
	rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- load-more -->
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />

	<div class="col-sm-10" style="width: 160px;">
		<div class="wthree_more wthree_more2" style="width: 200px;">
			<p>${pros.productID}</p>
			<p><img src="${image1}" /></p>
			<p>商品名稱:${pros.productName}</p>
			<p>商品資訊:${pros.productInfo}</p>
			<p>商品單價:${pbt.unitPrice}</p>
			<p>商品折扣:${pbt.discount}</p>
			<p>商品特價:${pbt.unitPrice*pbt.discount}</p>
			<p>商品庫存${pbt.unitStock}</p>
			<p>
				<button name="Thebutton"
					class="rt-button rt-button-xlarge list-cart-submit rt-button-submit">
					<span>Add To Car</span>
				</button>
			</p>
		</div>
	</div>
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
</body>
</html>