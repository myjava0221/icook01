$(document).ready(function() {
		var optionList='';
			for(var optionSet=1;optionSet<=10;optionSet++){
				optionList+='<option>'+optionSet+'</option>';
			}
		$(".selectQty").html(optionList);	
	
		var pageSet = 8;//tip:每個分頁顯示的商品數量
		var proCount = 100;//tip:商品數量
		var totalPage = Math.ceil(proCount/pageSet);
		var page = 1;
		var reloadCount = false;
		buildPage();//建立頁碼
		showPagePros();//tip:剛載入就顯示此頁商品數量
		var finalPage; //tip:儲存末頁的頁碼
		
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
		
		if(totalPage>0){
			lightBtn($($(".btLi").get(1)));
	}		
		
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
			showPagePros();
			removeLightBtn()
			lightBtn(thisBtn);
		})
		
		$("#pagePre").click(function(){
			if(page>1){page--;}
			showPagePros();
			removeLightBtn()
			lightBtn($($(".btLi").get(page)));
		})	
		
		$("#pageNext").click(function(){
			if(page<totalPage){page++;}
			showPagePros();
			removeLightBtn()
			lightBtn($($(".btLi").get(page)));
		})		
		
		function lightBtn(targetBtn){
			targetBtn.addClass("pointBtnPage");
		}
		
		function removeLightBtn(){
			$(".pointBtnPage").each(
				function(){
					$(this).removeClass("pointBtnPage");	
				})
		}		
		
// 		顯示某分頁商品
		function showPagePros(currentPage){
			$.each($(".products"),function(contentindex){
				if(contentindex>=(page-1)*pageSet && contentindex < page*pageSet){
					$(this).show();	
				}else{$(this).hide();}
			});	
		}
// ========================addToCart=========================		
		var useModal = false;
		
   $('.myModal').on('shown.bs.modal', function (e) {
      	useModal = true;
   })
	$('.myModal').on('hidden.bs.modal', function () {
		useModal = false;
	})  
	var theCount = 0;
	$(".addToCar").click(function(){
		var id = $(this).attr("id");
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
			var pageContext = $("#pageContext").val();
			var url = pageContext+"/shoppingCart/addToCar";
			doAjax(url,product);
			console.log("加入購物車成功");
			$("#cartNo").load("");
		})
		
		function doAjax(targetUrl,inputData,outputData){
			$.ajax({
				url:targetUrl,
				type:"POST",
				cache: false,
				dataType: "text",
				data: inputData,
				success:function(data){
					outputData;
					$("#cartNo").text(data);
				},
				error:function(err){
					console.log(err);
				}
			});
		}
	
})