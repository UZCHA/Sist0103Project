<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.SimpleBoardDto"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
a{
text-decoration: none;
color: black;
}
body{
font-family: 'Sunflower';
}

</style>
</head>
<body>
<%
SimpleBoardDao dao=new SimpleBoardDao();
//전체갯수 
int totalCount=dao.getTotalCount();

int perPage=3; //한페이지당 보여질 글의 갯수
int perBlock=5; //한블럭당 보여질 페이지 갯수
int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0번,oracle은 1번)
int startPage; //각 블럭에서 보여질 시작페이지
int endPage; //각 블럭당 보여질 끝 페이지
int currentPage; //현재 페이지
int totalPage; //총 페이지 수

int no; //currentPage당 출력할 시작번호

//현재 페이지를 읽는데 단, null일 경우는 1페이지로 준다.
if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
//총 페이지수 구하기
//총글갯수를 한페이지당 보여질 갯수로 나눔(7/5=1)
//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요하다는 뜻)
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

//각 블럭당 보여질 시작페이지
//perBlock=5 일 경우 현재페이지가 1~5일 경우 시작페이지가1, 끝 페이지가 5
//현재가 13일 경우 시작페이지:11 끝페이지:15
startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

//예를 들어 총 페이지가 23일 경우 마지막블럭은 끝페이지가 25가 아니라 23이 된다.
if(endPage>totalPage)
	endPage=totalPage;

//각 페이지에서 보여질 시작 번호
//1페이지:0, 2페이지:5 3페이지:10...
startNum=(currentPage-1)*perPage;

//각 페이지당 출력할 시작번호 구하기
//예) 총 글갯수가 23일때 내림차순에서 시작번호는 1페이지:23, 2페이지:18, 3페이지:13..
no=totalCount-(currentPage-1)*perPage;

//페이지에서 보여질 글만 가져오기
List<SimpleBoardDto> list=dao.getPagingList(startNum, perPage);

//List<SimpleBoardDto> list=dao.getAllDatas();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
//int count=list.size();
%>
</body>
<div style="margin: 50px 100px; width: 800px;">
	<button class="btn btn-outline-info btn-sm" onclick="location.href='addform.jsp'"
	style="margin-left: 720px;">
	<i class="bi bi-pencil-fill"></i>글쓰기</button>
	<h6><b>총 <%=totalCount %>개의 글이 있습니다.</b></h6>
	<table class="table table-bordered">
		<caption align="top"><b>간단목록게시판</b></caption>
		<tr class="table-light" align="center">
			<th width="80">번호</th>
			<th width="300">제목</th>
			<th width="100">작성자</th>
			<th width="150">작성일</th>
			<th width="80">조회</th>
		</tr>
		<%
		if(totalCount==0){%>
				<tr>
					<td colspan="5" align="center">
						<h6><b>등록된 게시물이 없습니다.</b></h6>
					</td>
				</tr>
		<%}else{
			for(int i=0;i<list.size();i++){
				SimpleBoardDto dto=list.get(i);
				%>
				<tr>
					<td align="center"><%=no--%></td>
					<td>
						<a href="contentview.jsp?num=<%=dto.getNum()%>">
						<%=dto.getSubject() %></a>				
					</td>
					<td align="center"><%=dto.getWriter() %></td>
					<td align="center"><%= sdf.format(dto.getWriteday())%></td>
					<td align="center"><%=dto.getReadcount() %></td>
				</tr>
				
			<%}
		}
		
		%>
	</table>
	<!-- 페이지 번호 출력 -->
	<ul  class="pagination justify-content-center">
		<%
		//이전
		if(startPage>1){%>
			<li class="page-item">
				<a class="page-link" href="boardlist.jsp?currentPage=<%=startPage-1%>"
				style="color: black;">이전</a>
			</li>
		<%}
		for(int pp=startPage;pp<=endPage;pp++){
			if(pp==currentPage)
			{%>
				<li class="page-item active">
					<a class="page-link" href="boardlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
				</li>
			<%}else{%>
				<li class="page-item">
					<a class="page-link" href="boardlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
				</li>
			<%}
		}
		//다음
		if(endPage<totalPage){%>
			<li class="page-item">
				<a class="page-link" href="boardlist.jsp?currentPage=<%=endPage+1%>"
				style="color: black;">다음</a>
			</li>
		<%}
		
		%>
	
	</ul>
	
</div>
</html>