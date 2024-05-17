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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<body>
<div style="margin: 100px 100px;">
	<button type="button" class="btn btn-warning"
	onclick="location.href='addform'">글쓰기</button>
	<br><br>
	<h2>총 ${count }개의 게시글이 있습니다. </h2><br>
	<table class="table table-bordered">
		<tr>
			<th width="80">번호</th>
			<th width="480">제목</th>
			<th width="150">작성자</th>
			<th width="250">작성일</th>
		</tr>
		<c:if test="${count==0 }">
			<tr>
				<td colspan="4" align="center">등록된 게시물이 없습니다. </td>
			</tr>
		</c:if>
		<c:if test="${count>0 }">
			<c:forEach var="dto" items="${list }" varStatus="i">
			<c:set var="n" value="${count-i.index }"/>
				<tr>
					<td>${n }</td>
					<td><a href="detail?num=${dto.num }">${dto.subject }</a>
						<c:if test="${dto.photo !='no'}">
							<i class="bi bi-images"></i>
						</c:if>
					</td>
					<td>${dto.writer }</td>
					<td>
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:ss"/>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>
</body>
</html>