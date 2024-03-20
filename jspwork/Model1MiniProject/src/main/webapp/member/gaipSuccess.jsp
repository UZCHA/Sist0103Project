<%@page import="data.dto.MemberDto"%>
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
String id=request.getParameter("id");

MemberDao dao=new MemberDao();
String name=dao.getName(id);
//System.out.println("회원의 이름:"+name);
%>
<div>
<h3>[<%=name %>]님의 회원가입을 환영합니다.</h3>
<button onclick="location.href='login/loginmain.jsp'">로그인</button>
<button onclick="location.href='index.jsp?main.jsp'">메인</button>
</div>
</body>
</html>