<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>愛料理首頁</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- 商品套版 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course/main.css" />
<!-- //商品套版 -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />
	<!-- 課程詳細內容-->


	<!-- 商品套版 -->
	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="container">
			<header class="major special">
				<h2>${course.courseName}</h2>
				<br>
				<p>Lorem ipsum dolor sit amet nullam id egestas urna aliquam</p>
			</header>
			<!-- 					卡車套件 -->
			<a href="#" class="image fit"><img src="../css/images/pic11.jpg"
				alt="" /></a>
			<div class="services-breadcrumb">
				<div class="container">
					<ul>
						<li><a href="<c:url value='/courseOrder/courseCart' />">購物車</a><i>|</i></li>
						<li><a href="<c:url value='/course/courseHomePage' />">返回列表</a></li>
					</ul>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8">

					<br> <br>
					<h4>課程時間</h4>
					<h5>${course.courseStartDate}~${course.courseStartDate}</h5>
					<br> <br>
					<h4>上課地點</h4>
					<h5>台北市大安區復興南路一段390號 2,3號2樓 ${course.roomNo}號教室</h5>
					<br> <br>
					<h4>課程簡介</h4>
					<h5>${course.courseIntrod}</h5>
					<br> <br>
					<h4>課程費用</h4>
					<h5>${course.coursePrice}</h5>
				</div>
				<div class="col-md-4">
					<br> <br>
					<div class="card"
						style="width: 18rem; -webkit-box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.25); -moz-box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.25); box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.25);">
						<div class="card-body">
							<h3 class="card-title">立即購買</h3>
							<br>
							<h4>剩餘座位: ${courseStock}</h4>
							<p class="card-text"></p>
							<br>
							<form action="${pageContext.request.contextPath}/courseOrder/courseCart">
								<div class="form-row align-items-center">
									<div class="col-auto my-1">
										<select class="custom-select"
											style="height: 30px; width: 100px;"
											onchange="calPrice(${course.coursePrice})" name="orderQty"
											id="orderQty">
											<option selected>訂購數量</option>
											<c:forEach var="i" begin="0" end="${courseStock}">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-auto my-1" id="totalPrice"></div>
								</div>
								<br> <Input type='hidden' name='courseId' value='${course.courseId}'> 
<!-- 								<a href=<c:url value='/courseOrder/courseCart' /> -->
<!-- 									class="btn btn-primary">結帳</a>  																	 -->
								<input type="submit" class="btn btn-primary" id="addCourseVart" value="結帳"></a> 
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 		google地圖 -->
	<div class="w3ls_map align-items-center">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14459.209555474516!2d121.54840684864891!3d25.040779468751495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abd379a5ec97%3A0xedc006d25a9e35df!2z6LOH562W5pyDIOaVuOS9jeaVmeiCsueglOeptuaJgCDmlbjkvY3kurrmiY3ln7nogrLkuK3lv4M!5e0!3m2!1szh-TW!2stw!4v1578560581668!5m2!1szh-TW!2stw"
			frameborder="0" style="border: 0; text-align: center; width: 500px;"
			allowfullscreen=""></iframe>
	</div>

	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon fa-facebook"> <span
						class="label">Facebook</span>
				</a></li>
				<li><a href="#" class="icon fa-twitter"> <span
						class="label">Twitter</span>
				</a></li>
				<li><a href="#" class="icon fa-instagram"> <span
						class="label">Instagram</span>
				</a></li>
				<li><a href="#" class="icon fa-linkedin"> <span
						class="label">LinkedIn</span>
				</a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled.</li>
				<li>Images: <a href="http://unsplash.com">Unsplash</a>.
				</li>
				<li>Design: <a href="http://templated.co">TEMPLATED</a>.
				</li>
			</ul>
		</div>
	</footer>



	<!-- 		Scripts -->
	<script src="/js/course/jquery.min.js"></script>
	<script src="/js/course//skel.min.js"></script>
	<script src="/js/course/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif] -->
	<script src="/js/course/main.js"></script>

	<script>
		function calPrice(coursePrice){
			var orderQty = document.getElementById("orderQty").value;
			var totalPrice = coursePrice * orderQty;
			var txt = "<p style='color:red' >總金額: "+ totalPrice +"</p>";
			$("#totalPrice").html(txt);
		}
		
// 		$("#addCourseVart").click(function(){
// 			if(${LoginOK} != null)
// 			alert("已加入購物車!");
// 		})
		
	
		
	</script>
</body>
</html>