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
	<img alt="" src="<%=root%>/image/dog4.jpg" style="width: 1200px; height: 800px;">

	<h3>귀여운 강아지 보기</h3>
	<div style="width: 1200px; display: flex;" >
	<img alt="" src="<%=root%>/image/cat1.jpg" width="50%;">
	<img alt="" src="<%=root%>/image/cat2.jpg"width="50%;">
	</div>
	<div style="width: 1200px; display: flex;" >
	<img alt="" src="<%=root%>/image/dog3.jpg"width="50%;">
	<img alt="" src="<%=root%>/image/dog5.jpg"width="50%;">
	</div>

</body>
</html>