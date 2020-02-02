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
<!-- 			<div class="agile_top_brand_left_grid1"> -->
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
<!-- 				</div> -->
				</div>
				</div>
			</c:forEach>
		</c:forEach>
	
</div>
	
<div class="container containerPage">
  		<h2 style="margin:20px; text-align:center;">有<c:out value="${proCount}"/>件商品</h2>                
  		<h3 style="text-align:center;">每頁&nbsp;
  			<select class="selectCountPage" id="selectCountPage">
  				<option>4</option>
  				<option selected>8</option>
  				<option>12</option>
  				<option>36</option>
  			</select>項商品 &nbsp;
  		到第&nbsp;<select class="selectPage" id="selectPage"></select>&nbsp;頁</h3>
  		<ul class="pager"></ul>
</div>

<!-- for bootstrap working -->
<!-- 先放這，放到head會導致modal無法使用 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script> --%>
<script type="text/javascript">
$(document).ready(function() {
	
//		======================p輸入商品數量select p==========================		
	//S輸入商品數量
		var optionList='';
		for(var optionSet=1;optionSet<=10;optionSet++){
			optionList+='<option>'+optionSet+'</option>';
		}
		$(".selectQty").html(optionList);
		
// 		======================p分頁p==========================
		
		var pageSet = 8;//tip:每個分頁顯示的商品數量
		console.log( typeof(pageSet));//tip:typeof(pageSet)查看型態
		var proCount = ${proCount};//tip:商品數量
		
		
		//tip: 總頁數 , Math.ceil()=無條件進位
		var totalPage = Math.ceil(proCount/pageSet);
		
		var page = 1;//tip:設定第一頁頁碼
		var reloadCount = false;
		
		//ss調整顯示商品筆數(未完)
		$(".selectCountPage").change(function(){
			pageSet = $("#selectCountPage").val();
			console.log("pageSet:"+pageSet);
			totalPage = Math.ceil(proCount/pageSet);
			entryPage();
			buildPage();
			//因為按鈕在調整筆數後重寫,所以要再讀一次
// 			$("input[class*='products']").load("productList");
			$(".btLi").load("");
			showPagePros();
		})
		
		
		buildPage();//建立頁碼
		showPagePros();//tip:剛載入就顯示此頁商品數量

		var finalPage; //tip:儲存末頁的頁碼
		//建立頁碼function
		function buildPage(){
			totalPage = Math.ceil(proCount/pageSet);
			var pageList='<li class=\"listPaper\" id=\"listPaper\"><button class=\"btLi ui-button ui-widget ui-corner-all\" id=\"pageFirst\">頁首</button></li><li class=\"listPaper\" id=\"listPaper\"><button class=\"pagePre ui-button ui-widget ui-corner-all\" id=\"pagePre\">上一頁</button></li>';
			for(var thePage=1;thePage<=totalPage;thePage++){
				pageList+='<li class=\"listPaper\" id=\"listPaper\"><button class=\"btLi\" id=\"btLi'+thePage+'\">'+thePage+'</button></li>';
				finalPage=Number(thePage); //tip:儲存末頁的頁碼
			}
			pageList+='<li class=\"listPaper\" id=\"listPaper\"><button class=\"pageNext ui-button ui-widget ui-corner-all\" id=\"pageNext\">下一頁</button></li><li class=\"listPaper\" id=\"listPaper\"><button class=\"btLi ui-button ui-widget ui-corner-all \" id=\"pageLast\">頁尾</button></li>';
			$(".pager").html(pageList);
		}
		console.log("finalPage:"+finalPage);
		var btLi = $(".btLi"); //tip:沒用到,將同名class以List儲存,故提取時可以用.get(0)、get(1)、get(n)
		console.log(btLi);// tip:此List[btn頁首、btn0、btn1、btn2、btn3、btn頁尾]		
		
		
		//p產生到第X頁輸入頁碼
		function entryPage(){
			var pageNo='';
			for(var pageNoSet=1;pageNoSet<=totalPage;pageNoSet++){
				pageNo+='<option>'+pageNoSet+'</option>';
			}
			$(".selectPage").html(pageNo);		
		}
		entryPage();
		
		$(".selectPage").change(function(){
			page = $("#selectPage").val();
			var pageBtn = $("#btLi"+page);
			showPagePros(page);
			removeLightBtn()
			lightBtn(pageBtn)
		});		

		
// 		高亮顯示第一頁的按鈕	
		if(totalPage>0){
			lightBtn($($(".btLi").get(1)));
	}		
// 		hidePreNext(page);//tip:載入時顯示or隱藏的按鈕
		
		function selectedSet(){
		//  先取得要移除項目的 index
			var selectIndex = $("#selectPage").find(":selected").index();

			//  移除選擇的項目
			$("#selectPage").find(":selected").remove();

			//  判斷移除項目後，原先的index是否還有option，有的話就直接將此option設定為選取狀態
			//  捲軸就不會往上跑了
			if ($('#selectPage option').get(selectIndex) != null) {
			    $('#selectPage option').get(selectIndex).selected = true;
			}
			else {
			    //  沒有項目的話，判斷select理是否還有option
			    //  有的話，表示移除的項目為最後一個，就設定上一個option為選取狀態
			    if ($('#selectPage option').length > 0) {
			        $('#selectPage option').get(selectIndex - 1).selected = true;
			    }
			}
		}
		
		
// 		頁碼按鈕
// 		testBtnEach();
		$(".btLi").click(function(){
			
			
			var id = $(this).attr("id");
			var Index = Number(id.replace("btLi",""))
			
			var selectIndex=Index;
			$('#selectPage option').get(selectIndex-1).selected = true;
			
			var thisBtn = $(this);
			console.log("id:"+id);
			console.log("page:"+page);
			console.log("finalPage:"+finalPage);
			if(id=="pageFirst"){
				page = 1;
				thisBtn = $($(".btLi").get(1));
			}
			else if (id=="pageLast"){
				page = finalPage;
				thisBtn = $($(".btLi").get(finalPage));
			}
			else {page = Index;}
			console.log("pageBtn:"+page);
			showPagePros();
			removeLightBtn()
			lightBtn(thisBtn);
		})
		
// 		上一頁按鈕
		$("#pagePre").click(function(){
			if(page>1){page--;}
			showPagePros();
			removeLightBtn()
			console.log("page:"+page);
			lightBtn($($(".btLi").get(page)));
// 			hidePreNext();
		})	
		
// 		下一頁按鈕
		$("#pageNext").click(function(){
			if(page<totalPage){page++;}
			showPagePros();
			removeLightBtn()
			console.log("page:"+page);
			lightBtn($($(".btLi").get(page)));
// 			hidePreNext();
		})		
		
// 		指定按鈕加css
		function lightBtn(targetBtn){
			targetBtn.addClass("pointBtnPage");
		}
		
// 		移除所有標記按鈕的css
		function removeLightBtn(){
			$(".pointBtnPage").each(
				function(){
					$(this).removeClass("pointBtnPage");	
				})
		}		

// 		隱藏前進後退按鈕,設定2秒(2000毫秒)
		function hidePreNext(){
			if(page==totalPage){
				$("#pageNext").hide(2000);	
				$("#pageLast").hide(2000);
				$("#pagePre").show(2000);
				$("#pageFirst").show(2000);			
			}else if(page==1){
				$("#pagePre").hide(2000);
				$("#pageFirst").hide(2000);	
				$("#pageNext").show(2000);	
				$("#pageLast").show(2000);	
			}else{
				$("#pageNext").show(2000);
				$("#pagePre").show(2000);	
				$("#pageFirst").show(2000);	
				$("#pageLast").show(2000);	
			}
	}	
		
// 		顯示某分頁商品
		function showPagePros(currentPage){
			$.each($(".products"),function(contentindex){
				if(contentindex>=(page-1)*pageSet && contentindex < page*pageSet){
					$(this).show();	
				}else{$(this).hide();}
			});	
// 			hidePreNext(page);
		}
// ========================a加入購物車a=========================		
	//m判斷是否使用modal
		var useModal = false;
		
    //m判斷是否開啟modal視窗,有開啟就將useModal設為true
   $('.myModal').on('shown.bs.modal', function (e) {
      	console.log("openModal1");
      	useModal = true;
   })
	
 //m判斷是否關閉 modal視窗,關閉就將useModal設為false
	$('.myModal').on('hidden.bs.modal', function () {
		console.log("hiddenModal1");
		useModal = false;
	})  
	var theCount = 0;
	$(".addToCar").click(function(){
		var id = $(this).attr("id");
		console.log("theCount:"+(theCount+1));
		
// 		若id =press10,取數字部分10當index
		var	index = id.replace("press","");
			quantity = $(".quantity"+index);
			qty = 0;
		if(useModal){
			qty = $(quantity.get(1)).val()
		}else{
			qty = $("#qty"+index).val();
		}
			var product = 
			{ 
				productId   : $("#productId"+index).val(),
				productName : $("#productName"+index).val(),
			 	qty 		: qty,
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
// 			alert("加入購物車成功");
			console.log("加入購物車成功");
			console.log("${ShoppingCart.itemNumber}");
			$("#cartNo").load("");
		})
// 		=======================s每x毫秒刷新頁面s==========================			
		
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
// 				data: { key: value }, 傳送給後端的資料,格式為Key/Value  
				success:function(data){   //成功後回傳的資料data,目前沒用到不理他
// 					showNames(data);
					outputData;
				},
				error:function(err){ //發生伺服器404、500、304等錯誤時會用此function處理,err封裝錯誤訊息
					console.log(err);
				}
			});
		}

	
		function refresh(){ 
	    //update src attribute with a cache buster query 
	    setTimeout("refresh();",10) 
		} 	
		function updata(upData){ 
		   	//Get new content through Ajax 
			   $("#cartNo").text(upData);
		   		console.log($("#cartNo"));
			} 
