<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<div style="margin: 0 auto; margin-top: 5%;width: 50%;">
	<form action="insert" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
		<caption align="top">도서 정보 수정</caption>
			<tr>
				<th>도서제목</th>
				<td>
					<input type="text" name="bookname" required="required">
				</td>
			</tr>
			<tr>
				<th>지은이</th>
				<td>
					<input type="text" name="writer" required="required">
				</td>
			</tr>
			<tr>
				<th>도서가격</th>
				<td>
					<input type="text" name="bookprice" required="required">
				</td>
			</tr>
			<tr>
				<th>도서이미지</th>
				<td>
					<input type="file" name="bookphoto" required="required">
				</td>
			</tr>
			<tr>
				<th>출판사</th>
				<td>
					<input type="text" name="bookcompany" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">등록</button>
					<button type="submit" onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>