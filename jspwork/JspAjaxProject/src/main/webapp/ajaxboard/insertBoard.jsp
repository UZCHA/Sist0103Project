<%@page import="ajaxboard.AjaxBoardDto"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Diphylleia&family=Gaegu&family=Nanum+Myeongjo&family=Single+Day&family=Sunflower:wght@300&display=swap"
        rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("utf-8");

String writer=request.getParameter("writer");
String subject=request.getParameter("subject");
String avata=request.getParameter("avata");
String content=request.getParameter("content");

AjaxBoardDto dto=new AjaxBoardDto();
dto.setWriter(writer);
dto.setSubject(subject);
dto.setAvata(avata);
dto.setContent(content);

AjaxBoardDao dao=new AjaxBoardDao();
dao.insertBoard(dto);
%>
</body>
</html>