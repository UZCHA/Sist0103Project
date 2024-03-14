<%@page import="simpleboard.SimpleBoardDao"%>
<%@page import="simpleboard.SimpleBoardDto"%>
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

String writer=request.getParameter("writer");
String subject=request.getParameter("subject");
String pass=request.getParameter("pass");
String content=request.getParameter("content");

SimpleBoardDto dto=new SimpleBoardDto();
dto.setWriter(writer);
dto.setSubject(subject);
dto.setPass(pass);
dto.setContent(content);

SimpleBoardDao dao=new SimpleBoardDao();
dao.insertSimpleBoard(dto);

//response.sendRedirect("boardlist.jsp");
//insert후에 내용보기로 이동하려면 방금 insert된 num값을 알아야한다.
int maxnum=dao.getMaxNum();
response.sendRedirect("contentview.jsp?num="+maxnum);


%>
</body>
</html>