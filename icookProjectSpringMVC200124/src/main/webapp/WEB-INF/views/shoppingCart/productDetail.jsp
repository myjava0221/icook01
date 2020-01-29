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
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- load-more -->
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
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
					class="addToCar btn btn-primary">
					<span>Add To Car</span>
				</button>
			</p>
		</div>
	</div>
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>

<script>
$(document).ready(function() {
//		========================a加入購物車a=========================		
	$(".addToCar").click(function(){
		alert("加入購物車成功");
		var id = $(this).attr("id"); 
//			若id =press10,取數字部分10當index
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
		var url="${pageContext.request.contextPath}/shoppingCart/addToCar?";
		console.log(dataJSONObject);
		doAjax(url,dataJSONObject);
//			特別注意!!在控制器@GetMapping的productList_get一定要建立ShoppingCart的session(第46行)
//			否則就算有註解,${ShoppingCart}雖然不會有事,但${ShoppingCart.itemNumber}一定會死給你看,千萬要小心
		console.log("${ShoppingCart}");
		console.log("${ShoppingCart.itemNumber}");
		$("#cartNo").load("");
	})
	
//		使用ajax不刷新頁面執行控制器or前端(未實驗)
	function doAjax(targetUrl,inputData,outputData){
		$.ajax({
			url:targetUrl,//後端controller的URL
			type:"POST",//用POST的方式
			cache: false,   //是否暫存
//				contentType: 'application/json; charset=UTF-8',//傳送json格式資料給server時
//				dataType: "json",
			dataType: "text",
			data: inputData,
//				data: { key: value }, 
//							傳送給後端的資料,格式為Key/Value  
			success:function(data){   //成功後回傳的資料data,目前沒用到不理他
//					showNames(data);
//					console.log(data);
				outputData;
			},
			error:function(err){ //發生伺服器404、500、304等錯誤時會用此function處理,err封裝錯誤訊息
				console.log(err);
			}
		});
	}
		
})	
</script>
</body>
</html>