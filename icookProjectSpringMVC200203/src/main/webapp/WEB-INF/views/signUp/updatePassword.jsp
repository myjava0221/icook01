<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8">
<title>修改密碼</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
#pw2, #pw1, #lastname, #firstname, #nickname, #email, #birthday, #gender,
	#phone, #account, #address {
	margin: 14px 0px;
}
</style>


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
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- load-more -->

<!-- //load-more -->
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>

</head>
<body>
	
<!-- 修改密码模型 -->
	<div class="modal" id="changePwdModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4>修改密碼</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-3 control-label">新密碼:</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="changePassword"
									placeholder="請輸入新密碼">
							</div>
							<div style="margin-top: 5px" id="changeAlert" name="changeAlert"></div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-3 control-label">確認密碼:</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="checkPassword"
									placeholder="請確認修改密碼">
							</div>
							<div style="margin-top: 5px" id="checkAlert" name="checkAlert"></div>
						</div>
					</form>
				</div>
				<div style="background: #F0F7FC" class="modal-footer">
					<button type="button" class="btn btn-primary"
						style="margin-left: 20px" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="updatePassword">確認</button>
				</div>
			</div>
		</div>
	</div>
	


</body>
</html>