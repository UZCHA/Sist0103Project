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
<div style="margin: 50px 100px; width: 800px;">
<button type="button" class="btn btn-outline-success" 
onclick="location.href='writeform'" style="float: right;">회원정보입력</button><br><br>
	<c:if test="${totalCount==0 }">
		<h6 class="alert alert-info">저장된 회원 정보가 없습니다. </h6>
	</c:if>
	<c:if test="${totalCount>0 }">
		<h6 class="alert alert-success">총 ${totalCount}명의 회원 정보가 있습니다.</h6>
		<hr>
		<table class="table table-bordered">
			<tr class="table-success" align="center">
				<th width="80">번호</th>
				<th width="100">이름</th>
				<th width="150">연락처</th>
				<th width="200">주소</th>
				<th width="180">가입일</th>
				<th width="180">편집</th>
			</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${dto.name }</td>
				<td>${dto.hp }</td>
				<td>${dto.addr }</td>
				<td>${dto.gaipday }</td>
				<td align="center">
					<button type="button" class="btn btn-outline-info btn-sm" 
					onclick="location.href='updateform?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-outline-danger btn-sm" 
					onclick="location.href='memdelete?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
		</table>
	
	</c:if>
</div>
</div>

</body>
</html>