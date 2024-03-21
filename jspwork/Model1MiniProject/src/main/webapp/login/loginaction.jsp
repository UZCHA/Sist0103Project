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
String pass=request.getParameter("pass");
String cbsave=request.getParameter("cbsave"); //체크 안하면 null

MemberDao dao=new MemberDao();

boolean b=dao.isIdPass(id, pass);

//아이디, 비번 맞으면 세션3개 저장 -> 로그인 메인 
if(b){
	session.setMaxInactiveInterval(60*60*8); //8시간 유지, 생략시 30분 기본
	
	session.setAttribute("loginok", "yes");
	session.setAttribute("myid", id);
	session.setAttribute("saveok", cbsave==null?null:"yes");
	
	response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
}else{%>
	<script type="text/javascript">
		alert("아이디 또는 비밀번호가 맞지않습니다.");
		history.back();
	</script>
<%}
%>
</body>
</html>