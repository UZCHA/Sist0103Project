<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
<script type="text/javascript">
	function confirmDelete(num){
		if(confirm("정말 강퇴하시겠습니까?")){
			location.href='member/memberdelete.jsp?num='+num;
		}
	}

</script>
</head>
<body>
<%
MemberDao dao=new MemberDao();
List<MemberDto> list=dao.getAllMemberd();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

%>
<div style="margin: 100px 100px; width:1000px;">
<h5 class="alert alert-light">총 <%=list.size() %>명의 회원이 있습니다.</h5>
	<table class="table table-bordered">
		<caption align="top"><b>전체 회원명단</b></caption>
			<tr class="table-light">
				<th width="80">번호</th>
				<th width="120">이름</th>
				<th width="100">ID</th>
				<th width="240">핸드폰</th>
				<th width="300">주소</th>
				<th width="200">이메일</th>
				<th width="180">가입일</th>
				<th width="120">비고</th>
			</tr>
			<%
				int no=1;
			for(MemberDto dto:list){%>
				<tr>
					<td><%=no++ %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getId() %></td>
					<td><%=dto.getHp() %></td>
					<td><%=dto.getAddr() %></td>
					<td><%=dto.getEmail() %></td>
					<td><%=sdf.format(dto.getGaipday()) %></td>
					<td>
						<button type="button" class="btn btn-danger btn-sm"
						onclick="confirmDelete('<%=dto.getNum()%>')">강퇴</button>
					</td>
				</tr>
			<%}
			%>
	</table>
</div>
</body>
</html>