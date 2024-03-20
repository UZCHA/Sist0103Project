<%@page import="simpleboard.SimpleBoardDto"%>
<%@page import="simpleboard.SimpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Grandiflora+One&family=Gugi&family=Hahmlet:wght@100..900&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<%
String num=request.getParameter("num");
SimpleBoardDao dao=new SimpleBoardDao();
SimpleBoardDto dto=dao.getData(num);
%>
</head>
<body>
<div style="margin: 50px 100px; width: 450px;">
	<form action="updateaction.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">

	<b>게시글 수정</b>
		<table class="table table-bordered">
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" value="<%=dto.getWriter()%>">
				</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" required="required" value="<%=dto.getSubject()%>">
				</td>
			</tr>
			
			<!-- <tr>
				<th>비밀번호</th>
				<td>
					<input type="text" name="pass" required="required">
				</td>
			</tr> -->
			
			<tr>
				<td colspan="2" align="center">
					<textarea style="width: 420px; height: 100px;" name="content" ><%=dto.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">수정</button>
					<button type="button" onclick="location.href='boardlist.jsp'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>