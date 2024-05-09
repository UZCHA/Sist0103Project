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
	<div>
		<button type="button" class="btn btn-info"
		onclick="location.href='writeform'">회원가입 폼</button>	<br><br>
		<c:if test="${totalCount==0 }">
			가입한 회원이 없습니다.
		</c:if>
		<c:if test="${totalCount>0 }">
		<h5>총 ${totalCount}명의 회원 정보가 있습니다.</h5>
		<table class="table table-bordered" style="width: 600px;">
			<tr align="center">
				<th>번호</th>
				<th>회원명</th>
				<th>아이디</th>
				<th>핸드폰</th>
				<th>가입일</th>
				<th>편집</th>
			</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${dto.name }</td>
				<td>${dto.id }</td>
				<td>${dto.hp }</td>
				<td>${dto.gaipday }</td>
				<td>
					<button type="button" onclick="location.href=''">수정</button>
					<button type="button" onclick="location.href=''">삭제</button>
				</td>
			</tr>
		</c:forEach>
		</table>
		</c:if>
	</div>
</body>
</html>