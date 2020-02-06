$(document).ready(function() {
	
//		======================輸入商品數量select==========================		
	//輸入商品數量
		var optionList='';
		for(var optionSet=1;optionSet<=10;optionSet++){
			optionList+='<option>'+optionSet+'</option>';
		}
		$(".selectQty").html(optionList);
		
// 		======================p分頁p==========================
		
		var pageSet = 8;//tip:每個分頁顯示的商品數量
		console.log( typeof(pageSet));//tip:typeof(pageSet)查看型態
		var proCount = $("#proCount").val();//tip:商品數量
		
		//總頁數 , Math.ceil()=無條件進位
		var totalPage = Math.ceil(proCount/pageSet);
		
		var page = 1;//tip:設定第一頁頁碼
		
//		//調整顯示商品筆數(未完)
//		$(".selectCountPage").change(function(){
//			pageSet = $("#selectCountPage").val();
//			console.log("pageSet:"+pageSet);
//			totalPage = Math.ceil(proCount/pageSet);
//			entryPage();
//			buildPage();
//			//因為按鈕在調整筆數後重寫,所以要再讀一次
//// 			$("input[class*='products']").load("productList");
//			$(".btLi").load("");
//			showPagePros();
//		})
		
		
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
		
		//產生到第X頁輸入頁碼
//		function entryPage(){
//			var pageNo='';
//			for(var pageNoSet=1;pageNoSet<=totalPage;pageNoSet++){
//				pageNo+='<option>'+pageNoSet+'</option>';
//			}
//			$(".selectPage").html(pageNo);		
//		}
//		entryPage();
		
		
		
		//select變更頁碼時
//		$(".selectPage").change(function(){
//			page = $("#selectPage").val();
//			var pageBtn = $("#btLi"+page);
//			showPagePros(page);
//			removeLightBtn()
//			lightBtn(pageBtn)
//		});		

		
// 		高亮顯示第一頁的按鈕	
		if(totalPage>0){
			lightBtn($($(".btLi").get(1)));
	}		
// 		hidePreNext(page);//載入時顯示or隱藏的按鈕
		
//		function selectedSet(){
//		//  先取得要移除項目的 index
//			var selectIndex = $("#selectPage").find(":selected").index();
//
//			//  移除選擇的項目
//			$("#selectPage").find(":selected").remove();
//
//			//  判斷移除項目後，原先的index是否還有option，有的話就直接將此option設定為選取狀態
//			//  捲軸就不會往上跑了
//			if ($('#selectPage option').get(selectIndex) != null) {
//			    $('#selectPage option').get(selectIndex).selected = true;
//			}
//			else {
//			    //  沒有項目的話，判斷select理是否還有option
//			    //  有的話，表示移除的項目為最後一個，就設定上一個option為選取狀態
//			    if ($('#selectPage option').length > 0) {
//			        $('#selectPage option').get(selectIndex - 1).selected = true;
//			    }
//			}
//		}
		
		
// 		頁碼按鈕
// 		testBtnEach();
		$(".btLi").click(function(){
			var id = $(this).attr("id");
			var Index = Number(id.replace("btLi",""))
			var thisBtn = $(this);
			if(id=="pageFirst"){
				page = 1;
				thisBtn = $($(".btLi").get(1));
			}
			else if (id=="pageLast"){
				page = finalPage;
				thisBtn = $($(".btLi").get(finalPage));
			}
			else {page = Index;}
//			$('#selectPage option').get(page-1).selected = true;
			showPagePros();
			removeLightBtn()
			lightBtn(thisBtn);
		})
		
// 		上一頁按鈕
		$("#pagePre").click(function(){
			if(page>1){page--;}
//			$('#selectPage option').get(page-1).selected = true;
			showPagePros();
			removeLightBtn()
			lightBtn($($(".btLi").get(page)));
// 			hidePreNext();
		})	
		
// 		下一頁按鈕
		$("#pageNext").click(function(){
			if(page<totalPage){page++;}
//			$('#selectPage option').get(page-1).selected = true;
			showPagePros();
			removeLightBtn()
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
			var pageContext = $("#pageContext").val();
			var url = pageContext+"/shoppingCart/addToCar";
			console.log(dataJSONObject);
			doAjax(url,dataJSONObject);
// 			特別注意!!在控制器@GetMapping的productList_get一定要建立ShoppingCart的session(第46行)
// 			否則就算有註解,${ShoppingCart}雖然不會有事,但${ShoppingCart.itemNumber}一定會死給你看,千萬要小心
// 			alert("加入購物車成功");
			console.log("加入購物車成功");
//			$("#cartNo").load("");
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
					$("#cartNo").text(data);
				},
				error:function(err){ //發生伺服器404、500、304等錯誤時會用此function處理,err封裝錯誤訊息
					console.log(err);
				}
			});
		}
})