<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.text.SimpleDateFormat, java.util.Date, com.icook.model.orderDetail, com.icook.model.orderBean, com.icook.model.MemberBean"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>愛料理首頁</title>
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
<link href="${pageContext.request.contextPath}/css/bootstrap2.css"
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
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />
	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li>< 訂單明細 >  </li>
			</ul>
		</div>
	</div>
	<div class="bs-docs-example" align='center'>
		<table class="table" style="width: 60%; max-width: 87%; margin-bottom: 20px;">
			<thead>
				<tr>
					<th>產品編號</th>
					<th>產品名稱</th>
					<th>數量</th>
					<th>定價</th>
					<th>折扣</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach varStatus="i" var="orderDetails" items="${orderDetailsData}">
					<tr><td>${orderDetails.productId}
					<td>${orderDetails.describe}
					<td>${orderDetails.qty}
					<td>${orderDetails.unitPrice}
					<c:choose>
						<c:when test="${empty orderDetails.discount}">
							<td>${orderDetails.discount}
						</c:when>
						<c:otherwise>
							<td>${orderDetails.discount} 折
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
		<input class='btn btn-default' type='button' onclick="javascript:location.href='${pageContext.request.contextPath}/MyOrders/Orders?page=${page}'" value='返回訂單'  />
	</div>
</body>
</html>