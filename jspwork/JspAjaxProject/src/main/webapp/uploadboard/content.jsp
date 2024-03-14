<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.data.UploadBoardDto"%>
<%@page import="uploadboard.data.UploadBoardDao"%>
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
<style type="text/css">
	div{
		font-family: 'Hi Melody';
		font-size: 1.5em;
		margin: 50px 50px;
		border: 1px solid gray;
	}

</style>
<%
String num=request.getParameter("num");
UploadBoardDao dao=new UploadBoardDao();
UploadBoardDto dto=dao.getData(num);
//조회수 증가
dao.updateReadCount(num);
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
</head>
<body>
<div>
	<table class="table table-condensed" style="width: 600px;">
		<tr>
			<td>
				<b><%=dto.getSubject() %></b>
			</td>		
		</tr>
		<tr>
			<td>
				<span>
				<%=dto.getWriter() %>
				</span>
			</td>
			<td><%=sdf.format(dto.getWriteday()) %></td>									
		</tr>	
		<tr>		
			<td>
				<%=dto.getContent().replace("\n", "<br>") %>
				<br><br>
				<a href="../save/<%=dto.getImgname()%>">
				<img alt="" src="../save/<%=dto.getImgname()%>"></a>
				<br>
				<b>조회:<%=dto.getReadcount() %></b>
			</td>
		</tr>
		
		<hr>
		<td colspan="2">
			<button type="button" onclick="location.href='addForm.jsp'">글쓰기</button>
			<button type="button" onclick="location.href='boardList.jsp'">목록</button>
			<button type="button" onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
			<button type="button" onclick="location.href='deleteForm.jsp?num=<%=dto.getNum()%>'">삭제</button>
		</td>
		</table>
		
</div>



</body>
</html>