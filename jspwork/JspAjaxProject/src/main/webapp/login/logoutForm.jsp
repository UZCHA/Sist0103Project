<%@page import="log.model.logDao"%>
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
//session으로부터 id 읽어온다
String id=(String)session.getAttribute("idok");
//아이디에 해당하는 이름을 dao로부터 얻어온다
logDao dao=new logDao();
String name=dao.getName(id);

%>
<br><br>
<h4 class="alert alert-warning"><%=name %>님이 로그인 하셨습니다.</h4>
<input value="로그아웃" class="btn btn-danger" type="button"
onclick="location.href='logoutAction.jsp'">
<br><br>
<img alt="" src="../image/div_img/beauty3.jpg">
</body>
</html>