<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<h2>폼데이타 MAP 읽기</h2>
<form action="write3" method="post">
	<table class="table table-bordered" style="width: 300px;">
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" class="form-control" required="required">
			</td>
		</tr>
		<tr>
			<th>혈액형</th>
			<td>
				<input type="text" name="blood" class="form-control" required="required">
			</td>
		</tr>
		<tr>
			<th>부서</th>
			<td>
				<input type="text" name="buseo" class="form-control" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-danger">서버에 전송</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>