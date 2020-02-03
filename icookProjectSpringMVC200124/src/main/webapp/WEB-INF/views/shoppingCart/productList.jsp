<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="com.icook.model.orderItem"
	import="com.icook.model.ShoppingCart"
	import="com.icook.model.ProductTypeBean"
	import="com.icook.model.ProductBean"
%>
	
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


<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/shoppingCart.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/jquery-ui.css"
	rel="stylesheet" type="text/css" media="all" />
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />
	
	
	<!-- 搜尋功能 -->
	<div class="container align-items-center">
		<fieldset >
			<form  method="GET" action="productList" class="form-horizontal" style="text-align: center">
				<div class="form-group row">
				<input class="form-control" type="text" id="productName"
					placeholder="請輸入關鍵字" aria-label="Search" name="productName"/>
				&nbsp;&nbsp;<button class="btn btn-outline-success">Search</button>
				</div>
			</form>
		</fieldset>
	</div>


<div class="container-fluid prosDiv">
<!-- 	<p>1第一層迴圈forEach取productBean</p> -->
<!-- 	<p>2 迴圈中用core的Set設定ProductBean的type資料(Set陣列)</p> -->
<!-- 	<p>3用將此Set用toArray(new ProductTypeBean)轉成陣列後，放入List,放入sessionScope</p> -->
<!-- 	<p>4第二層迴圈 forEach取producTypetBean的資料</p> -->
		<c:forEach items="${prosList}" var="pros" varStatus="vs">
			<c:set var="prodsSet" value="${pros.type}"></c:set>
<%-- 			<c:set var="pros" value="${pros}"></c:set> --%>
			<c:set var="imgArray" value="${ImgList[vs.index]}"></c:set>
			
			<c:forEach items="${prodsSet}" var="pbt" varStatus="vs2">
<!-- 			proCount是紀錄商品數量,並作為索引代號 -->
			<c:set var="proCount" value="${proCount+1}" />
			<div class="products col-md-3 top_brand_left" id="divTop${proCount}">
			<div class="agile_top_brand_left_grid">
				<c:set var="image1" value="${pageContext.request.contextPath}/${imgArray[vs2.index]}" scope="session"></c:set>				
				<p><img width="200px" height="200" src="${pageContext.request.contextPath}/${imgArray[vs2.index]}"></img></p>
				<c:set var="pbt" value="${pbt}" scope="session" />
				<p>${pros.productName}</p>
				<p>${pros.category}</p>
				<p>${pbt.unitPrice}</p>
				<p><input style="margin:5px;" type="number" class="products${proCount} quantity${proCount}" id="qty${proCount}" value="1" min="1" max="99" /></p>
				
				<input type="hidden" class="products${proCount}" id="productId${proCount}" name="productId" value="${pros.productID}" />
				<input type="hidden" class="products${proCount}" id="productName${proCount}" name="productName" value="${pros.productName}" />
				<input type="hidden" class="products${proCount}" id="typeId${proCount}"  name="typeId" value="${pbt.typeID}" />
				<input type="hidden" class="products${proCount}" id="image1${proCount}"  name="image1" value="${pros.image1}" />
				<input type="hidden" class="products${proCount}" id="unitPrice${proCount}"  name="unitPrice" value="${pbt.unitPrice}" />
				<input type="hidden" class="products${proCount}" id="describe${proCount}"  name="describe" value="${pros.productName}(${pbt.typeTitle})" />
				<input type="hidden" class="products${proCount}" id="discount${proCount}"  name="discount" value="${pbt.discount}" />
    			
    				<button name="cmd" id="press${proCount}" class="addToCar btn btn-primary">
							Add To Car
					</button>
<%-- 						<a  href="<spring:url value='/productList/productDetail?productID=${pros.productID}&type=${pbt.typeID}'/>" class="btn btn-primary" style="color:#fff;">詳細資訊</a> --%>
 					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal${proCount}">詳細資訊</button>

 					<!-- Modal商品明細  可加入aria-hidden="true" data-backdrop="static"設定後,只能用[X]or Close來關閉Modal --> 
  					<div class="modal fade myModal" id="myModal${proCount}" role="dialog">
    					<div class="modal-dialog">
    
      					<!-- Modal content商品明細內容-->
      					<div class="modal-content">
        					<div class="modal-header">
          					<button type="button" class="close" data-dismiss="modal">&times;</button>
          					<h4 class="modal-title">愛料理商品</h4>
        					</div>
        					<div class="modal-body">
								<ul class="list-group">
  									<li class="list-group-item"><img width="200px" height="200px" src="${pageContext.request.contextPath}/${imgArray[vs2.index]}"></img></li>
  									<li class="list-group-item">商品名稱:${pros.productName}</li>
  									<li class="list-group-item">商品資訊:${pros.productInfo}</li>
  									<li class="list-group-item">商品單價:${pbt.unitPrice}</li>
  									<li class="list-group-item">商品折扣:${pbt.discount}</li>
  									<li class="list-group-item">商品特價:<fmt:formatNumber pattern="#0" value="${pbt.unitPrice*pbt.discount}" type="currency" /></li>
<%--   									<li class="list-group-item">購買數量:<input style="margin:5px;" type="number" class="products${proCount} quantity${proCount}" id="qty${proCount}" value="1" min="1" max="99" /></li> --%>
  									<li class="list-group-item">購買數量:
  									<select class="selectpicker selectQty products${proCount} quantity${proCount}" id="qty${proCount}">
									</select>
  									</li>
  									<li class="list-group-item">商品庫存${pbt.unitStock}</li>
  									<li class="list-group-item"><button name="cmd" id="press${proCount}" class="addToCar btn btn-primary">
												Add To Car
									</button></li>
								</ul>			
        					</div>
        					<div class="modal-footer">
          					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        					</div>
      					</div>
      
    					</div>
  					</div>
				</div>
				</div>
			</c:forEach>
		</c:forEach>
</div>
	
<div class="container containerPage">
  		<h2 style="margin:20px; text-align:center;">有<c:out value="${proCount}"/>件商品</h2>                
  		<ul class="pager"></ul>
</div>
<!-- 因為在.js會看不懂EL，所以用此隱藏方式給值 -->
<input id="pageContext" type="hidden" value="${pageContext.request.contextPath}" />
<!-- for bootstrap working -->
<!-- 先放這，放到head會導致modal無法使用 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/productList.js" type="text/javascript">
</script>
</body>
</html>
