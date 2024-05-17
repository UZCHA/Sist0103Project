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
<div style="width: 500px; margin: 0 auto;margin-top: 10%;">
	<table class="table table-bordered">
		<tr>
			<td><h4>제목:${dto.subject }</h4></td>
		</tr>
		<tr>
			<td><span >작성자:${dto.writer }</span>
			<span style="float: right; color: #ccc;">
				<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:ss"/>
			</span>
			</td>
		</tr>
		<tr>
			<td>
				<img alt="" src="../save/${dto.photo }" style="max-width: 300px;">
				<pre>${dto.content }</pre>
			</td>
		</tr>
		<tr>
			<td align="center">
				<button type="button" onclick="location.href='list'">목록</button>
				<button type="button" onclick="location.href='addform'">글쓰기</button>
				<button type="button" onclick="location.href='updateform?num=${dto.num}'">수정</button>
				<button type="button" onclick="location.href='delete?num=${dto.num}'">삭제</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>