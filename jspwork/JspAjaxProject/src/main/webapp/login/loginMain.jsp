<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Grandiflora+One&family=Gugi&family=Hahmlet:wght@100..900&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	String loginok=(String)session.getAttribute("loginok");

	if(loginok==null || loginok.equals("")) //로그아웃상태, 항상 null먼저
	{%>
		<jsp:include page="loginForm.jsp"/>
		
	<%}else{%>
		<jsp:include page="logoutForm.jsp"/>
	<%}
%>
</body>
</html>