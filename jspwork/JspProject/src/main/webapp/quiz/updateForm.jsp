<%@page import="quiz.model.QuizDao"%>
<%@page import="quiz.model.QuizDto"%>
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
<%
String no=request.getParameter("no");
QuizDao dao=new QuizDao();
QuizDto dto=dao.getDatas(no);


%>
<body>
<form action="updateAction.jsp" style="width: 500px; height: 500px;" method="post">
<table class="table table-bordered">
	<tr>
		<th>이름</th>
		<td>
			<input type="text"  name="name" placeholder="이름" required="required" value="<%=dto.getName()%>">
		</td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td>
			<input type="text" name="hp" required="required" value="<%=dto.getHp()%>">
		</td>
	</tr>
	<tr>
		<th>나이</th>
		<td>
			<input type="text" name="age" placeholder="나이" required="required" value="<%=dto.getAge() %>">
		</td>
	</tr>
	
	<tr>
		<th>운전면허</th>
		<td>
			<input type="checkbox" name="driver" <%= dto.getDriver() != null ? "checked" : "" %>>있음
			<!--consol.log(<%=dto.getDriver() %>);  -->
			<!-- consol.log(<%=dto.getAge() %>); -->
		</td>
	</tr>
	<tr>
		<th>가입날짜</th>
		<td>
			<input type="date" name="writeday" value="<%=dto.getWriteday()%>">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="hidden" name="no" value="<%=no%>">
			<input type="submit" value="수정" >
			<input type="button" value="목록" onclick="location.href='list.jsp'">
		</td>
	</tr>
</table>

</form>
</body>
</html>