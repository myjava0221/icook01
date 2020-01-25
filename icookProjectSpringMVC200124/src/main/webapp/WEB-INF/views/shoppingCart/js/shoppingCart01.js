$(document).ready(
				function() {
					// $(window).load(function() {

					$(".item-qty-button-plus").click(function() {
						var id = $(this).attr("id");
						var index = id.substring(4);
						var unitPriceId = "#unitPrice" + index;
						var unitPrice = $(unitPriceId).text();
						unitPrice = unitPrice.substring(2);
						var qtyId = "#qty" + index;
						var qty = $(qtyId).val();
						var subTotalId = "#subTotal" + index;
						if (qty < 99) {
							qty = Number(qty) + 1;
						}
						$(qtyId).val(qty);
						$(subTotalId).text(qty * unitPrice + "元");
					})

					$(".item-qty-button-minus").click(function() {
						var id = $(this).attr("id");
						var index = id.substring(5);
						var unitPriceId = "#unitPrice" + index;
						var unitPrice = $(unitPriceId).text();
						unitPrice = unitPrice.substring(2);
						var qtyId = "#qty" + index;
						var qty = $(qtyId).val();
						var subTotalId = "#subTotal" + index;

						if (qty > 1) {
							qty = Number(qty) - 1;
						}
						$(qtyId).val(qty);
						$(subTotalId).text(qty * unitPrice + "元");
					})

					$("#submit").click(function() {
						if (confirm("確定購買 ?")) {
							return true;
						} else {
							return false;
						}
					})

					$(".delete")
							.click(
									function() {
										if (confirm("確定刪除此商品?") == true) {
											var id = $(this).attr("id");
											var index = Number(id.substring(3));
											alert(index);
											if (index == 1) {
												$("tr").eq(index).remove();
											} else {
												$("tr").eq(index + 1).remove();
											}
											$("#remove")
													.html(
															"<td>${cart.value.productId}</td>");
										}
									})

					function confirmDelete(n) {
						if (confirm("確定刪除此項商品 ? ")) {
							document.forms[0].action = "<c:url value='UpdateICookItem?cmd=DEL&pid_pty="
									+ n + "' />";
							document.forms[0].method = "POST";
							document.forms[0].submit();
						} else {

						}
					}
					function modify(key, qty, index) {
						var x = "newQty" + index;
						var newQty = document.getElementById(x).value;
						if (newQty < 0) {
							window.alert('數量不能小於 0');
							return;
						}
						if (newQty == 0) {
							window.alert("請執行刪除功能來刪除此項商品");
							document.getElementById(x).value = qty;
							return;
						}
						if (newQty == qty) {
							window.alert("新、舊數量相同，不必修改");
							return;
						}
						if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty
								+ " ? ")) {
							document.forms[0].action = "<c:url value='UpdateItem.do?cmd=MOD&bookId="
									+ key + "&newQty=" + newQty + "' />";
							document.forms[0].method = "POST";
							document.forms[0].submit();
						} else {
							document.getElementById(x).value = qty;
						}
					}
})
