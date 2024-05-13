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
<form action="write" method="post">
		<table class="table table-bordered" style="width: 400px;">
			<tr>
				<th class="table-light">회원이름</th>
				<td>
					<input type="text" name="name" style="width: 120px;" required="required">
				</td>
			</tr>
			
			<tr>
				<th class="table-light">연락처</th>
				<td>
					<input type="text" name="hp" style="width: 120px;" required="required">
				</td>
			</tr>
			<tr>
				<th class="table-light">주소</th>
				<td>
					<input type="text" name="addr" style="width: 120px;" required="required">
				</td>
			</tr>
			<tr>
				<th class="table-light">가입날짜</th>
				<td>
					<input type="date" name="gaipday" style="width: 120px;" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success" style="width: 100px">회원 저장</button>
					<button type="button" class="btn btn-info" onclick="location.href='list'"
					style="width: 100px">목록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>