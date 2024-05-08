<%@page import="mem_gaip.model.MemgaipDao"%>
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
String m_num=request.getParameter("m_num");
String m_pass=request.getParameter("m_pass");

MemgaipDao dao=new MemgaipDao();
boolean flag=dao.isEqualPass(m_num, m_pass);

if(flag){
	
	dao.deleteMemgaip(m_num);
	%>
	<script type="text/javascript">
		alert("삭제되었습니다.");
		location.href='mem_List.jsp';
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