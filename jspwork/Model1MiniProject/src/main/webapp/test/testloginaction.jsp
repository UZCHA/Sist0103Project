<%@page import="test1.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>cb
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
String cbsave=request.getParameter("cbsave");

TestDao dao=new TestDao();

boolean b=dao.isIdPassTest(id, pass);

if(b){
	
	//8시간유지
	session.setMaxInactiveInterval(60*60*8);
	
	session.setAttribute("loginok", "yes");
	session.setAttribute("myid", id);
	session.setAttribute("saveok", cbsave==null?null:"yes" );
	response.sendRedirect("testloginmain.jsp");
	
}else{%>
	<script type="text/javascript">
		alert("아이디와 비밀번호가 맞지않습니다.");
		history.back();
	</script>
<%}

%>
</body>
</html>