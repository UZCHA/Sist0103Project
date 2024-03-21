<%@page import="data.dao.MemberDao"%>
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
String myid=(String)session.getAttribute("myid");
MemberDao dao=new MemberDao();
String name= dao.getName(myid);
//System.out.println("id: "+myid+" name: "+name);
%>
<div style="margin: 100px 200px;">
<img alt="" src="image2/flower_ani/f1.png">
<br><br>
<h5>[<%=name %>]님이 로그인중</h5><br>
<button type="button" class="btn btn-danger"
onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
</div>
</body>
</html>