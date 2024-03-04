<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Diphylleia&family=Gaegu&family=Nanum+Myeongjo&family=Single+Day&family=Sunflower:wght@300&display=swap"
        rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="insertAction.jsp" style="width: 500px; height: 500px;" method="post">
<table class="table table-bordered">
	<tr>
		<th>이름</th>
		<td>
			<input type="text"  name="name" placeholder="이름" required="required">
		</td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td>
			<input type="text" name="hp" required="required">
		</td>
	</tr>
	<tr>
		<th>나이</th>
		<td>
			<input type="text" name="age" placeholder="나이" required="required">
		</td>
	</tr>
	
	<tr>
		<th>운전면허</th>
		<td>
			<input type="checkbox" name="driver" value="있음">있음
		</td>
	</tr>
	<tr>
		<th>가입날짜</th>
		<td>
			<input type="date" name="writeday">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="전송" >
			<input type="button" value="목록" onclick="location.href='list.jsp'">
		</td>
	</tr>
</table>

</form>
</body>
</html>