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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/shoppingCart.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/jquery-ui.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
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
			<c:set var="pros" value="${pros}" scope="session"></c:set>
			<c:set var="imgArray" value="${ImgList[vs.index]}"></c:set>
			
			<c:forEach items="${prodsSet}" var="pbt" varStatus="vs2">
<!-- 			紀錄商品數量,並作為索引代號 -->
			<c:set var="proCount" value="${proCount+1}" />
			<div class="products col-md-3 top_brand_left" id="divTop${proCount}">
			<div class="agile_top_brand_left_grid">
<!-- 			<div class="agile_top_brand_left_grid1"> -->
				<c:set var="image1" value="${pageContext.request.contextPath}/${imgArray[vs2.index]}" scope="session"></c:set>				
				<p><img width="200px" height="200" src="${pageContext.request.contextPath}/${imgArray[vs2.index]}"></img></p>
				<c:set var="pbt" value="${pbt}" scope="session" />
				<p>${pros.productName}</p>
				<p>${pros.category}</p>
				<p>${pbt.unitPrice}</p>
				<p><input style="margin:5px;" type="number" class="products${proCount}" id="qty${proCount}" value="1" min="1" max="99" /></p>
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
						<a  href="<spring:url value='/productList/productDetail?productID=${pros.productID}&type=${pbt.typeID}'/>" class="btn btn-primary" style="color:#fff;">詳細資訊</a>
<!-- 				</div> -->
				</div>
				</div>
			</c:forEach>
		</c:forEach>
	
</div>
	<!-- for bootstrap working -->
<div class="container">
  		<h2 style="margin:20px; text-align:center;">有<c:out value="${proCount}"/>件商品</h2>                
  		<h2 style="text-align:center;">共XX頁</h2>
  		<ul class="pager">
<!--    	 	<li><a href="#">Previous</a></li> -->
<!--     		<li><a href="#">Next</a></li> -->
  		</ul>
