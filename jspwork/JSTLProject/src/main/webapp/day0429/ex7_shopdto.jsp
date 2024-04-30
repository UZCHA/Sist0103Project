<%@page import="jstl.data.shopDto"%>
<%@page import="java.util.List"%>
<%@page import="jstl.data.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	ShopDao dao=new ShopDao();
	List<shopDto> list=dao.getAllSangpums();
	request.setAttribute("list", list);
%>
<div style="margin: 30px 50px;">
	<h3 class="alert alert-danger" style="width: 800px;">shop 목록</h3>
	<br>
	<table class="table table-bordered" style="width: 800px;">
		<tr>
			<th width="80">번호</th>
			<th width="200">상품명</th>
			<th width="200">색상</th>
			<th width="200">가격</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${dto.sangpum }
					<img alt="" src="${dto.imagename }" style="width: 100px;">
				</td>
				<td style="background-color: ${dto.color};">
					${dto.color }
				</td>
				<td>
					<fmt:formatNumber value="${dto.price }" type="currency"/>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>