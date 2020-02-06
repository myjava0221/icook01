<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.text.SimpleDateFormat, java.util.Date, com.icook.model.orderDetail, com.icook.model.orderBean, com.icook.model.MemberBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
	$(function() {
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
		/* 調整分頁按鈕與上面的距離 */
		height: 545px;
	}
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />

	<c:if test="${stat == false}">
		<script>alert('沒有訂單資訊')</script>
	</c:if>

	<div id="tabs">
		<ul>
			<li><a href="#orders">貨品訂單</a></li>
			<li><a href="#test">課程訂單</a></li>
		</ul>

		<div id='test'>
			<div id='div2' class="bs-docs-example" align='center'>
				<table id='table2' class="table table-hover">
					<thead id='thead1'>
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
					<tbody id='tbody1'>
						<c:forEach varStatus="i" var="order" items="${orderData}"
							begin="${pageNo}" end="${endPage}">
							<tr>
								<td>${order.orderId}
								<td>${order.orderId}
								<td>${order.userId}
								<td>${order.shippingAddress}
								<td>${fn:substring(order.orderDate,0,10)}
								<td>${order.status}
								<td><input style='float: right;'
									class='btn btn-default btn-sm' type='button'
									onclick="changeOrderDetails(${page},${range},${order.orderId})"
									value='訂單明細' />
								<td><c:choose>
										<c:when test="${order.status == '未出貨'}">
											<td><input type='button' class='btn btn-default btn-sm'
												onclick="javascript:location.href='
											${pageContext.request.contextPath}/MyOrders/DeleteOrders?delId=${order.orderId}'"
												value='刪除訂單' />
										</c:when>
										<c:otherwise>
											<td><input type='button' class='btn btn-default btn-sm'
												disabled
												onclick="javascript:location.href='
											${pageContext.request.contextPath}/MyOrders/DeleteOrders?delId=${order.orderId}'"
												value='刪除訂單' />
										</c:otherwise>
									</c:choose> <input type='hidden' name='${order.orderId}'
									value='${order.orderId}' />
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>


		<!-- //------------------------------------------------------ -->


		<div id='orders'>
			<div id='headerdiv'>
				<div class="services-breadcrumb">
					<div class="container">
						<ul>
							<li>< 我的訂單 > 共 ${orderSize} 筆訂單</li>
						</ul>
					</div>
				</div>
			</div>
			<div id='div1' class="bs-docs-example div-height" align='center'>
				<table id='table1' class="table table-hover"
					style="width: 60%; max-width: 87%; margin-bottom: 20px;">
					<thead id='mainhead'>
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
					<tbody id='main'>
						<c:forEach varStatus="i" var="order" items="${orderData}"
							begin="${pageNo}" end="${endPage}">
							<tr>
								<td>${order.orderId}
								<td>${order.userId}
								<td>${order.shippingAddress}
								<td>${fn:substring(order.orderDate,0,10)}
								<td><fmt:formatNumber value="${order.totalAmount}"
										pattern="#,###" />
								<td id='orderStatus'>${order.status}
								<td><input style='float: right;'
									class='btn btn-default btn-sm' type='button'
									onclick="changeOrderDetails(${page},${range},${order.orderId})"
									value='訂單明細' /> <c:choose>
										<c:when test="${order.status == '未出貨'}">
											<td><input type='button' class='btn btn-default btn-sm'
												onclick="cancelButton(${page},${range},${order.orderId})"
												value='刪除訂單' />
										</c:when>
										<c:otherwise>
											<td><input type='button' class='btn btn-default btn-sm'
												disabled value='刪除訂單' />
										</c:otherwise>
									</c:choose> <input type='hidden' name='${order.orderId}'
									value='${order.orderId}' />
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div align='center' id='pagediv'>
				<c:if test="${stat == true}">
					<nav aria-label="Page navigation">
						<ul id='PaginationUl' class="pagination">
							<li><a href='javascript:' onclick="changeTable(1,${range})">first</a>
								<c:forEach varStatus="i" begin="1" end="${range}">
									<li><a href='javascript:'
										onclick="changeTable(${i.index},${range})">${i.index}</a></li>
								</c:forEach>
							<li><a href='javascript:' onclick="changeTable(${range},${range})">last</a>
						</ul>
					</nav>
				</c:if>
			</div>

		</div>
	</div>

	<!-- 分頁 ajax 部分內容改變 -->
	<script>
		var page = 1;
		var allPage = 1;
		var onePageQuantity = 8;
		
		//取得自己專案的名稱
		function getRealPath(){
			var curWwwPath=window.document.location.href;
			var pathName=window.document.location.pathname;
			var projectName=pathName.substring(1,pathName.substr(1).indexOf('/')+1);
			return projectName;
		}
		
		function cancelButton(begin,end,orderId) {
			var r=confirm("確定要刪除此筆訂單");
			if (r==true)
			  {
				cancel(begin,end,orderId);
				alert("訂單刪除成功");
			  }
			else
			  {
				changeTable(begin,end);
			  }
		}
		
		function cancel(begin,end,orderId) {
			var packageName = getRealPath();
			$.ajax({
				type : "POST",
				url : "/" + packageName + "/MyOrders/DeleteOrders?delId=" + orderId,
				dataType : "text",
				success : function(data) {
					changeTable(begin,end);
				},
				error : function(error) {
				},
			});
		}
		//只改變中間資料的部分tbody
		function changeTable(page, totalp) {
			var allPage = totalp;
			if (page >= 1 && page <= allPage) {
				var pageNo = (page - 1) * onePageQuantity;
				var packageName = getRealPath();
					$.ajax({
							type : "POST",
							url : "/" + packageName + "/appJson?page=" + page,
							dataType : "text",
							success : function(data) {
								$("#main tr").remove();							
								var temp = "";
								var lists = JSON.parse(data);
								if ((lists.length - pageNo) >= 8) {
									EndPage = pageNo + 8;
								} else {
									EndPage = lists.length;
								}
								for (var i = pageNo; i < EndPage; i++) {
									temp = "<tr><td>" + lists[i].orderId
											+ "<td>" + lists[i].userId + "<td>"
											+ lists[i].shippingAddress;
									var orderDate = (lists[i].orderDate);
									orderDate = orderDate.substring(0, 10);
									temp += "<td>" + orderDate + "<td>"
											+ parseInt(lists[i].totalAmount).toLocaleString();  
									//parseInt(字串).toLocaleString() 為字串數字加上千分位符號
									switch (lists[i].status) {
									case "N":
										temp += "<td id='orderStatus'> 未出貨";
										break;
									case "S":
										temp += "<td> 出貨中";
										break;
									case "F":
										temp += "<td> 已到貨";
										break;
									case "C":
										temp += "<td> 已取消";
										break;
									}
									temp += "<td><input type='button' style='float:right;' class='btn btn-default btn-sm' onclick='changeOrderDetails("+ page +",${range}," + lists[i].orderId + ")' value='訂單明細'  />";
									if (lists[i].status == "N") {
										temp += "<td><input type='button'  class='btn btn-default btn-sm'  onclick='cancelButton(" + page + ",${range}," + lists[i].orderId + ")' value='刪除訂單'  />"
									} else {
										temp += "<td><input type='button'  class='btn btn-default btn-sm'  disabled  value='刪除訂單'  />";
									}
									temp += "<input type='hidden' name='" + lists[i].orderId + "' value='" + lists[i].orderId + "'/>";
									$("#table1 tbody").append(temp);
								}
								
							},
							error : function(error) {
								console.log(error);
							},
						});
			}
		}
		//全部頁面重新登錄
		function recoveryTable(page, totalp) {
			var allPage = totalp;
			if (page >= 1 && page <= allPage) {
				var pageNo = (page - 1) * onePageQuantity;
				var packageName = getRealPath();
					$.ajax({
							type : "POST",
							url : "/" + packageName + "/appJson?page=" + page,
							dataType : "text",
							success : function(data) {
								$("#mainhead tr").remove();
								$("#main tr").remove();
								$("#returnDetail").remove();							
								var temp = "";
								var theadtemp = "";
								var headertemp = "";
								var pagetemp = "";
								var lists = JSON.parse(data);
								if ((lists.length - pageNo) >= 8) {
									EndPage = pageNo + 8;
								} else {
									EndPage = lists.length;
								}
								headertemp += "<div class='services-breadcrumb'><div class='container'><ul><li>< 我的訂單 > 共" + lists.length + "筆訂單</li></ul></div></div>";
								$("#headerdiv").append(headertemp);
								theadtemp += "<tr><th>訂單編號</th><th>會員編號</th><th>地址</th><th>訂購日期</th><th>總金額</th><th>狀態</th><th></th><th></th></tr>";
								$("#table1 thead").append(theadtemp);
								for (var i = pageNo; i < EndPage; i++) {
									temp = "<tr><td>" + lists[i].orderId
											+ "<td>" + lists[i].userId + "<td>"
											+ lists[i].shippingAddress;
									var orderDate = (lists[i].orderDate);
									orderDate = orderDate.substring(0, 10);
									temp += "<td>" + orderDate + "<td>"
											+ parseInt(lists[i].totalAmount).toLocaleString();  
									//parseInt(字串).toLocaleString() 為字串數字加上千分位符號
									switch (lists[i].status) {
									case "N":
										temp += "<td id='orderStatus'> 未出貨";
										break;
									case "S":
										temp += "<td> 出貨中";
										break;
									case "F":
										temp += "<td> 已到貨";
										break;
									case "C":
										temp += "<td> 已取消";
										break;
									}
									temp += "<td><input type='button' style='float:right;' class='btn btn-default btn-sm' onclick='changeOrderDetails("+ page +",${range}," + lists[i].orderId + ")' value='訂單明細'  />";
									if (lists[i].status == "N") {
										temp += "<td><input type='button'  class='btn btn-default btn-sm'  onclick='cancelButton(" + page + ",${range}," + lists[i].orderId + ")' value='刪除訂單'  />"
									} else {
										temp += "<td><input type='button'  class='btn btn-default btn-sm'  disabled  value='刪除訂單'  />";
									}
									temp += "<input type='hidden' name='" + lists[i].orderId + "' value='" + lists[i].orderId + "'/>";
									$("#table1 tbody").append(temp);
								}
								
								pagetemp += "<nav aria-label='Page navigation'> <ul id='PaginationUl' class='pagination'> <li><a href='javascript:' onclick='changeTable(1,${range})'>first</a>";
								pagetemp += "<c:forEach varStatus='i' begin='1' end='${range}'><li><a href='javascript:' onclick='changeTable(${i.index},${range})'>${i.index}</a></li></c:forEach>";
								pagetemp += "<li><a href='javascript:' onclick='changeTable(3,${range})'>last</a></ul></nav>";
								$("#pagediv").append(pagetemp);
								
							},
							error : function(error) {
								console.log(error);
							},
						});
			}
		}
		
		
		function changeOrderDetails(page,end,id) {
			var allPage = end;
			if (page >= 1 && page <= allPage) {
				var pageNo = (page - 1) * onePageQuantity;
				var packageName = getRealPath();
					$.ajax({
							type : "POST",
							url : "/" + packageName + "/MyOrders/SearchOrderDetails?id=" + id,
							dataType : "text",
							success : function(data) {
								$("#mainhead tr").remove();
								$("#main tr").remove();
								$("#pagediv nav").remove();
								$("#headerdiv div").remove();
								var theadtemp = "";
								var tbodytemp = "";
								theadtemp += "<tr><th>產品編號</th><th>產品名稱</th><th>數量</th><th>定價</th><th>折扣</th></tr>"
								var lists = JSON.parse(data);
								for(var i=0;i<lists.length;i++) {
									tbodytemp += "<tr><td>" + lists[i].productId;
									tbodytemp += "<td>" + lists[i].describe;
									tbodytemp += "<td>" + lists[i].qty;
									tbodytemp += "<td>" + lists[i].unitPrice;
									if(lists[i].discount == null) {
										tbodytemp += "<td>";
									}
									else{
										tbodytemp += "<td>" + lists[i].discount + " 折";
									}
								}
								var temp = "<input id='returnDetail' class='btn btn-default' type='button' onclick='recoveryTable(" + page + ",${range})' value='返回訂單'  />"
								$("#table1 thead").append(theadtemp);
								$("#table1 tbody").append(tbodytemp);
								$("#div1").append(temp);
							},
							error : function(error) {
							},
						});
			}
		}
	</script>

</body>
</html>