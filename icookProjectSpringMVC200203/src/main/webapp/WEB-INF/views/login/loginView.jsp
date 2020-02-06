<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#forgetPassword{

margin-left:47%;
text-align:center;
}
</style>

<meta charset="UTF-8">
	<meta charset="UTF-8">
	<title>Login</title>
	<!-- for-mobile-apps -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />	
	
	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="index.html">Home</a><i>|</i></li>
				<li>Login Page</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->

<!-- login -->
	<div class="login">
		<div class="container">
			<h6>Login</h6>
			<h3>Welcome to our Truckage.Please enter your 
				<a href="login.html">Login</a> details to login here. Or <a href="sign-up.html">
				Register</a> here.</h3>
				
				<fieldset>
					<form method="POST" class="form-horizontal">
						<input type="text" id="account" name="account" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'User Name';}" />
						<input type="password" id="password" name="password" class="lock"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" />
						<!-- 				記住密碼 -->
		<!-- 				<div class="remember"> -->
		<!-- 					 <div class="w3agile_checkbox1"> -->
		<!-- 						   <label class="checkbox"><input type="checkbox" name="Checkbox" checked=""><i> </i>Remember me</label> -->
		<!-- 					 </div> -->
		<!-- 					 <div class="w3agile_forgot"> -->
		<!-- 						<h4><a href="#">Forgot Password?</a></h4> -->
		<!-- 					 </div> -->
		<!-- 					<div class="clearfix"> </div> -->
		<!-- 				</div> -->
		
						<TR height='10'>
								<TD align="CENTER" colspan='2'>&nbsp;<Font color='red'
									size="-1"> ${ErrorMsgKey.LoginError}&nbsp;</Font></TD>
						</TR>
						<input type="submit" value="登入">
						
					</form>
					
				<a href="<c:url value='/signUp/forgetPassword'/>" id="forgetPassword">忘記密碼?</a>
				</fieldset>
				
				
			<div class="agile_back_home">
				<a href=<c:url value='index' />>back to home</a>
			</div>
		</div>
	</div>
<!-- //login -->

<!-- for bootstrap working -->
	<script src="/js/bootstrap.js"></script>
<!-- //for bootstrap working -->

	

</body>
</html>