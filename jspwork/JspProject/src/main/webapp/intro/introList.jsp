<%@page import="intro.model.IntroDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="intro.model.IntroDao"%>
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
IntroDao dao=new IntroDao();
ArrayList<IntroDto> list=dao.getAllIntro();

%>
<div>
<button class="brn brn-success">입력폼</button>
<hr>
<table class="table table-bordered">
	<tr>
		<th>No</th><th>이름</th><th>나이</th><th>생년월일</th><th>출신지</th><th>취미</th><th>메모</th>
	</tr>

</table>
</div>
</body>
</html>