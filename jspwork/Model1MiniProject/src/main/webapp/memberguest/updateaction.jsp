<%@page import="org.apache.catalina.ant.jmx.JMXAccessorQueryTask"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
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
ServletContext context=getServletContext();
String realpath=context.getRealPath("/save");

System.out.println(realpath);

int uploadsize=1024*1024*3;

MultipartRequest multi=null;
try{
multi=new MultipartRequest(request,realpath,uploadsize,"utf-8",new DefaultFileRenamePolicy());

String content=multi.getParameter("content");
String photoname=multi.getFilesystemName("photo");
String num=multi.getParameter("num");
String currentPage=multi.getParameter("currentPage");

//기존포토명 가져오기
GuestDao dao=new GuestDao();
String old_photoname=dao.getData(num).getPhotoname();

//dto에 저장
GuestDto dto=new GuestDto();
dto.setNum(num);
dto.setContent(content);

//사진선택을 안하면 기존의 사진으로 저장되어야 함
dto.setPhotoname(photoname==null?old_photoname:photoname);

//수정하고 현재 페이지 그대로 있어야 함.
dao.updateGuest(dto);
//방명록 목록으로 이동
response.sendRedirect("../index.jsp?main=memberguest/guestlist.jsp?currentPage="+currentPage);

}catch(Exception e){
	
}
%>

</body>
</html>