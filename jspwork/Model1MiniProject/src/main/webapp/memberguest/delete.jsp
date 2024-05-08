<%@page import="java.io.File"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
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
String num=request.getParameter("num");
String currentPage=request.getParameter("currentPage");

GuestDao dao=new GuestDao();

//실제경로 구하기
String img=dao.getData(num).getPhotoname();
String uploadPath=getServletContext().getRealPath("/save");
File file=new File(uploadPath+"/"+img);

if(file.exists())
{
	file.delete();
}
dao.deleteGuest(num);
//System.out.println("dd");
//String go="../index.jsp?main=memberguest/guestlist/jsp?currentPage="+currentPage;
//response.sendRedirect(go);
response.sendRedirect("../index.jsp?main=memberguest/guestlist.jsp?currentPage="+currentPage);

%>

</body>
</html>