<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<!-- update資料尚未全部列出來 -->

<html>
<head>
<meta charset="UTF-8">
<title>修改食譜</title>
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
			<h3 class="bars">修改食譜</h3>
			<form:form method='POST' modelAttribute="recipeBean"
				action="${pageContext.request.contextPath}/recipes/updateRecipe"
				enctype="multipart/form-data">
				<div class="w3_comments_bottom">
					<div class="form-group row">
						<label for="RecipeName" class="col-sm-2 col-form-label">食譜名稱</label>
						<div class="col-sm-10">
							<form:input type="text" class="form-control" id="RecipeName"
								path="RecipeName" value="${recipeBean.recipeName}" />
						</div>
					</div>
					<div class="form-group row">
						<label for="RecipeDescription" class="col-sm-2 col-form-label">食譜描述</label>
						<div class="col-sm-10">
							<form:input type="text" class="form-control"
								id="RecipeDescription" path="description" value="${recipeBean.description}" />
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
									style="display: none;" type="file" accept="image/jpg" />
								<i class="fa fa-photo"></i> 上傳封面圖片
							</label>
							<div id="upload_img"></div>
						</div>
					</div>
					<table class="table" style="width: 90%">
						<thead>
							<tr>
								<th>食材</th>
							</tr>
						</thead>
						<tbody>
							<c:forTokens var="ingredName" delims="," items="${recipeBean.ingredName}">
								<tr>
									<td style="width: 50%">
										<input name="ingredName" type="text" class="form-control" 
											   value="<c:out value='${ingredName}' />" /></td>
									<td style="width: 25%">
										<input name="ingredQty" type="text" class="form-control" 
											   value="<c:out value='${ingredQty}' />" /></td>
									<td><button type="button" class="btn btn-danger"
											onclick="delRow(this,'foodtbody',0,0)">
											<i class="fa fa-trash"></i>
										</button></td>
								</tr>
							</c:forTokens>
							<tr>
								<td style="width: 50%"><form:input path="ingredName"
										type="text" class="form-control" placeholder="食材" /></td>
								<td style="width: 25%"><form:input path="ingredQty"
										type="text" class="form-control" placeholder="份量" /></td>
								<td><button type="button" class="btn btn-danger">
										<i class="fa fa-trash"></i>
									</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="button" class="btn btn-default"
										style="width: 100%">新增食材</button>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table" style="width: 90%">
						<thead>
							<tr>
								<th><input name="group1" type="text"
										class="form-control" placeholder="分組1名稱" /></th>
								<th></th>
								<th><button type="button" class="btn btn-danger">
										<i class="fa fa-trash"></i>
									</button></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 50%"><form:input path="group1IngredName"
										type="text" class="form-control" placeholder="食材" /></td>
								<td style="width: 25%"><form:input path="group1IngredQty"
										type="text" class="form-control" placeholder="份量" /></td>
								<td><button type="button" class="btn btn-danger">
										<i class="fa fa-trash"></i>
									</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="button" class="btn btn-default"
										style="width: 100%">新增食材</button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="button" class="btn btn-default"
										style="width: 100%">新增分組</button>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table" style="width: 90%">
						<thead>
							<tr>
								<th>步驟</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 50%">
									<h2>1</h2> <form:textarea path="step" class="form-control"
										rows="5" />
								</td>
								<td
									style="width: 25%; text-align: center">
									<label class="btn btn-info"><input name="StepImage" class="stepUpl"
										id="upload_img" onchange="ShowStepImg(this)" style="display: none;" type="file"
										accept="image/jpg" /> <i class="fa fa-photo"></i> 上傳步驟照片
									</label>
									<div id="stepImg01"></div>
								</td>
								<td style="vertical-align: middle"><button type="button"
										class="btn btn-danger">
										<i class="fa fa-trash"></i>
									</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<h2>Remark</h2> <form:textarea path="remark"
										class="form-control" rows="5" placeholder="其他想說的請在這邊說" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div style="text-align: center">
					<form:hidden path="userId" value="${LoginOK.userId}" />
					<form:hidden path="recipeNo" value="${recipe.recipeNo}" />
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
	<script type="text/javascript">
	function readURL(input){
		  if(input.files && input.files[0]){
		    var reader = new FileReader();
		    reader.onload = function (e) {
		    	var html = "";
		    	html += "<img width='320px' height='200px' src='"+e.target.result+"'>";
		    	$("#upload_img").html(html);
		    }
		    reader.readAsDataURL(input.files[0]);
		  }
		}
	function ShowStepImg(input){
		  if(input.files && input.files[0]){
		    var reader = new FileReader();
		    reader.onload = function (e) {
		    	var html = "";
		    	html += "<img width='100px' src='"+e.target.result+"'>";
		    	$("#stepImg01").html(html);
		    }
		    reader.readAsDataURL(input.files[0]);
		  }
		}
	
	</script>

</body>
</html>