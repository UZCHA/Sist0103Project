<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
	
	span{
	float: right;
	}
	table{
	margin: 50px 50px;
	font-family: 'Hi Melody';
	}

</style>
</head>

<body>
<%
UploadBoardDao dao=new UploadBoardDao();
List<UploadBoardDto> list=dao.getAllDatas();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<div>
	<table class="table table-bordered">
<%
 for(int i=0;i<list.size();i++)
 {
	 UploadBoardDto dto=list.get(i);
 	%>	
 <%if(i%4==0){
 %>
	<tr> 
 <%}%>
 	<td>
 		<img src='../save/<%=dto.getImgname()%>' style="width: 130px; height: 140px;">
 		<br><%=dto.getSubject() %>
 		<br><%=dto.getWriter() %><br>
 		<%=sdf.format(dto.getWriteday()) %>
 		<span>조회:<%=dto.getReadcount() %></span>
 	</td>
 	<%if((i+1)%4==0||i==list.size()-1){%>
 	</tr>
 	<%}%>
<%}

%>
	<tr>
		<td colspan="4">
			<button onclick="location.href='boardList.jsp'">목록</button>
		</td>
	</tr>
	</table>
</div>
</body>
</html>