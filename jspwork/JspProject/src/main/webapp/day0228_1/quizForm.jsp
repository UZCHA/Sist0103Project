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
<form action="quizWrite.jsp" method="post">
	<table class="table table-bordered" style="width: 500px">
		<tr>
			<th class="table-info" >사원명</th>
			<td>
				<input type="text" name="name" placeholder="이름" required="required">
			</td>
		</tr>
		<tr>
			<th class="table-info" >입사일자</th>
			<td>
				<input type="date" name="ibsadate" required="required">
			</td>
		</tr>
		<tr>
			<th class="table-info" >오늘의 선택 점심메뉴</th>
			<td>
				<input type="radio" name="jumsim" value="../image/Food/8.jpg"> 샌드위치
				<input type="radio" name="jumsim" value="../image/Food/3.jpg">육개장
				<input type="radio" name="jumsim" value="../image/Food/12.jpg">순두부라면
				
			</td>
		</tr>
		<tr>
			<th class="table-info" >건의 하는 메뉴</th>
			<td>
				<select name="menu" multiple="multiple">
					<option value="쌀국수">쌀국수</option>
					<option value="마라탕">마라탕</option>
					<option value="불고기">불고기</option>
					<option value="떡볶이">떡볶이</option>
					<option value="삼겹살">삼겹살</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="전송" class="btn btn-info">
				<input type="reset" value="초기화" class="btn btn-danger"> 
			</td>
		</tr>
	</table>
	
</form>
</body>
</html>