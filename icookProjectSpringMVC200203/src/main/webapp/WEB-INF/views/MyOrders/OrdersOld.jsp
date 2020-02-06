<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.text.SimpleDateFormat, java.util.Date, com.icook.model.orderDetail, com.icook.model.orderBean, com.icook.model.MemberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>愛料理首頁</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1);
</script>
<link href="${pageContext.request.contextPath}/css/bootstrap2.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(function(){
   	 $("#tabs").tabs();
 	});
</script>
<style>
.choosepage {
	position: absolute;
	bottom: 45px;
	left: 50%;
}

@media ( min-width : 991px) {
	.div-height {
		/* 			width:3000px;  */
		height: 580px;
	}
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />
	<%
		boolean status = (boolean) session.getAttribute("stat");
		if (status == false) {
			out.print("<script>alert('沒有訂單資訊')</script>");
		}
		List<orderBean> order = new LinkedList<>();
		//取得訂單的資訊
		order = (List<orderBean>) session.getAttribute("orderData");
		//拿到現在的頁數
		int pageNum = (int) session.getAttribute("page");
		//檔案的名稱 		
		String packageName = "icookProjectSpringMVC191229";
	%>
	
	<div id="tabs">
		<ul>
			<li><a href="#orders">貨品訂單</a></li>
			<li><a href="#test">課程訂單</a></li>
		</ul>

		<div id='test'>
			123
		</div>
		
		<div id='orders'>
			<div class="services-breadcrumb">
				<div class="container">
					<ul>
						<li>< 我的訂單 > 共<%=order.size()%>筆訂單
						</li>
					</ul>
				</div>
			</div>
			
			<div class="bs-docs-example div-height" align='center'>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>訂單編號</th>
							<th>會員編號</th>
							<th>地址</th>
							<th>訂購日期</th>
							<th>總金額</th>
							<th>狀態</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
							int pageNo = (pageNum - 1) * 9;
							if ((order.size() - pageNo) >= 9) {
								for (int i = pageNo; i < pageNo + 9; i++) {
									String date = (order.get(i).getOrderDate()).substring(0, 10);
									out.print("<tr><td>" + order.get(i).getOrderId());
									out.print("<td>" + order.get(i).getUserId());
									out.print("<td>" + order.get(i).getShippingAddress());
									out.print("<td>" + date);
									out.print("<td>" + order.get(i).getTotalAmount());
									switch (order.get(i).getStatus()) {
									case "N":
										out.print("<td> 未出貨");
										break;
									case "S":
										out.print("<td> 出貨中");
										break;
									case "F":
										out.print("<td> 已到貨");
										break;
									case "C":
										out.print("<td> 已取消");
										break;
									}
									out.print(
											"<td><input style='float:right;'  class='btn btn-default btn-sm'   type='button' onclick=\"javascript:location.href='/"
													+ packageName + "/MyOrders/SearchOrderDetails?id=" + order.get(i).getOrderId()
													+ "'\" value='訂單明細'  />");
									if ((order.get(i).getStatus()).equals("N")) {
										out.print(
												"<td><input type='button'  class='btn btn-default btn-sm'    onclick=\"javascript:location.href='/"
														+ packageName + "/MyOrders/DeleteOrders?delId=" + order.get(i).getOrderId()
														+ "'\" value='刪除訂單'  />");
									} else {
										out.print(
												"<td><input type='button'  class='btn btn-default btn-sm'  disabled  onclick=\"javascript:location.href='/"
														+ packageName + "/MyOrders/DeleteOrders?delId=" + order.get(i).getOrderId()
														+ "'\" value='刪除訂單'  />");
									}
									out.print("<input type='hidden' name='" + order.get(i).getOrderId() + "' value='"
											+ order.get(i).getOrderId() + "'/>");
								}
							} else {
								for (int i = pageNo; i < order.size(); i++) {
									String date = (order.get(i).getOrderDate()).substring(0, 10);
									out.print("<tr><td>" + order.get(i).getOrderId());
									out.print("<td>" + order.get(i).getUserId());
									out.print("<td>" + order.get(i).getShippingAddress());
									out.print("<td>" + date);
									out.print("<td>" + order.get(i).getTotalAmount());
									switch (order.get(i).getStatus()) {
									case "N":
										out.print("<td> 未出貨");
										break;
									case "S":
										out.print("<td> 出貨中");
										break;
									case "F":
										out.print("<td> 已到貨");
										break;
									case "C":
										out.print("<td> 已取消");
										break;
									}
									out.print(
											"<td><input type='button' style='float:right;' class='btn btn-default btn-sm' onclick=\"javascript:location.href='/"
													+ packageName + "/MyOrders/SearchOrderDetails?id=" + order.get(i).getOrderId()
													+ "'\" value='訂單明細'  />");
									if ((order.get(i).getStatus()).equals("N")) {
										out.print(
												"<td><input type='button'  class='btn btn-default btn-sm'  onclick=\"javascript:location.href='/"
														+ packageName + "/MyOrders/DeleteOrders?delId=" + order.get(i).getOrderId()
														+ "'\" value='刪除訂單'  />");
									} else {
										out.print(
												"<td><input type='button' class='btn btn-default btn-sm'  disabled onclick=\"javascript:location.href='/"
														+ packageName + "/MyOrders/DeleteOrders?delId=" + order.get(i).getOrderId()
														+ "'\" value='刪除訂單'  />");
									}
									out.print("<input type='hidden' name='" + order.get(i).getOrderId() + "' value='"
											+ order.get(i).getOrderId() + "'/>");
								}
							}
						%>
					</tbody>
				</table>
			</div>
			<div align='center'>
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<!-- 				<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> -->
						<!-- 				</a></li> -->
						<%
							int pageAdd = pageNum;
							int pageLos = pageNum;
							if (pageAdd == 1) {
								out.print(
										"<li class='active'><a href='#' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span>");
							} else {
								pageAdd = pageAdd - 1;
								out.print("<li><a href='/" + packageName + "/MyOrders/Orders?page=" + pageAdd
										+ "' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span>");
							}

							int range = 0;
							if ((order.size() % 9) == 0) {
								range = order.size() / 9;
							} else {
								range = (order.size() / 9) + 1;
							}
							for (int j = 1; j <= range; j++) {
								out.print("<li><a href='/" + packageName + "/MyOrders/Orders?page=" + j + "'>" + j + "</a></li>");
							}

							if (pageLos == range) {
								out.print("<li class='active'><a href='#' aria-label='Next'> <span aria-hidden='true'>&raquo;</span>");
							} else {
								pageLos = pageLos + 1;
								out.print("<li><a href='/" + packageName + "/MyOrders/Orders?page=" + pageLos
										+ "' aria-label='Next'> <span aria-hidden='true'>&raquo;</span>");
							}
						%>
						<!-- 				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> -->
						<!-- 				</a></li> -->
					</ul>
				</nav>
			</div>
		</div>
	</div>
	
	
	<script>
		
	</script>
	
</body>
</html>