<%@page import="info.model.InfoDao"%>
<%@page import="info.model.InfoDto"%>
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
	String addr=request.getParameter("addr");
	
	//입력데이타를 dto로 묶어서 메서드로 전달
	InfoDto dto=new InfoDto();
	
	dto.setName(name);
	dto.setAddr(addr);
	
	//insert메서드로 전달
	InfoDao dao=new InfoDao();
	dao.infoInsert(dto);
	
	//출력 jsp로 이동- url의 주소가 바껴야 한다. addaction.jsp의 주소가 나오면 오류임!!
	response.sendRedirect("list.jsp");
%>
</body>
</html>