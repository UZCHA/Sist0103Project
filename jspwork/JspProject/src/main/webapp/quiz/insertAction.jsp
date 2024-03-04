<%@page import="quiz.model.QuizDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="quiz.model.QuizDto"%>
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

String name=request.getParameter("name");
String hp=request.getParameter("hp");
String age=request.getParameter("age");
String driver=request.getParameter("driver");
String writeday=request.getParameter("writeday");

QuizDto dto=new QuizDto();
dto.setName(name);
dto.setHp(hp);
dto.setAge(age);
dto.setDriver(driver);

QuizDao dao=new QuizDao();
dao.insertDatas(dto);

response.sendRedirect("list.jsp");


%>
</body>
</html>