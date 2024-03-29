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

%>
<jsp:useBean id="dao" class="data.dao.SmartDao"/>
<jsp:useBean id="dto" class="data.dto.SmartDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	dao.insertSmart(dto);
	//일단은 목록으로 이동. 나중에 디테일페이지로 변경예정
	//response.sendRedirect("../index.jsp?main=smartboard/boardlist.jsp");
	int num=dao.getMaxNum();
	response.sendRedirect("../index.jsp?main=smartboard/contentview.jsp?num="+num+"&currentPage="+1);
%>
</body>
</html>