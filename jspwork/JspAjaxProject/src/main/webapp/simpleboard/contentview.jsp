<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.SimpleBoardDao"%>
<%@page import="simpleboard.SimpleBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Grandiflora+One&family=Gugi&family=Hahmlet:wght@100..900&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
body{
	font-family: 'Sunflower';
	margin: 30px 50px;
}
</style>
</head>
<body>
<%
String num=request.getParameter("num");
SimpleBoardDao dao=new SimpleBoardDao();
SimpleBoardDto dto=dao.getData(num);
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:ss");
dao.updateReadCount(num);
%>
</body>
<div>
<input type="hidden" name="num" value="<%=num%>">
	<table class="table table-bordered" style="width: 600px;">
		<caption align="top"><b>COTENT VIEW</b></caption>
		<tr>
			<th width="100">제목</th>
			<td colspan="3"><%=dto.getSubject() %></td>
		</tr>
		<tr>
			<th width="100">작성자</th>
			<td><%=dto.getWriter() %></td>
			<th width="100">작성일</th>
			<td width="200"><%=dto.getWriteday() %></td>
		</tr>
		<tr>
			<td colspan="4">
				<pre style="height: 600px;"><%=dto.getContent() %></pre>
				<span style="align:left">조회:<%=dto.getReadcount()%></span>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button" onclick="location.href='addform.jsp'"><i class="bi bi-pencil"></i>글쓰기</button>
				<button type="button" onclick="location.href='boardlist.jsp'"><i class="bi bi-list-check"></i>목록</button>
				<button type="button" 
				onclick="location.href='updatepassform.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-pencil-square"></i>수정</button>
				<button type="button" 
				onclick="location.href='deletepassform.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-trash3"></i>삭제</button>
			</td>
		</tr>
	</table>
</div>
</html>