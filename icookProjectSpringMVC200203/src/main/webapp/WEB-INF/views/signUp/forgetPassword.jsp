<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta charset="UTF-8">
	<title>忘記密碼</title>
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

</script>
	
	
	
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
			<h6>忘記密碼</h6>
			
		<form class="form-horizontal templatemo-forgot-password-form templatemo-container"  method="post">    
                <div class="form-group">
                  <div class="col-md-12">
                      請輸入你的信箱，點擊確定。找回密碼的連結將傳送到你的信箱
                  </div>
                </div>        
                <div class="form-group">
                  <div class="col-md-12">
                    <input type="email" class="form-control" name="account" id="account" placeholder="你的信箱">                
                  </div>              
                </div>
                <div class="form-group">
                  <div class="col-md-12">
                    <input type="submit" value="確定" class="btn btn-danger">
                    <br><br>
                    <a href="<c:url value='/iogin/loginView'/>">不用密碼重製?現在馬上登入</a> 
                    <!--<a href="login-2.html">用户名和注册邮箱已忘记，进行账号申诉？</a>-->
                  </div>
                </div>
              </form>
			
			<div class="agile_back_home">
				<a href="<c:url value='/'/>">back to home</a>
			</div>
		</div>
	</div>
<!-- // -->

</body>
</html>