<%@page import="simpleboard.SimpleBoardDto"%>
<%@page import="simpleboard.SimpleBoardDao"%>
<%@page import="uploadboard.data.UploadBoardDao"%>
<%@page import="uploadboard.data.UploadBoardDto"%>
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
String subject=request.getParameter("subject");
String content=request.getParameter("content");
String writer=request.getParameter("writer");
String pass=request.getParameter("pass");

SimpleBoardDto dto=new SimpleBoardDto();
dto.setNum(num);
dto.setWriter(writer);
dto.setPass(pass);
dto.setSubject(subject);
dto.setContent(content);

SimpleBoardDao dao=new SimpleBoardDao();
dao.updateSimpleBoard(dto);

response.sendRedirect("contentview.jsp?num="+num);

%>

</body>
</html>