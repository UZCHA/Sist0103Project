<%@page import="data.dao.AnswerGuestDao"%>
<%@page import="data.dto.AnswerGuestDto"%>
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
String num=request.getParameter("num");
String myid=request.getParameter("myid");
String currentPage=request.getParameter("currentPage");
String content=request.getParameter("content");

AnswerGuestDto dto=new AnswerGuestDto();
dto.setNum(num);
dto.setMyid(myid);
dto.setContent(content);

//db에 저장
AnswerGuestDao dao=new AnswerGuestDao();
dao.insertAnswer(dto);

//다시보던 페이지로 이동
response.sendRedirect("../index.jsp?main=memberguest/guestlist.jsp?currentPage="+currentPage);
%>
</body>
</html>