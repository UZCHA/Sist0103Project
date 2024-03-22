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
<%
//프로젝트 경로구하기
String root=request.getContextPath();
%>
<body>

<a href="<%=root%>" style="color: black; text-decoration: none">
	<img alt="" src="<%=root%>/image/cat3.png" style="width: 100px;">
	JSP & JQuery 미니프로젝트
</a>
<div style="float: right; padding-right: 50px;">
	<%
		//로그인 세션을 얻어야함
		String loginok=(String)session.getAttribute("loginok");
		//아이디를 얻는다
		String myid=(String)session.getAttribute("myid");
		
		MemberDao dao=new MemberDao();
		String name=dao.getName(myid);
		
		if(loginok==null){//로그아웃 상태임
			%>
			<button type="button" class="btn btn-success"
			style="width: 100px;" onclick="location.href='index.jsp?main=login/loginform.jsp'">Login</button>
		<%}else{%>
			<b style="font-size: 12pt;"><%=name %>님 로그인중</b>
			<button type="button" class="btn btn-danger" style="width: 100px;"
			onclick="location.href='login/logoutaction.jsp'">Logout</button>
		<%}
	%>
</div>

</body>
</html>