<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mem_gaip.model.MemgaipDto"%>
<%@page import="java.util.List"%>
<%@page import="mem_gaip.model.MemgaipDao"%>
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
img{
	width: 50px;
	height:50px;
	border: 1px solid gray;
}

</style>

</head>
<%
MemgaipDao dao=new MemgaipDao();
List<MemgaipDto> list=dao.getAllDatas();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

%>
<body>
<div style="margin: 50px 100px; width: 800px;">
	<b>총 <%=list.size() %>명의 회원이 가입되었습니다.</b>
	<button type="button" class="btn btn-warning" 
	onclick="location.href='addForm.jsp'" style="float: right">회원가입</button>
	<table class="table table-bordered">
		<caption align="top"><b>[전체 회원 명단]</b></caption>
		
		<tr align="center">
			<th>번호</th>
			<th>아이디</th>
			<th>회원명</th>
			<th>핸드폰</th>
			<th>가입일</th>
			<th>편집</th>
		</tr>
		<%
		int i=1;
			for(MemgaipDto dto:list){
				
				%>
				<tr >
					<td align="center" valign="middle"><%=i++ %></td>
					<td align="center" valign="middle"><%=dto.getM_id() %></td>
					<td valign="middle">
						<img alt="" src="<%=dto.getM_photo()%>" class="rounded-circle">
					
						<%=dto.getM_name() %>
					</td>
					<td align="center" valign="middle"><%=dto.getM_hp() %></td>
					<td align="center" valign="middle"><%=sdf.format(dto.getGaipday()) %></td>
					<td align="center" valign="middle">
						<button type="button" class="btn btn-success btn-sm"
						onclick="location.href='updatepassForm.jsp?m_num=<%=dto.getM_num()%>'">수정</button>
						<button type="button" class="btn btn-danger btn-sm"
						onclick="location.href='deletepassForm.jsp?m_num=<%=dto.getM_num()%>'">삭제</button>
					</td>
				</tr>
		<%}
		
		%>
		
	</table>

</div>
</body>
</html>