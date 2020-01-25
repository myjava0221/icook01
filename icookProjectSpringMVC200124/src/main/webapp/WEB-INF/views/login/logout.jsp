<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>愛料理首頁</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


</head>
<body>

	<!-- 先將使用者名稱取出 -->
<c:set var="nickName" value="${ LoginOK.nickname }" />
<!-- 移除放在session物件內的屬性物件 -->
<c:remove var="LoginOK" scope="session" />
<c:remove var="ShoppingCart" scope="session" />
<!-- 下列敘述設定變數funcName的值為OUT，top.jsp 會用到此變數 -->
<c:set var="funcName" value="OUT" scope="session"/>
<!-- 引入共同的頁首 -->
<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />

<!-- 下列六行敘述設定登出後要顯示的感謝訊息 -->
<c:set var="logoutMessage" scope="request"/>
<font color='blue' ><BR>
訪客${ nickname }，感謝您使用本系統。<BR>
您已經登出<BR>
</font>
<jsp:useBean id="logoutBean" class="com.icook.login.model.LogoutBean" scope="page" />
    
<c:set target='${logoutBean}' property='session' value='${pageContext.session}'/>
   
${logoutBean.logout}

<c:redirect url="/"/>

</body>
</html>