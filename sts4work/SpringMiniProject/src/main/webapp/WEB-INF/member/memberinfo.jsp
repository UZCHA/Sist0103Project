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
<h1>회원정보</h1>
<div style="margin: 50 100px; width: 700px;">
<c:forEach var="dto" items="${list }">
	<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.id}">
		<table class="table table-bordered">
			<tr>
				<td rowspan="7" align="center">
					<img alt="" src="/memberphoto/${dto.photo}" style="width: 200px;height: 200px;">
					<br>
					<input type="file" id="newphoto" num="${dto.num }" style="display: none;">
					<button type="button" class="btn btn-info">사진수정</button>
				</td>
				<td>회원명:${dto.name }</td>
				<td rowspan="7" style="vertical-align: middle;" align="center">
					<button type="button" class="btn btn-outline-info" num="${dto.num }" >수정</button>
					<button type="button" class="btn btn-outline-info" num="${dto.num }" >삭제</button>
				</td>
			</tr>
			<tr>
				<td>아이디:${dto.id }</td>
			</tr>
	
			<tr>
				<td>연락처:${dto.hp }</td>
			</tr>
			<tr>
				<td>주소:${dto.addr }</td>
			</tr>
			<tr>
				<td>이메일:${dto.email}</td>
			</tr>
			<tr>
				<td>가입날짜:${dto.gaipday }</td>
			</tr>
	
		</table>
	</c:if>
</c:forEach>

</div>
</body>
</html>