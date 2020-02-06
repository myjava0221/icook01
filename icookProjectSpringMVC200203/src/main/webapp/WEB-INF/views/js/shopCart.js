$(document).ready(function() {
	
	var realPath = $("#pageContext").val();
	
	$(".item-qty-button-plus").click(function() {
		var index = ($(this).parents("tr").index())-1;
		
		var onSale = $("#onSale"+index).text();
		onSale = onSale.replace("元","");
		var qty = $("#qty" + index).val();
		if (qty < 99) {
			qty = Number(qty) + 1;
		}
		
		$("#qty" + index).val(qty);
		$("#subTotal" + index).text(qty * onSale+"元");
	})

	$(".item-qty-button-minus").click(function() {
		var index = ($(this).parents("tr").index())-1;
		var onSale = $("#onSale" + index).text();
		onSale = onSale.replace("元","");
		var qty = $("#qty" + index).val();
		if (qty > 1) {
			qty = Number(qty) - 1;
		}
		$("#qty" + index).val(qty);
		$("#subTotal" + index).text(qty * onSale+"元");
	})
	

	//	處理10.0折,一定要用$.trim()刪除空白,否則會有不可視的妨礙判斷
	$(".discount").each(function(index,d){
		var theDiscount = $.trim($(this).text());
		if(theDiscount=="10.0折"){
			$(this).text("");
		}
	})
	

//	修改商品
	$(".MOD").click(function() {
		var id = $(this).attr("id");
		var index = index = id.replace("MOD","");
		var updateProducts = 
		{
			mapKey:$("#mapKey"+index).val(),
			cmd   :"MOD",
			qty	  :$("#qty"+index).val(),
		}
		if(confirm("確定修改嗎 ?") ) {
			$.ajax({
				url:realPath+"/shoppingCart/shopCart",//後端controller的URL
				type:"POST",//用POST的方式
				dataType: "text",
				data: updateProducts,
				success:function(data){   //成功後回傳的資料data,目前沒用到不理他
					console.log(data);
					$("#cartNo").text(data);
				},
				error:function(err){ //發生伺服器404、500、304等錯誤時會用此function處理,err封裝錯誤訊息
					console.log(err);
				}
			});
			
		//按下修改or刪除時，重新載入此頁，更新購物車數量
			$("#cartNo").load("");
			return true;
		}else{
			return false;
		}
	})
	
	
//刪除商品
	$(".DEL").click(function() {
		var id = $(this).attr("id");
		var index = index = id.replace("DEL","");
		var mapKey = [$("#mapKey"+index).val()];
		var mapKeyJSON = JSON.stringify(mapKey);
		var deleteProducts = 
		{
			mapKey:mapKeyJSON,
			cmd   :"DEL",
		}
		
		if(confirm("確定刪除此商品 ?") ) {
			$.ajax({
				url:realPath+"/shoppingCart/shopCart",//後端controller的URL
				type:"POST",//用POST的方式
				dataType: "text",
				data: deleteProducts,
				success:function(data){   //成功後回傳的資料data,目前沒用到不理他
					console.log(data);
					$("#cartNo").text(data);
				},
				error:function(err){ //發生伺服器404、500、304等錯誤時會用此function處理,err封裝錯誤訊息
					console.log(err);
				}
			});
			
			$("#trIndex"+index).remove();
		//按下修改or刪除時，重新載入此頁，更新購物車數量
			$("#cartNo").load("");
			return true;
		}else{
			return false;
		}
	})
	
//==========================checkbox=================================		
	$(".leaderCheckBox").change(function() {
		 console.log(this.checked);
		 if(this.checked) {
	    	console.log("打勾囉!");
	    	console.log(this);
//	    	$('.fromCheck').prop("checked",true);
//				效果同上
	    	$('tr[id*=trIndex]').find(".fromCheck").prop("checked",true);

	    	$('.fromCheck').each(function(){
	    		console.log($(this).val());
	    	})
	     }else{
	    	  $('.fromCheck').prop("checked",false);
	     }
	});
	
	$(".fromCheck").change(function(){
		if(this.checked){
			console.log($(this).val());
			console.log("tr[class*=trIndex]:"+$(this).parents("tr[class*=trIndex]").index());
			console.log("tr[id*=trIndex]:"+$(this).parents("tr[id*=trIndex]").index());
		}
	 })
	 
//		刪除checkbox版 
	$("#dd").click(function(){
		var marKey = [] ;
		var arrIndex = 0 ;
		$('.fromCheck').each(function(index){
			if(this.checked){
				marKey[arrIndex]=$(this).val();
				arrIndex++;
			}
    	})
		var deleteProducts = 
		{
			mapKey:JSON.stringify(marKey),
			cmd   :"DEL",
		}
		
		if(confirm("確定刪除此商品 ?") ) {
			$.ajax({
				url:realPath+"/shoppingCart/shopCart",//後端controller的URL
				type:"POST",//用POST的方式
				dataType: "text",
				data: deleteProducts,
				success:function(data){   //成功後回傳的資料data,目前沒用到不理他
//						console.log(data);
				},
				error:function(err){ //發生伺服器404、500、304等錯誤時會用此function處理,err封裝錯誤訊息
					console.log(err);
				}
			});
			
			$(function(){
				$("input[name*=doCheckbox]:checked").each(function(){
					n = $(this).parents("tr").index(); //s獲得checkbox所在行順序
					$("table#sc_table").find("tr:eq("+n+")").remove();
				})
			})
			$("#cartNo").load("");
		}else{
			return false;
		}			
		
	})
//==========================submit=================================	
//	確認表單提交
	$("form").submit(function(eventData){
		var count=0;
		$(".fromCheck").each(function(){
			if($(this).prop("checked")){
				count++;
			}
		})
		console.log("count:"+count);
		if(count>0){
			if(confirm("確定要購買這些商品 ?")){
				checkOrder();
				$("form[id=formSubmit]").attr("action",realPath+"/ShoppingCar/OrderCheck");	
			}else{eventData.preventDefault();}
		}else{
			eventData.preventDefault();//preventDefault():可阻止form提交表單
			alert("請選擇要結帳的商品");
		}
	});
	
//	提交表單
	function checkOrder(){
		var index=0;
		var mapKey =[];
		var quantity =[];
		var uncheckQuantity =[];
		var uncheckMapKey=[];
		$(".fromCheck").each(function(){
			index=$(this).parents("tr").index();
			if($(this).prop("checked")){
				mapKey.push($(this).val());
				quantity.push($("#qty"+(index-1)).val());
				console.log(index);
			}else{
				uncheckMapKey.push($(this).val());//沒有checked的
				uncheckQuantity.push($("#qty"+(index-1)).val());
			}
		})
		console.log("mapKey:"+mapKey);
		console.log("mapKeyJson:"+JSON.stringify(mapKey));
		console.log("uncheckMapKeyJson:"+JSON.stringify(uncheckMapKey));
		console.log("quantityJson:"+JSON.stringify(quantity));
		console.log("uncheckQuantity:"+JSON.stringify(uncheckQuantity));
		var updateProducts = 
		{
				mapKey:JSON.stringify(mapKey),
				qty	  :JSON.stringify(quantity),
	     uncheckMapKey:JSON.stringify(uncheckMapKey),
	   uncheckQuantity:JSON.stringify(uncheckQuantity),
				cmd   :"MOD2",
		}			
		$.ajax({
			url:realPath+"/shoppingCart/shopCart",//後端controller的URL
			type:"POST",//用POST的方式
			dataType: "text",
			data: updateProducts,
			success:function(data){   //成功後回傳的資料data,目前沒用到不理他
//				$("#cartNo").text(data);
			},
			error:function(err){ //發生伺服器404、500、304等錯誤時會用此function處理,err封裝錯誤訊息
				console.log(err);
			}
		});			
	}	
	
//	實驗map	
//    $("div[id=demo]").append( $("input[id*=qty]").map(function(){
//        return $(this).val();
//      }).get().join(",") );



//==========================table設定=================================	
//$("table[class*=sc_table]").css("width", "992px");

//	讓table的td不會被拉寬
	$("table[class*=sc_table]").css("table-layout", "fixed");

//  所有td垂直置中
	$("table[class*=sc_table]").find("td").css("vertical-align", "middle");



})