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
	<form action="read" method="post">
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<th width="200">이름</th>
				<td>
					<input type="text" name="name" class="form-control">
				</td>
			</tr>
			<tr>
				<th>좋아하는 색</th>
				<td>
					<input type="color" name="color" class="form-control"
					value="#ffccff" style="width: 50px;">
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
				<div class="form-check">
					<input type="checkbox" name="hobby" value="영화">영화
					<input type="checkbox" name="hobby" value="산책">산책
					<input type="checkbox" name="hobby" value="여행">여행
					<input type="checkbox" name="hobby" value="독서">독서
					<input type="checkbox" name="hobby" value="코딩">코딩
				</div>
				</td>
			</tr>
			<tr>
				<th>가장재밌는 언어</th>
				<td>
					<select name="lang">
						<option value="java">java</option>
						<option value="html">html</option>
						<option value="ajax">ajax</option>
						<option value="spring">spring</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="submit" class="btn btn-info">서버에 전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>