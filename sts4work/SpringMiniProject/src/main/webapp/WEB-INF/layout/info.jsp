<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<div>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<i class="bi bi-envelope-at"></i>&nbsp;qwer@gmail.com<br>
	<i class="bi bi-telephone"></i>&nbsp;010-111-222<br>
	<i class="bi bi-house-door"></i>&nbsp;서울시 강남구 역삼동 <br>
	<i class="bi bi-instagram"></i>&nbsp;(@xeexoxee)
	
	<!-- 로그아웃상태는 기본이미지로, 로그인 상태는 회원가입때 이미지가 나오게 -->
	<c:if test="${sessionScope.loginok==null }">
		<img src="${root }/image/10.jpg" width="130" height="130">
	</c:if>
	<c:if test="${sessionScope.loginok!=null }">
		<img alt="" src="${root }/memberphoto/${sessionScope.loginphoto}" width="130" height="130">
	</c:if>
</div>
</body>
</html>