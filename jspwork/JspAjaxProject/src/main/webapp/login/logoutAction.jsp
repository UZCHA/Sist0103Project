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
	//로그인에 대한 세션값 삭제해준다
	session.removeAttribute("loginok");
	//loginMain으로 이동, 항상 메인을 통해서 이동하게끔 한다.
	//메인페이지에서 알아서 판단해서 보내줌.
	response.sendRedirect("loginMain.jsp");
%>
</body>
</html>