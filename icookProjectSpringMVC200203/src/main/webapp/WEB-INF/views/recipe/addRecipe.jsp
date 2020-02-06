<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增食譜</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- //for-mobile-apps ${pageContext.request.contextPath}-->
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- load-more -->

<!-- //load-more -->
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'
	rel='stylesheet'>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />
	<!-- banner1 -->
	<div class="banner1">
		<div class="container"></div>
	</div>

	<div class="container">
		<div class="col-md-10 agile_single_right">
			<h3 class="bars">新增食譜</h3>
			<form:form method='POST' modelAttribute="recipeBean"
				action="${pageContext.request.contextPath}/recipes/add"
				enctype="multipart/form-data">
				<div class="w3_comments_bottom">
					<div class="form-group row">
						<label for="RecipeName" class="col-sm-2 col-form-label">食譜名稱</label>
						<div class="col-sm-10">
							<form:input type="text" class="form-control" id="RecipeName"
								path="RecipeName" placeholder="請輸入食譜名稱" />
						</div>
					</div>
					<div class="form-group row">
						<label for="RecipeDescription" class="col-sm-2 col-form-label">食譜描述</label>
						<div class="col-sm-10">
							<form:input type="text" class="form-control"
								id="RecipeDescription" path="description" placeholder="請輸入食譜描述" />
						</div>
					</div>
				</div>
				<div class="w3_comments_bottom">
					<div class="form-row form-inline">
						<div class="form-group col-md-4">
							<label class="mr-sm-2" for="CookTime">烹調時間(分鐘)</label>
							<form:select path="cookingTime" class="form-control"
								id="CookTime">
								<form:option value="null">預計烹調時間</form:option>
								<form:option value="5">5</form:option>
								<form:option value="10">10</form:option>
								<form:option value="15">15</form:option>
								<form:option value="30">30</form:option>
								<form:option value="45">45</form:option>
								<form:option value="60">60</form:option>
								<form:option value="90">90</form:option>
								<form:option value="120">120</form:option>
								<form:option value="180">180</form:option>
							</form:select>
						</div>
						<div class="form-group col-md-4">
							<label class="mr-sm-2" for="serving">份量(人份)</label>
							<form:select path="serving" class="form-control" id="serving">
								<form:option value="null">人份</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
								<form:option value="4">4</form:option>
								<form:option value="5">5</form:option>
								<form:option value="6">6</form:option>
								<form:option value="7">7</form:option>
								<form:option value="8">8</form:option>
								<form:option value="9">9</form:option>
								<form:option value="10">10</form:option>
							</form:select>
						</div>
						<div class="form-group col-md-4">
							<label class="btn btn-info"><form:input
									path="RecipeImage" onchange="readURL(this)"
									style="display: none;" type="file" accept="image/jpg" /> <i
								class="fa fa-photo"></i> 上傳封面圖片 </label>
							<div id="upload_img"></div>
						</div>
					</div>
					<table class="table" style="width: 90%" id='table0'>
						<thead>
							<tr>
								<th>食材</th>
							</tr>
						</thead>
						<tbody id='foodtbody0'>
							<c:forEach begin="0" end="4">
								<tr>
									<td style="width: 50%"><input name="ingredName"
											type="text" class="form-control" placeholder="食材" /></td>
									<td style="width: 25%"><input name="ingredQty"
											type="text" class="form-control" placeholder="份量" /></td>
									<td><button type="button" class="btn btn-danger"
											onclick="delRow(this,'foodtbody',0,0)">
											<i class="fa fa-trash"></i>
										</button></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<button type="button" class="btn btn-default"
										style="width: 100%" onclick="addFood(0)">新增食材</button>
								</td>
							</tr>
						</tfoot>
					</table>
					
					<div id='group'>
						<table class="table" style="width: 90%" id='table1'>
							<thead>
								<tr>
									<th><input name="group1" type="text" class="form-control"
												placeholder="分組名稱" /></th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody id='foodtbody1'>
								<c:forEach begin="0" end="4">
									<tr>
										<td style="width: 50%"><input name="group1IngredName"
											type="text" class="form-control" placeholder="食材" /></td>
										<td style="width: 25%"><input name="group1IngredQty" 
											type="text" class="form-control" placeholder="份量" /></td>
										<td ><button type="button" class="btn btn-danger"
												onclick="delRow(this,'foodtbody',1,0)">
												<i class="fa fa-trash"></i>
											</button></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2">
										<button type="button" class="btn btn-default"
											style="width: 100%" onclick="addFood(1)">新增食材</button>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>

					<table class="table" style="width: 90%">
						<tr>
							<td><button type="button" class="btn btn-default"
									style="width: 74.4%" onclick="addGroup('group')">新增分組</button>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-default"
									style="width: 74.4%" onclick="delGroup('group')">刪除分組</button>
						</tr>
					</table>

					<table class="table" style="width: 90%" id='picture'>
						<thead>
							<tr>
								<th>步驟</th>
							</tr>
						</thead>
						<tbody id='picture0'>
							<c:forEach varStatus="i" begin="1" end="5">
								<tr id='tr${i.index}'>
									<td style="width: 50%">
										<h2 id='h2Number${i.index}'>${i.index}</h2> <textarea
											name="step" class="form-control" rows="5"></textarea>
									</td>
									<td style="width: 25%; text-align: center"><label class="btn btn-info" id="uploadImg${i.index}">
									<input name="StepImage"
											class="stepUpl" id="upload_img"
											onchange="ShowStepImg(this,${i.index})"
											style="display: none;" type="file" accept="image/jpg" /> <i
											class="fa fa-photo"></i> 上傳步驟照片 </label>
										<div id="stepImg${i.index}"></div></td>
									<td style="vertical-align: middle" id='deltd${i.index}'><button
											type="button" class="btn btn-danger"
											onclick="delRow(this,'picture',0, ${i.index})">
											<i class="fa fa-trash"></i>
										</button></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<button type="button" class="btn btn-default"
										style="width: 100%" onclick="addStep('picture',0)">新增步驟</button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<h2>Remark</h2> <form:textarea path="remark"
										class="form-control" rows="5" placeholder="其他想說的請在這邊說" />
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div style="text-align: center">
					<form:hidden path="userId" value="${LoginOK.userId}" />
					<button type="submit" class="btn btn-default">送出</button>

					<span>&emsp;</span>
					<button type="reset" class="btn btn-default">清除</button>
				</div>
			</form:form>
			<br>
		</div>
	</div>
	<!-- for bootstrap working -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<script>
