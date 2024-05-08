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

String id=request.getParameter("id");
//세션에 저장된 loginok를 가져온다.
String loginok=(String)session.getAttribute("loginok");

if(loginok==null)//로그아웃 상태
{%>
	<jsp:include page="loginform.jsp"/>
<%}else{%>
	<jsp:include page="../layout/main.jsp"/>
<%}

%>
</body>
</html>