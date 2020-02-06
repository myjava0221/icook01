<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="com.icook.model.orderItem"
	import="com.icook.model.ShoppingCart"
	import="com.icook.model.ProductTypeBean"
	import="com.icook.model.ProductBean"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>市集</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/shoppingCart.css"
	rel="stylesheet" type="text/css" media="all" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />

<div class="container">
<!-- 		<table id="shopCarTable" border="1"> -->
		<table class="sc_table table table-hover" id="sc_table" style="margin:0px auto;">
<!-- 			<tr style="background-color: #a8fefa"> -->
			<tr class="success">
				<th class="trHead" width="5%"><input type="checkbox" class="leaderCheckBox" style="zoom:150%;"/>
				<th class="trHead" width="15%">產品名稱
				<th class="trHead" width="15%">單價
				<th class="trHead" width="10%">優惠
				<th class="trHead" width="15%">特價
				<th class="trHead" width="14%">數量
				<th class="trHead" width="16%">小計
				<th class="trHead" width="10%" colspan="2">編輯
<!-- 				<th class="trHead" width="5%">刪除 -->
				<c:forEach  items="${ShoppingCart.content}" var="cart"
						varStatus="vs">
						<tr class="trIndex success" id="trIndex${vs.index}">
							<td><input type="checkbox" class="fromCheck" style="zoom:120%;" name="doCheckbox" id="fromCheck${vs.index}" value="${cart.key}"/>
<%-- 							<td><span>${cart.value.productId}</span> --%>
							<td>${cart.value.describe}
							<td id="unitPrice${vs.index}"><fmt:formatNumber
									pattern="#0" value="${cart.value.unitPrice}" type="currency" />元
							<td class="discount" id="discount${vs.index}"><fmt:formatNumber
									pattern="#0.0" value="${cart.value.discount}" type="currency" />折
							<td id="onSale${vs.index}"><fmt:formatNumber pattern="#0" value="${cart.value.onSale}" type="currency" />元
							<td>
								<div class="list-cart-notice-wrap">
									<div class="item-qty-control">
										<button title="減少" id="minus${vs.index}"
											class="item-qty-button item-qty-button-minus">-</button>
										<input type="text" name="qty${vs.index}" id="qty${vs.index}" 
											class="item-qty-input" value="${cart.value.qty}" readonly="readonly">
										<button title="增加" id="plus${vs.index}"
											class="item-qty-button item-qty-button-plus">+</button>
									</div>
								</div>
							</td>
							<td id="subTotal${vs.index}" style="text-align:right;"><fmt:formatNumber pattern="#0"
									value="${cart.value.unitPrice * cart.value.qty}"
									type="currency" />元
							<td><img name="cmd" class="MOD" id="MOD${vs.index}" width="24px" style="cursor:pointer;" src="${pageContext.request.contextPath}/images/save.png"/>
							<td><img name="cmd" class="DEL" id="DEL${vs.index}" width="24px" style="cursor:pointer;" src="${pageContext.request.contextPath}/images/recycle_bin2.png"/>
									<input type="hidden" id="mapKey${vs.index}" name="mapKey${vs.index}" value="${cart.key}"/>
									<input type="hidden" id="listIndex${vs.index}" name="listIndex${vs.index}" value="${vs.index}" />
					</c:forEach>
			<form id="formSubmit" action="" method="GET">		
			<tr class="success">
				<td colspan="9"><input type="submit" id="submit" value="確定購買" />
								 <input type="button" id="dd" value="刪除" />
			</form>
		</table>
</div>
<div id="demo"></div>
<input type="hidden" id="pageContext" value="${pageContext.request.contextPath}">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/shopCart.js"></script>
</body>
</html>