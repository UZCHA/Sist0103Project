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
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String save=request.getParameter("saveck");

//아이디와 비번이 맞는지 확인
logDao db=new logDao();
boolean flag=db.isLogin(id, pass);

//만약에 맞으면 세션에 저장후에 로그인메인으로 이동
if(flag)
{	
	//3개 저장
	//로그인 중인지 알 수 있는 세션저장, 뒤에 'yes'값은 마음대로 원하는 대로 지정
	session.setAttribute("loginok", "yes");
	//id와 체크값 저장
	session.setAttribute("idok", id);
	//체크하면 on, 체크안하면 null이 저장
	session.setAttribute("saveok", save);
	
	//세션 유지 시간
	session.setMaxInactiveInterval(60*60*8); //8시간동안 유지
	//로그인메인으로 이동
	response.sendRedirect("loginMain.jsp");
}else{%>
	<script type="text/javascript">
		alert("아이디와 비밀번호가 맞지않습니다");
		history.back();
	</script>
<%}
%>
</body>
</html>