<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String myid=(String)session.getAttribute("myid");


ServletContext context=getServletContext();
String realpath=context.getRealPath("/save");

System.out.println(realpath);

int uploadsize=1024*1024*3;

MultipartRequest multi=null;
try{
multi=new MultipartRequest(request,realpath,uploadsize,"utf-8",new DefaultFileRenamePolicy());

String content=multi.getParameter("content");
String photoname=multi.getFilesystemName("photo");

//dto에 저장
GuestDto dto=new GuestDto();
dto.setMyid(myid);
dto.setContent(content);
dto.setPhotoname(photoname);

//insert한 후에 이동
GuestDao dao=new GuestDao();
dao.insertGuest(dto);
//방명록 목록으로 이동
response.sendRedirect("../index.jsp?main=memberguest/guestlist.jsp");

}catch(Exception e){
	
}
%>
</body>
</html>