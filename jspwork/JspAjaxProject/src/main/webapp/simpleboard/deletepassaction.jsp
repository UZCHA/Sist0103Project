<%@page import="simpleboard.SimpleBoardDao"%>
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

String num=request.getParameter("num");
String pass=request.getParameter("pass");

SimpleBoardDao dao=new SimpleBoardDao();

boolean flag=dao.isEqualPass(num, pass);

if(flag){
	dao.deleteSimpleBoard(num);
	//response.sendRedirect("boardlist.jsp");
	%>
	<script type="text/javascript">
		alert("삭제되었습니다\n목록으로 이동합니다.");
		location.href='boardlist.jsp';
	</script>
<%}else{%>
	<script type="text/javascript">
		alert("비밀번호가 맞지않습니다.");
		history.back();
	</script>
<%}

%>
</body>
</html>