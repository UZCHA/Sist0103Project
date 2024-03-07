<%@page import="intro.model.IntroDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="intro.model.IntroDao"%>
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
IntroDao dao=new IntroDao();
ArrayList<IntroDto> list=dao.getAllIntro();

%>
<div style="margin: 30px 50px;">

<h3 style="width: 700px; margin-top: 20px;" >자기소개 목록</h3>
<hr>
<table class="table table-bordered" style="width:700px;">
	<tr >
		<th>No</th>
		<th>이름</th>
		<th>나이</th>
		<th>생년월일</th>
		<th >자세히 보기</th>
	</tr>
	<%
		if(list.size()==0){%>
			
			<tr>
				<td colspan="5" align="center">
					<h3>자기소개가 없습니다.</h3>
				</td>
			</tr>
			
		<%}else{
			for(int i=0;i<list.size();i++)
			{
				IntroDto dto=list.get(i);
				%>
				<tr align="center">
					<td ><%=i+1 %></td>
					<td ><%=dto.getName() %></td>
					<td ><%=dto.getAge() %></td>
					<td ><%=dto.getBirthday() %></td>
					<td ><button type="button" class="btn btn-outline-success"
					onclick="location.href='detailPage.jsp?num=<%=dto.getNum()%>'">자세히보기</button></td>
				</tr>
				
			<%}
		}
	
	%>
</table>
		<button type="button" class="btn btn-success" style="width: 100px;"
		onclick="location.href='addForm.jsp'">입력폼</button>
</div>
</body>
</html>