<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
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
<body>
<%
QuizDao dao=new QuizDao();
Vector<QuizDto> list=dao.getAllDatas();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일");

%>
<div>
<button type="button" onclick="location.href='insertForm.jsp'">입력폼</button>
<hr>
<table class="table table-bordered" style="width: 700px;">
	<tr class="table table-success">
		<th>No</th>
		<th>이름</th>
		<th>핸드폰 번호</th>
		<th>나이</th>
		<th>운전면허</th>
		<th>가입일자</th>
		<th>수정/삭제</th>
	</tr>

	<%
		for(int i=0;i<list.size();i++)
		{
			QuizDto dto=list.get(i);
			%>
		<tr>
			<td><%=i+1 %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getHp() %></td>
			<td><%=dto.getAge()%></td>	
			<td><%=dto.getDriver()!=null?"있음":"없음" %></td>
			<td><%=sdf.format(dto.getWriteday())%></td>
			<td>
				<button type="button" onclick="location.href='updateForm.jsp?no=<%=dto.getNo()%>'">수정</button>
				<button type="button" onclick="location.href='deleteQuiz.jsp?no=<%=dto.getNo()%>'">삭제</button>	
			</td>
		</tr>

			
		<%}
	
	%>
</table>

</div>

</body>
</html>