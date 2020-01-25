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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		<table id="shopCarTable" border="1">
<!-- 			<tr style="background-color: #a8fefa"> -->
			<tr>
				<th class=trHead>產品編號
				<th class="trHead">產品名稱
				<th class="trHead">單價
				<th class="trHead">折扣
				<th class="trHead">特價
				<th class="trHead">數量
				<th class="trHead">小計
				<th class="trHead">修改
				<th class="trHead">刪除
				<c:forEach items="${ShoppingCart.content}" var="cart"
						varStatus="vs">
						<tr>
							<td>${cart.value.productId}
							<td>${cart.value.describe}
							<td id="unitPrice${vs.index}">NT<fmt:formatNumber
									pattern="#0" value="${cart.value.unitPrice}" type="currency" />
							<td id="discount${vs.index}">${cart.value.discount}
							<td id="onSale${vs.index}">NT<fmt:formatNumber pattern="#0" value="${cart.value.onSale}" type="currency" /> 
							<td>
								<form action="${pageContext.request.contextPath}/shoppingCart/shopCart" method="post">
								<div class="list-cart-notice-wrap">
									<div class="item-qty-control">
										<button type="button" title="減少" id="minus${vs.index}"
											class="item-qty-button item-qty-button-minus">-</button>
										<input type="text" name="qty${vs.index}" id="qty${vs.index}" class="item-qty-input"
											value="${cart.value.qty}" readonly="readonly">

										<button type="button" title="增加" id="plus${vs.index}"
											class="item-qty-button item-qty-button-plus">+</button>
									</div>
									<!-- 							<div class="list-cart-notice rt-text-medium rt-text-error"> -->
									<!-- 							</div> -->
								</div>
							</td>
							<td id="subTotal${vs.index}"><fmt:formatNumber pattern="#0"
									value="${cart.value.unitPrice * cart.value.qty}"
									type="currency" /> 
<!-- 							<form action="../UpdateICookItem" method="post"> -->
<%-- 								<td><button class="delete" id="del${vs.index}">刪除</button> --%>
							<td><button name="cmd" value="MOD">修改</button>
							<td><button name="cmd" id="DEL"  value="DEL">刪除</button>
									<input type="hidden" name="mapKey" value="${cart.key}"/>
									<input type="hidden" name="listIndex" value="${vs.index}" />
							</form>
					</c:forEach>
			<form action="${pageContext.request.contextPath}/ShoppingCar/OrderCheck" method="GET">		
			<tr>
				<td colspan="7"><input type="submit" id="submit" value="確定購買" />
			</form>
		</table>
</body>
<script>
	$(document).ready(function() {
		// 	$(window).load(function() {

		$(".item-qty-button-plus").click(function() {
			var id = $(this).attr("id");
			var index = id.substring(4);
			var onSale = $("#onSale"+index).text();
			onSale = onSale.substring(2);
			var qty = $("#qty" + index).val();
			if (qty < 99) {
				qty = Number(qty) + 1;
			}
			
			$("#qty" + index).val(qty);
			$("#subTotal" + index).text(qty * onSale  + "元");
		})

		$(".item-qty-button-minus").click(function() {
			var id = $(this).attr("id");
			var index = id.substring(5);
			var onSale = $("#onSale" + index).text();
			onSale = onSale.substring(2);
			var qty = $("#qty" + index).val();
			if (qty > 1) {
				qty = Number(qty) - 1;
			}
			$("#qty" + index).val(qty);
			$("#subTotal" + index).text(qty * onSale + "元");
		})
		
		//以單價做計算時
// 		$(".item-qty-button-plus").click(function() {
// 			var id = $(this).attr("id");
// 			var index = id.substring(4);
// 			var unitPriceId = "#unitPrice" + index;
// 			var unitPrice = $(unitPriceId).text();
// 			unitPrice = unitPrice.substring(2);
// 			var qtyId = "#qty" + index;
// 			var qty = $(qtyId).val();
// 			var subTotalId = "#subTotal" + index;
// 			if (qty < 99) {
// 				qty = Number(qty) + 1;
// 			}
// 			$(qtyId).val(qty);
// 			$(subTotalId).text(qty * unitPrice + "元");
// 		})

// 		$(".item-qty-button-minus").click(function() {
// 			var id = $(this).attr("id");
// 			var index = id.substring(5);
// 			var unitPriceId = "#unitPrice" + index;
// 			var unitPrice = $(unitPriceId).text();
// 			unitPrice = unitPrice.substring(2);
// 			var qtyId = "#qty" + index;
// 			var qty = $(qtyId).val();
// 			var subTotalId = "#subTotal" + index;

// 			if (qty > 1) {
// 				qty = Number(qty) - 1;
// 			}
// 			$(qtyId).val(qty);
// 			$(subTotalId).text(qty * unitPrice + "元");
// 		})

		$("#submit").click(function() {
			if(confirm("確定購買 ?") ) {
				return true;
			}else{
				return false;
			}
		})
		
		
		$(".delete").click(function() {
			if(confirm("確定刪除此商品?")==true){
				var id = $(this).attr("id");
				var index = Number(id.substring(3));
				alert(index);
				if(index==1){
						$("tr").eq(index).remove();
				}else{
						$("tr").eq(index+1).remove();
				}
				$("#remove").html("<td>${cart.value.productId}</td>");
			}
		})
		
		
		function confirmDelete(n) {
	if (confirm("確定刪除此項商品 ? ") ) {
		document.forms[0].action="<c:url value='UpdateICookItem?cmd=DEL&pid_pty=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	
	}
}
function modify(key, qty, index) {
	var x = "newQty" + index;
	var newQty = document.getElementById(x).value;
	if  (newQty < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}
	if  (newQty == 0 ) {
		window.alert ("請執行刪除功能來刪除此項商品");
		document.getElementById(x).value = qty;
		return ; 
	}
	if  (newQty == qty ) {
		window.alert ("新、舊數量相同，不必修改");
		return ; 
	}
	if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty + " ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem.do?cmd=MOD&bookId=" + key + "&newQty=" + newQty +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
		document.getElementById(x).value = qty;
	}
}
	})
</script>
</html>