<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
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
	String uploadPath=getServletContext().getRealPath("/shopsave");
	System.out.println(uploadPath);
	
	int uploadSize=1024*1024*5;
	
	MultipartRequest multi=null;
	try{
		multi=new MultipartRequest(request,uploadPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
		String sangpum=multi.getParameter("sangpum");
		String category=multi.getParameter("category");
		String ipgoday=multi.getParameter("ipgoday");
		int price=Integer.parseInt(multi.getParameter("price"));
		String photo=multi.getFilesystemName("photo");
		
		ShopDao dao=new ShopDao();
		
		ShopDto dto=new ShopDto();
		dto.setSangpum(sangpum);
		dto.setCategory(category);
		dto.setIpgoday(ipgoday);
		dto.setPrice(price);
		dto.setPhoto(photo);
		
		dao.insertShop(dto);
		
		//다시 상품입력 폼으로 이동
		response.sendRedirect("../index.jsp?main=shop/addform.jsp");
	}catch(Exception e){
		
	}
	
	
%>
</body>
</html>