<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta charset="UTF-8">
	<title>註冊</title>
	<!-- for-mobile-apps -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
#pw2,#pw1,#lastname,#firstname,#nickname,#email,#birthday,#gender,#phone,#account,#address{
margin: 14px 0px;
}


</style>
<script type="text/javascript">
$(document).ready(function(){
	
		$("#confirm").click(function(){
			var account = $("#account").val();
			var password = $("#pw1").val();
			var password2 = $("#pw2").val();
// 			var lastname = $("#lastname").val();
// 			var firstname = $("#firstname").val();
// 			var nickname = $("#nickname").val();
// 			var email = $("#email").val();
// 			var birthday = $("#birthday").val();
// 			var gender = $("#gender").val();
// 			var phone = $("#phone").val();
			
<%-- 			if(<%=(Boolean)request.getAttribute("accJudge")%> == true){ --%>
// 				document.getElementById("account").value = "";
// 				$("#bb").html("<span style='color:red'>帳號已被使用</span>");
// 			}
			
	 		if((password !="") && (password2 !="")){
	 			
	 			if(password == password2 ){
		 			$("#p1").html("<span style='color:green'>密碼一致</span>");
		 			//$("#p2").html("<span style='color:green'>密碼一致</span>");
		 		}
				else {
					$("#p1").html("<span style='color:red'>密碼不一致</span>");
					document.getElementById("pw1").value = "";
					document.getElementById("pw2").value = "";
				}
	 		}
// 	 		if(password ==""){
// 	 			$("#p1").html("<span style='color:red'>請輸入密碼</span>");
// 	 		}
// 	 		if(password2 ==""){
// 	 			$("#p2").html("<span style='color:red'>請輸入密碼</span>");
// 	 		}
// 	 		if(lastname ==""){
// 	 			$("#lname").html("<span style='color:red'>請輸入姓</span>");
// 	 		}else {
// 	 			$("#lname").html("<span style='color:green'>V</span>");
// 	 		}
// 	 		if(firstname ==""){
// 	 			$("#fname").html("<span style='color:red'>請輸入名</span>");
// 	 		}else {
// 	 			$("#fname").html("<span style='color:green'>V</span>");
// 			}
// 	 		if(nickname ==""){
// 	 			$("#nname").html("<span style='color:red'>請輸入暱稱</span>");
// 	 		}
// 	 		if(email ==""){
// 	 			$("#em").html("<span style='color:red'>請輸入信箱</span>");
// 	 		}
// 	 		if(birthday ==""){
// 	 			$("#bir").html("<span style='color:red'>請輸入生日</span>");
// 	 		}
// 	 		if(gender ==""){
// 	 			$("#ge").html("<span style='color:red'>請選擇性別</span>");
// 	 		}
	 		
// 	 		if(phone ==""){
// 	 			$("#ph").html("<span style='color:red'>請輸入電話</span>");
// 	 		}
	 		
	 		
	 		
	 		
	});
 	
});
</script>
	
	
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //for-mobile-apps ${pageContext.request.contextPath}-->
	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<!-- load-more -->
	
	<!-- //load-more -->
	<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />	
	<!-- banner1 -->
	<div class="banner1">
		<div class="container">
		</div>
	</div>

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="index.html">Home</a><i>|</i></li>
				<li>Sign Up Page</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->

<!--  -->
	<div class="login">
		<div class="container">
			<h6>註冊</h6>
			
			<form method="post" modelAttribute="MemberBean">
		
		<table>
		<tr>
			<td>帳號<span style="color: red;">*</span>:</td>
			<td><input type="text" class="form-control" name="account" id="account" required/><span id="bb"> </span></td>
		</tr>

		<tr>
			<td>密碼<span style="color: red;">*</span>:</td>
			<td><input type="password" class="form-control" name="password" id="pw1" required/><span id="p1"> </span></td> 
		</tr>
	<tr>	
		<td>確認密碼<span style="color: red;">*</span>:</td>
		<td><input type="password" class="form-control" name="password2" id="pw2" required/><span id="p2"> </span></td> 
	</tr>
	<tr>
		<td>姓<span style="color: red;">*</span> : </td>
		<td><input type="text" class="form-control" name="lastname" id="lastname" required/><span id="lname"> </span></td> 
	</tr>
	<tr>
		<td>名<span style="color: red;">*</span> : </td>
		<td><input type="text" class="form-control" name="firstname" id="firstname" required/><span id="fname"> </span> </td>
		</tr>
		
		<tr>
		<td>暱稱<span style="color: red;">*</span> : </td>
		<td><input type="text" class="form-control" name="nickname" id="nickname" required/><span id="nname"> </span> </td>
		</tr>
		
		<tr>	
		<td>信箱<span style="color: red;">*</span>: </td>
		<td><input type="email" class="form-control" name="email" id="email" required/><span id="em"> </span> </td>
		</tr>	
			
		<tr>
		<td>生日<span style="color: red;">*</span>: </td>
		<td><input type="date" class="form-control" name="birthday" id="birthday" required/><span id="bir"> </span> </td>
		</tr>	
		
		<tr>
		<td>性別: </td>
		<td>
		<input type="radio" name="gender" value="男" id="gender"/>男 
		<input type="radio" name="gender" value="女" id="gender"/>女 
		<input type="radio" name="gender" value="其他" id="gender"/>其他 <span id="ge"> </span> 
		</td>
		</tr>	
		
		<tr>
		<td>連絡電話<span style="color: red;">*</span>:</td>
		<td><input type="tel" class="form-control" name="phone" pattern="[0-9]{10}" required id="phone" /> <span id="ph"> </span> </td> 
		</tr>
		
		<tr>
		<td>地址<span style="color: red;">*</span>:</td>
		<td><input type="text" class="form-control" name="address" id="address"/> </td>
		</tr>
	
		</table>
		<br>
		<input type="submit" id="confirm" value="註冊" /> 
	</form>
			
			<div class="agile_back_home">
				<a href="<c:url value='/'/>">back to home</a>
			</div>
		</div>
	</div>
<!-- // -->

</body>
</html>