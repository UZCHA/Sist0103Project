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
<div style="width: 1000px;">
<h1>boardlist</h1>
<button type="button" onclick="location.href='form'"
style="float: right;">글쓰기</button><br><br>

<table class="table table-bordered" style="width: 1000px;">
	<tr align="center">
		<th width="50">번호</th>
		<th width="300">제목</th>
		<th width="150">작성자</th>
		<th width="50">조회</th>
		<th width="200">등록일</th>
	</tr>
	<c:if test="${totalCount==0 }">
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${totalCount>0 }">
		
	</c:if>
</table>
</div>
</body>
</html>