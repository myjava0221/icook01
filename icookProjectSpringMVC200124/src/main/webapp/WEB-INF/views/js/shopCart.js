	$(document).ready(function() {
		// $(window).load(function() {
		var realUrl = $("#pageContext").val();
			
			
		$(".item-qty-button-plus").click(function() {
			var id = $(this).attr("id");
			var index = id.substring(4);
			var onSale = $("#onSale"+index).text();
			onSale = onSale.substring(2);
			var qty = $("#qty" + index).val();
			if (qty < 99) {
				qty = Number(qty) + 1;
			}
			
			$("#qty" + index).val(qty);
			$("#subTotal" + index).text(qty * onSale);
		})

		$(".item-qty-button-minus").click(function() {
			var id = $(this).attr("id");
			var index = id.substring(5);
			var onSale = $("#onSale" + index).text();
			onSale = onSale.substring(2);
			var qty = $("#qty" + index).val();
			if (qty > 1) {
				qty = Number(qty) - 1;
			}
			$("#qty" + index).val(qty);
			$("#subTotal" + index).text(qty * onSale);
		})
		

		$("#submit").click(function() {
			if(confirm("確定購買 ?") ) {
				return true;
			}else{
				return false;
			}
		})

// 修改商品
		$(".MOD").click(function() {
			var id = $(this).attr("id");
			var index = index = id.replace("MOD","");
			var updateProducts = 
			{
				mapKey:$("#mapKey"+index).val(),
				cmd   :$("#MOD"+index).val(),
				qty	  :$("#qty"+index).val(),
			}
			if(confirm("確定修改嗎 ?") ) {
				$.ajax({
					url:realUrl+"/shoppingCart/shopCart",// 後端controller的URL
					type:"POST",// 用POST的方式
					dataType: "text",
					data: updateProducts,
					success:function(data){   // 成功後回傳的資料data,目前沒用到不理他
						console.log(data);
						$("#cartNo").text(data);
					},
					error:function(err){ // 發生伺服器404、500、304等錯誤時會用此function處理,err封裝錯誤訊息
						console.log(err);
					}
				});
				
			// 按下修改or刪除時，重新載入此頁，更新購物車數量
				$("#cartNo").load("");
				return true;
			}else{
				return false;
			}
		})
		
	// 刪除商品
		$(".DEL").click(function() {
			var id = $(this).attr("id");
			var index = index = id.replace("DEL","");
			console.log(index);
			
			var deleteProducts = 
			{
				mapKey:$("#mapKey"+index).val(),
				cmd   :$("#DEL"+index).val(),
			}
			
			if(confirm("確定刪除此商品 ?") ) {
				$.ajax({
					url:realUrl+"/shoppingCart/shopCart",// 後端controller的URL
					type:"POST",// 用POST的方式
					dataType: "text",
					data: deleteProducts,
					success:function(data){   // 成功後回傳的資料data,目前沒用到不理他
						console.log(data);
						$("#cartNo").text(data);
					},
					error:function(err){ // 發生伺服器404、500、304等錯誤時會用此function處理,err封裝錯誤訊息
						console.log(err);
					}
				});
				
				$("#trIndex"+index).remove();
			// 按下修改or刪除時，重新載入此頁，更新購物車數量
				$("#cartNo").load("");
				return true;
			}else{
				return false;
			}
		})
		
// ==========================checkbox=================================
		$(".leaderCheckBox").change(function() {
			 console.log(this.checked);
			 if(this.checked) {
		    	console.log("打勾囉!");
		    	console.log(this);
		    	$('.form-check-input').prop("checked",true);
		    	$('.form-check-input').each(function(){
		    		console.log($(this).val());
		    	})
		     }else{
		    	  $('.form-check-input').prop("checked",false);
		     }
		});
		
		$(".form-check-input").change(function(){
			if(this.checked){
				console.log($(this).val());
				console.log($(this).parents("tr[id*=trIndex]").index());
			}
		 })
		 
// 刪除checkbox版
		$("#dd").click(function(){
			var marKey = [] ;
			var arrIndex = 0 ;
			$('.form-check-input').each(function(index){
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
					url:realUrl+"/shoppingCart/shopCart",// 後端controller的URL
					type:"POST",// 用POST的方式
					dataType: "text",
					data: deleteProducts,
					success:function(data){   // 成功後回傳的資料data,目前沒用到不理他
					},
					error:function(err){ // 發生伺服器404、500、304等錯誤時會用此function處理,err封裝錯誤訊息
						console.log(err);
					}
				});
				
				$(function(){
					$("input[name*=doCheckbox]:checked").each(function(){
						n = $(this).parents("tr").index(); // 獲得checkbox所在行順序
						$("table#sc_table").find("tr:eq("+n+")").remove();
					})
				})
				
				$("#cartNo").load("");
			}else{
				return false;
			}			
		})
	
})