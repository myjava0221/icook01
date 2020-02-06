<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.text.SimpleDateFormat, java.util.Date, com.icook.model.orderDetail, com.icook.model.orderBean, com.icook.model.MemberBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function cancelOrder() {
		if (confirm("確定取消此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "CANCEL";
			document.forms[0].action = "<c:url value='/ShoppingCar/CheckOrder'/>";
			document.forms[0].method = "GET";
			document.forms[0].submit();
			return;
		} else {
			return;
		}
	}
	function reconfirmOrder() {
		// 	var sa = document.getElementById('ShippingAddress').value;
		var sa = $('#SAddress').val();
		var email = $('#Ema').val();
		if (sa === "") {
			window.alert('出貨地址不能是空白');
			return;
		}
		if(email == "") {
			window.alert('Email不能是空白');
			return;
		}
		if (confirm("確定送出此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "ORDER";
			document.forms[0].action = "<c:url value='/ShoppingCar/CheckOrder'/>";
			document.forms[0].method = "GET";
			document.forms[0].submit();
			return;
		} else {
			return;
		}
	}
</script>
<meta charset="UTF-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
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
	width: 50%;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />
<!-- 	進度條 -->
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
        	<span style="left: 100%; background:#ccc;">3</span>
       		<span style="left: 50%;">2</span>
            <span style="left: 0%;">1</span>
   		</div>
	</div>
	
   <br><br>
   
	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li> < 訂單資訊 > </li>
			</ul>
		</div>
	</div>
	<br>
	<div align='center'>
		<h3>請確認下列訊息：</h3>
		<br>
		<form action="<c:url value='OrderServlet.do' />" method="POST">
			<table class="table table-striped" style="width: 60%; max-width: 87%; margin-bottom: 20px;">
				<thead>
					<tr>
						<th>商品名稱
						<th>優惠
						<th>單品價格
						<th>數量
						<th>小計
					</tr>
				</thead>
				<tbody>
					<c:forEach var="shopping" items="${ShoppingOrder}" varStatus="i">
						<tr><td>${shopping.describe}
							<c:choose>
								<c:when test="${empty shopping.discount}">
									<td>${shopping.discount}
								</c:when>
								<c:otherwise>
									<td>${shopping.discount} 折
								</c:otherwise>
							</c:choose>
							<td><fmt:formatNumber value="${shopping.unitPrice}" pattern="##" />
							<td>${shopping.qty}
							<c:choose>
								<c:when test="${empty shopping.discount}">
									<td> NT$ <fmt:formatNumber value="${shopping.unitPrice * shopping.qty}" pattern="#,###" />
								</c:when>
								<c:otherwise>
									<td> NT$ <fmt:formatNumber value="${shopping.unitPrice * shopping.qty * shopping.discount / 10}" pattern="#,###" />
								</c:otherwise>
							</c:choose>          	
					</c:forEach>
					<tr><td colspan='4' align='right'>合計金額 ：             
						<td> NT$ <fmt:formatNumber value="${totalMoney}" pattern="#,###" />
					<tr><td colspan='4' align='right'>運費： 
						<td> NT$ ${freight}
					<tr><td colspan='4' align='right'>總計金額： 
						<td> NT$ <fmt:formatNumber value="${total}" pattern="#,###" />
					<br>
				</tbody>
			</table>

			<div>
				<table class="table" id="tab2" style="width: 60%; max-width: 87%; margin-bottom: 20px;">
					<thead>
						<tr>
							<th>
							<th>
						</tr>
					</thead>
					<tbody>
						<tr><td>
					<c:choose>
						<c:when test="${!empty LoginOK.address}">
							<tr><td align='center' style="line-height: 32px;">送貨地址 : <td><input type='text' size = '70' style='width: 70%' id='SAddress' name='ShippingAddress' value='${LoginOK.address}'  class='form-control' aria-describedby='basic-addon1'>
						</c:when>
						<c:otherwise>
							<tr><td align='center' style="line-height: 32px;">送貨地址 : <td><input type='text' size = '70' style='width: 70%' id='SAddress' name='ShippingAddress' value='' class='form-control' aria-describedby='basic-addon1'>
						</c:otherwise>
					</c:choose>	
						<c:choose>
						<c:when test="${!empty LoginOK.account}">
							<tr><td align='center' style="line-height: 32px;">Email : <td><input type='text' size = '70' style='width: 70%' id='Ema' name='Email' value='${LoginOK.account}'  class='form-control' aria-describedby='basic-addon1'>
						</c:when>
						<c:otherwise>
							<tr><td align='center' style="line-height: 32px;">Email : <td><input type='text' size = '70' style='width: 70%' id='Ema' name='Email' value='' class='form-control' aria-describedby='basic-addon1'>
						</c:otherwise>
					</c:choose>	
						<tr>
							<td align='center' style="line-height: 32px;">發票抬頭 :
							<td><input type='text' style="width: 70%" name='invoiceTitle'
								value='' class="form-control" aria-describedby="basic-addon1">
					</tbody>
				</table>
			</div>
			<br> 
			<input type="hidden" name="finalDecision" value="">
			<input type="button" class="btn btn-default" name="OrderBtn" value="確定送出" onclick="reconfirmOrder()"> 
			<span>&nbsp;&nbsp;&nbsp;</span>
			<input type="button" class="btn btn-default" name="CancelBtn" value="取消訂單" onclick="cancelOrder()">
			<br><br>
		</form>
	</div>
</body>
</html>