</div>
<script type="text/javascript">
$(document).ready(function() {
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
		
// 		======================p分頁p==========================
		
		var pageSet = 4;//tip:每個分頁顯示的商品數量
		console.log( typeof(pageSet));//tip:typeof(pageSet)查看型態
		var proCount = ${proCount};//tip:商品數量
		var page = 0;
		console.log("pageTypeOf:"+typeof(page))
		console.log("pageS:"+page);
		//tip: 總頁數 , Math.ceil()=無條件進位
		var totalPage = Math.ceil(proCount/pageSet); 
		showPagePros(page);//tip:剛載入就顯示此頁商品數量
		var pageList='<li class=\"listPaper\" id=\"listPaper\"><button class=\"btLi ui-button ui-widget ui-corner-all\" id=\"pageFirst\">頁首</button></li><li class=\"listPaper\" id=\"listPaper\"><button class=\"pagePre ui-button ui-widget ui-corner-all\" id=\"pagePre\">上一頁</button></li>';
		var finalPage=0; 
		for(var thePage=0;thePage<totalPage;thePage++){
// 			url= "${pageContext.request.contextPath}/shoppingCart/productList?page="+i;
// 			pageList+='<li class=\"listPaper\" id=\"li'+i+'\"><a href="<spring:url value="'+url+'"/>">'+i+'</a></li>';
			pageList+='<li class=\"listPaper\" id=\"listPaper\"><button class=\"btLi\" id=\"btLi'+thePage+'\">'+(thePage+1)+'</button></li>';
			finalPage=thePage; //tip:儲存末頁的頁碼
		}
		pageList+='<li class=\"listPaper\" id=\"listPaper\"><button class=\"pageNext ui-button ui-widget ui-corner-all\" id=\"pageNext\">下一頁</button></li><li class=\"listPaper\" id=\"listPaper\"><button class=\"btLi ui-button ui-widget ui-corner-all \" id=\"pageLast\">頁尾</button></li>';
		$(".pager").html(pageList);
		
		var btLi = $(".btLi"); //tip:將同名class以List儲存,故提取時可以用.get(0)、get(1)、get(n)
		console.log(btLi);// tip:此List[btn頁首、btn0、btn1、btn2、btn3、btn頁尾]
		
// 		高亮顯示第一頁的按鈕	
		if(totalPage>0){
			lightBtn($(btLi.get(1)));
	}		
// 		hidePreNext(page);//tip:載入時顯示or隱藏的按鈕
		
// 		點擊頁碼按鈕
		$(".btLi").click(function(){
			var id = $(this).attr("id");
			var thisBtn = $(this);
			if(id=="pageFirst"){
				page = 0;
				thisBtn = $(btLi.get(1));
			}
			else if (id=="pageLast"){
				page = finalPage;
				thisBtn = $(btLi.get(finalPage+1));
			}
			else {page = Number(id.replace("btLi",""));}
			showPagePros(page);
			removeLightBtn()
			lightBtn(thisBtn);
		})
		
// 		點上一頁按鈕
		$("#pagePre").click(function(){
			if(page>0){page--;}
			showPagePros(page);
			removeLightBtn()
			var lightPageIndex = page+1;
			console.log("page:"+page);
			console.log("lightPageIndex:"+lightPageIndex);
			lightBtn($(btLi.get(lightPageIndex)));
// 			hidePreNext();
		})	
		
// 		點下一頁按鈕
		$("#pageNext").click(function(){
			
			if(page<totalPage-1){page++;}
			showPagePros(page);
			removeLightBtn()
			var lightPageIndex = page+1;
			console.log("page:"+page);
			console.log("lightPageIndex:"+lightPageIndex);
			lightBtn($(btLi.get(lightPageIndex)));
// 			hidePreNext();
		})		
		
// 		標記指定按鈕
		function lightBtn(targetBtn){
			targetBtn.addClass("pointBtnPage");
		}
		
// 		移除所有標記按鈕
		function removeLightBtn(){
			$(".pointBtnPage").each(
				function(){
					$(this).removeClass("pointBtnPage");	
				})
		}		

// 		隱藏前進後退按鈕
		function hidePreNext(){
			console.log("Hide");
			console.log("page:"+page);
			console.log("page==0:"+(page==0));
			console.log("totalPage:"+totalPage);
			if(page==totalPage-1){
				$("#pageNext").hide();	
				$("#pageLast").hide();
				$("#pagePre").show();
				$("#pageFirst").show();			
			}else if(page==0){
				$("#pagePre").hide();
				$("#pageFirst").hide();	
				$("#pageNext").show();	
				$("#pageLast").show();	
			}else{
				$("#pageNext").show();
				$("#pagePre").show();	
				$("#pageFirst").show();	
				$("#pageLast").show();	
			}
	}	
		
// 		顯示某分頁商品
		function showPagePros(page){
			$.each($(".products"),function(contentindex){
				if(contentindex>=page*pageSet && contentindex < (page+1)*pageSet){
					$(this).show();	
				}else{$(this).hide();}
			});	
// 			hidePreNext(page);
		}
// 		測試$.each,目前沒用到
		function testEach(){
			$.each($(".products"), function( index, value ) {
  				console.log( index + ": " + value );
			});
		}		
// 		========================a加入購物車a=========================		
		
		$(".addToCar").click(function(){
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
			var url="${pageContext.request.contextPath}/shoppingCart/addToCar?";
			console.log(dataJSONObject);
			doAjax(url,dataJSONObject);
// 			特別注意!!在控制器@GetMapping的productList_get一定要建立ShoppingCart的session(第46行)
// 			否則就算有註解,${ShoppingCart}雖然不會有事,但${ShoppingCart.itemNumber}一定會死給你看,千萬要小心
			console.log("${ShoppingCart}");
			console.log("${ShoppingCart.itemNumber}");
			$("#cartNo").load("");
		})
// 		=======================s每x毫秒刷新頁面s==========================			
		function refresh(){ 
			    //update src attribute with a cache buster query 
			    setTimeout("refresh();",10) 
			} 
		
// 		使用ajax不刷新頁面執行控制器or前端(未實驗)
		function doAjax(targetUrl,inputData,outputData){
			$.ajax({
				url:targetUrl,//後端controller的URL
				type:"POST",//用POST的方式
				cache: false,   //是否暫存
// 				contentType: 'application/json; charset=UTF-8',//傳送json格式資料給server時
// 				dataType: "json",
				dataType: "text",
				data: inputData,
// 				data: { key: value }, 
// 							傳送給後端的資料,格式為Key/Value  
				success:function(data){   //成功後回傳的資料data,目前沒用到不理他
// 					showNames(data);
// 					console.log(data);
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