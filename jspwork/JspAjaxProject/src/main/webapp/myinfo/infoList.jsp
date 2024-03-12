<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myinfo.db.MyinfoDto"%>
<%@page import="java.util.List"%>
<%@page import="myinfo.db.MyinfoDao"%>
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
<script type="text/javascript">
	function confirmDelete(num){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href='deleteInfo.jsp?num='+num;
		}
	}

</script>
<%
MyinfoDao dao=new MyinfoDao();
List<MyinfoDto> list=dao.getAllInfos();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<body>
<div style="margin: 50px 100px; width: 800px;">
	<button type="button" class="btn btn-outline-success" 
	onclick="location.href='insertForm.jsp'">데이터 추가</button>
	<hr>
	<table class="table table-bordered">
		<caption align="top"><b>개인정보 목록</b></caption>
		<tr class="table-warning">
			<th width="100">번호</th>
			<th width="150">이름</th>
			<th width="200">핸드폰</th>
			<th width="100">혈액형</th>
			<th width="180">생년월일</th>
			<th width="180">작성일</th>
			<th width="180">편집</th>
		</tr>
		<%
			for(int i=0;i<list.size();i++)
			{
				MyinfoDto dto=list.get(i);
				%>
				<tr>
					<td align="center"><%=i+1 %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getHp() %></td>
					<td><%=dto.getBlood() %>형</td>
					<td><%=dto.getBirth().substring(0,10) %></td>
					<td><%=sdf.format(dto.getWriteday()) %></td>
					<td>
						<input type="button" class="btn btn-outline-primary btn-sm"
						onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'" value="수정">
						<input type="button" class="btn btn-outline-danger btn-sm"
						onclick="confirmDelete('<%=dto.getNum()%>')" value="삭제">
					</td>
				</tr>
			<%}
		
		%>
	</table>
</div>
</body>
</html>