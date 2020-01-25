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

<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/shoppingCart.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script> -->
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
	<!-- 搜尋功能 -->
	<div class="contain align-items-center">
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

<!-- 	<p>1第一層迴圈forEach取productBean</p> -->
<!-- 	<p>2 迴圈中用core的Set設定ProductBean的type資料(Set陣列)</p> -->
<!-- 	<p>3用將此Set用toArray(new ProductTypeBean)轉成陣列後，放入List,放入sessionScope</p> -->
<!-- 	<p>4第二層迴圈 forEach取producTypetBean的資料</p> -->
		<c:forEach items="${prosList}" var="pros" varStatus="vs">
			<c:set var="prodsSet" value="${pros.type}"></c:set>
			<c:set var="pros" value="${pros}" scope="session"></c:set>
			<c:set var="imgArray" value="${ImgList[vs.index]}"></c:set>
			
			<c:forEach items="${prodsSet}" var="pbt" varStatus="vs">
<!-- 			紀錄商品數量,並作為索引代號 -->
			<c:set var="number" value="${number+1}" />
			<div class="col-md-3 top_brand_left">
			<div class="agile_top_brand_left_grid">
			<div class="agile_top_brand_left_grid1">
				<c:set var="image1" value="${pageContext.request.contextPath}/${imgArray[vs.index]}" scope="session"></c:set>				
				<p><img width="200px" height="200" src="${pageContext.request.contextPath}/${imgArray[vs.index]}"></img></p>
				<c:set var="pbt" value="${pbt}" scope="session" />
				<p>${pros.productName}</p>
				<p>${pros.category}</p>
				<p>${pbt.unitPrice}</p>
				<p><input type="number" class="products${number}" id="qty${number}" value="1" min="1" max="99" /></p>
				<input type="hidden" class="products${number}" id="productId${number}" name="productId" value="${pros.productID}" />
				<input type="hidden" class="products${number}" id="productName${number}" name="productName" value="${pros.productName}" />
				<input type="hidden" class="products${number}" id="typeId${number}"  name="typeId" value="${pbt.typeID}" />
				<input type="hidden" class="products${number}" id="image1${number}"  name="image1" value="${pros.image1}" />
				<input type="hidden" class="products${number}" id="unitPrice${number}"  name="unitPrice" value="${pbt.unitPrice}" />
				<input type="hidden" class="products${number}" id="describe${number}"  name="describe" value="${pros.productName}(${pbt.typeTitle})" />
				<input type="hidden" class="products${number}" id="discount${number}"  name="discount" value="${pbt.discount}" />
				<button name="cmd" id="press${number}" class="rt-button rt-button-xlarge list-cart-submit rt-button-submit">
					Add To Car
				</button>
    			<div class="wthree_more wthree_more2" style="width:300px;">
					<a href="<spring:url value='/productDetail?productID=${pros.productID}&type=${pbt.typeID}'/>" 
						class="button--wayra button--border-thick button--text-upper button--size-s">
						詳細資訊
					</a>	
				</div>
				
				</div>
				</div>
				</div>
			</c:forEach>
		</c:forEach>
		<!-- for bootstrap working -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript">

		$(document).ready(function() {
			console.log("Hello");console.log("Hello");
			console.log("Hello");console.log("Hello");
			console.log("Hello");console.log("Hello");
			
			var curWwwPath=window.document.location.href;
			console.log(curWwwPath);
			var pathName=window.document.location.pathname;
			console.log(pathName);
			
			function getRealPath(){
				var curWwwPath=window.document.location.href;
				var pathName=window.document.location.pathname;
				var projectName=pathName.substring(1,pathName.substr(1).indexOf('/')+1);
				return projectName;
			}	
			
		$(".rt-button").click(function(){
			alert("加入購物車成功");
			var id = $(this).attr("id"); 
// 			若id =press10,取數字部分10當index
			index = id.replace("press","");
			var product = { 
					  productId   : $("#productId"+index).val(),
					  productName : $("#productName"+index).val(),
					  qty 		  : $("#qty"+index).val(),
					  typeId      : $("#typeId"+index).val(),
				      image1      : $("#image1"+index).val(),
				      unitPrice   : $("#unitPrice"+index).val(),
				      describe    : $("#describe"+index).val(),
				      discount	  : $("#discount"+index).val(),
					};
			//語法:JSON.stringify(物件) = 將物件轉換成JSON格式的字串(就是字串)
			var dataJSONString = JSON.stringify(product);
			console.log(dataJSONString);
			//語法:JSON.parse(JSON格式字串or陣列) = 將JSON格式字串or陣列轉換成JSON物件
			var dataJSONObject = JSON.parse(dataJSONString);
			console.log(dataJSONObject);
			$.ajax({
				url:"${pageContext.request.contextPath}/shoppingCart/addToCar?",//後端controller的URL
				type:"POST",//用POST的方式
				cache: false,   //是否暫存
// 				contentType: 'application/json; charset=UTF-8',//傳送json格式資料給server時
// 				dataType: "json",
				dataType: "text",
				data: dataJSONObject,
// 				data: { key: value }, 
// 							傳送給後端的資料,格式為Key/Value  
				success:function(data){   //成功後回傳的資料data,目前沒用到不理他
// 					showNames(data);
// 					console.log(data);
				},
				error:function(err){ //發生伺服器404、500、304等錯誤時會用此function處理,err封裝錯誤訊息
					console.log(err);
				}
			});
		})	
// 		function showNames(data){
// 			alert(data);
// 		}
})
</script>
</body>
</html>