//----前端顯示圖片------
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var html = "";
					html += "<img width='320px' height='200px' src='"+e.target.result+"'>";
					$("#upload_img").html(html);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		function ShowStepImg(input,num) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var html = "";
					html += "<img width='100px' src='"+e.target.result+"'>";
					$("#stepImg"+num).html(html);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		
//-----------------------------------新增		
		
		function addGroup(divName){
			//取的div名稱下table的數量
			var num = parseInt($("#"+divName+">table").length) + 1;
			if(num<4) {
				var temp = "";
				temp += "<table class='table' style='width: 90%' id='table"+num+"'>";
				temp += "<thead><tr><th><input name='group"+num+"' type='text' class='form-control' placeholder='分組名稱' /></th> <th></th><th id='thead"+num+"'><button type='button' class='btn btn-danger' onclick=\"delGroup('group','table',"+num+")\"><i class='fa fa-trash'></i></button></th></tr></thead>";
				temp += "<tbody id='foodtbody"+num+"'><c:forEach begin='0' end='4'><tr><td style='width: 50%'><input name='group"+num+"IngredName' type='text' class='form-control' placeholder='食材' /></td><td style='width: 25%'><input name='group"+num+"IngredQty' type='text' class='form-control' placeholder='份量' /></td><td  id='tbody"+num+"'><button type='button' class='btn btn-danger' onclick=\"delRow(this,'foodtbody',"+num+",0)\"><i class='fa fa-trash'></i></button></td></tr></c:forEach></tbody>";
				temp += "<tfoot><tr><td colspan='2' id='tfoot"+num+"'><button type='button' class='btn btn-default' style='width: 100%' onclick='addFood("+num+")'>新增食材</button></td></tr></tfoot></table>";
				$("#"+divName).append(temp);
			}
			else {
				alert("最多3組");
			}
		}
		
		function delGroup(divName) {
			var num = parseInt($("#"+divName+">table").length);
			if(num > 1) {
				$("#table"+num).remove();
			}
			else {
				alert("不能少於一組");
			}
		}
		
		function addStep(tableName , tableNumber) {
			var num = document.getElementById(tableName + tableNumber).rows.length + 1;
			if(num<11) {
				var temp = "";
				temp += "<tr id='tr"+num+"'><td style='width: 50%'><h2 id='h2Number"+num+"'>"+num+"</h2> <textarea name='step' class='form-control' rows='5'/></td>";
				temp += "<td style='width: 25%; text-align: center'><label class='btn btn-info' id='uploadImg"+num+"'><input name='StepImage' class='stepUpl' id='upload_img' onchange='ShowStepImg(this,"+num+")' style='display: none;' type='file' accept='image/jpg' /><i class='fa fa-photo'></i> 上傳步驟照片 </label> <div id='stepImg"+num+"'></div></td>";
				temp += "<td style='vertical-align: middle' id='deltd"+num+"'><button type='button' class='btn btn-danger' onclick=\"delRow(this,'picture',0, "+num+")\"> <i class='fa fa-trash'> </i> </button> </td> </tr>";
				$("#picture tbody").append(temp);
			}
			else {
				alert("最多10個步驟");
			}
		}
		
		function addFood(num) {
			//知道table tbody裡現在有幾個tr
			var quality = document.getElementById("foodtbody0").rows.length;
			if(quality<10) {
				var temp = "<tr><td style='width: 50%'><input name='ingredName' type='text' class='form-control' placeholder='食材'/>";
				temp += "<td style='width: 25%'><input name='ingredQty' type='text' class='form-control' placeholder='份量' />";
				temp += "<td><button type='button' class='btn btn-danger' onclick=\"delRow(this,'foodtbody',"+ num +",0)\"><i class='fa fa-trash'></i></button>";
				$("#table" + num + " tbody").append(temp);
			}
			else {
				alert("最多10個");
			}
		}

		function delRow(obj, tableName , tableNumber , a) {
			var tr = this.getRowObj(obj);
			var num = document.getElementById(tableName + tableNumber).rows.length;
			if (num > 3) {
				if (tr != null) {
					if(a!=0) {
						var aa = document.getElementById("h2Number"+a).innerText;
					}
					tr.parentNode.removeChild(tr);
					if(tableName == "picture") {
						var str = parseInt(aa);
						for(var i=str+1;i<=num;i++) {
							var temp="";
							var temp2="";
							$("#h2Number"+i).html(str);
							document.getElementById("h2Number"+i).id = "h2Number"+str;
							$("#deltd"+i+" button").remove();
							temp = "<button type='button' class='btn btn-danger' onclick=\"delRow(this,'picture',0,"+ str +")\"><i class='fa fa-trash'></i></button>";
							$("#deltd"+i).append(temp);
							
							$("#uploadImg"+i+" input").remove();
							temp2 = "<input name='StepImage' class='stepUpl' id='upload_img' onchange=\"ShowStepImg(this,"+ str +")\" style='display: none;' type='file' accept='image/jpg' />";
							$("#uploadImg"+i).append(temp2);
							document.getElementById("uploadImg"+i).id = "uploadImg"+str;
							document.getElementById("deltd"+i).id = "deltd"+str;
							document.getElementById("stepImg"+i).id = "stepImg"+str;
							str++;
						}
					}
				} else {
					throw new Error(
							"the given object is not contained by the table");
				}
			} else {
				alert("不能小於3行");
			}
		}
		function getRowObj(obj) {
			var i = 0;
			while (obj.tagName.toLowerCase() != "tr") {
				obj = obj.parentNode;
				if (obj.tagName.toLowerCase() == "table")
					return null;
			}
			return obj;
		}
	</script>

</body>
</html>