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
<%
//프로젝트 경로구하기
String root=request.getContextPath();
%>
<body>
<a href="<%=root%>" style="color: black; text-decoration: none">
	<img alt="" src="<%=root%>/image/cat3.png" style="width: 100px;">
	JSP & JQuery 미니프로젝트
</a>
</body>
</html>