//		 	setInterval(updateDiv, 3000);//設定每3000毫秒更新updata()

// 		=======================s測試區s==========================
// 		01測試$.each,目前沒用到
		function testEach(){
			$.each($(".products"), function( index, value ) {
  				console.log( index + ": " + value );
			});
		}
		function testBtnEach(){
			$.each($(".btLi"), function( index, value ) {
  				console.log( index + ": " + value );
			});
		}

// 		02測試class的List,目前沒用到	
		function test1(){
				var	quantity = $(".quantity2");
				console.log("quantity2:"+quantity);
				console.log("quantity2(0):"+ typeof(quantity.get(0)));
				console.log("quantity2(0).get(0).value:"+ quantity.get(0).value);
				console.log("quantity2(0):"+ $(quantity.get(0)).val());
				console.log("quantity2(0).html():"+ $(quantity.get(0)).html());
				console.log("quantity2(0).text():"+ $(quantity.get(0)).text());
				console.log("$(quantity.get(0)).attr(\"id\")):"+ $(quantity.get(0)).attr("id"));
				console.log("quantity2(1):"+ quantity.get(1));
				console.log("quantity2(1):"+ quantity.get(1).value);
				console.log("quantity2(1):"+ $(quantity.get(1)).html());
				console.log("quantity2(1):"+ $(quantity.get(1)).text());
				console.log("quantity2(1):"+ $(quantity.get(1)).attr("id"));
				console.log("quantity2(1):"+ $(quantity.get(1)).val());
				$.each(quantity,function(index,value){
					console.log(index,":value:"+value);
					console.log($(value).attr("id"));
				})
			}
			
//			03呼叫測試用method(class的List)			
// 			test1();
})
</script>
</body>
</html>
