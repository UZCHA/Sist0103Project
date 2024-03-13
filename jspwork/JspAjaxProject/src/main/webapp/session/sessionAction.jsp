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
	request.setCharacterEncoding("utf-8");

	//세션이 있는지 확인, 확인후에는 없으면 선물 꽝!!
	String msg=(String)session.getAttribute("msg");//오브젝트이므로 맞춰주기위해 string을 적어주는 것
	String gift=request.getParameter("gift");
	
	if(msg==null || !msg.equals("happy"))
	{%>
		<h3 style="color: red">시간초과로 꽝입니다.</h3>
	<%}else{%>
		<h3 style="color: green">축하합니다<%=gift %>선물에 당첨되셨서요!</h3>
	<%}

%>
<a href="sessionMain.jsp">다시선택</a>
</body>
</html>