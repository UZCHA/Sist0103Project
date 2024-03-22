<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Grandiflora+One&family=Gugi&family=Hahmlet:wght@100..900&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
 i.bi-trash{
 	color: red;
 }
 i.bi-pencil-square{
 	color: green;
 }

</style>
</head>
<body>
<%
	//로그인상태 확인
String loginok=(String)session.getAttribute("loginok");

GuestDao dao=new GuestDao();
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
List<GuestDto> list=dao.getList(startNum, perPage);
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

MemberDao adao=new MemberDao();


%>

<%
	if(loginok!=null){%>
		<jsp:include page="guestform.jsp"/>
		<hr width="700" align="center" style="margin-left: 280px; margin-top: 50px;">
		
	<%}
%>
<div style="margin:20px 300px;">
<h6><b>총<%=totalCount %>개의 글이 있습니다. </b></h6>
<%
if(totalCount==0){%>
	<div>
		<h4><b>등록된 방명록이 없습니다.</b></h4>
	</div>
<%}
else{
	

for(int i=0;i<list.size();i++){
	GuestDto dto=list.get(i);
	String name=adao.getName(dto.getMyid());
	String photo=dto.getPhotoname();
	%>
	<div style="width: 630px; margin: 0 auto;" >
	<table class="table table-bordered" style="width: 630px; min-height: 200px;">
	<a style="float: right; margin-left: 10px;"><i class="bi bi-trash fs-5"></i></a>
	<a style="float: right;"><i class="bi bi-pencil-square fs-5"></i></a>
		<tr>
			<td style="width:450px; font-size: 12pt;" >작성자: <%=name%>(<%=dto.getMyid()%>)</td>
			<td align="right" style="color: #ccc; font-size: 12pt;"><%=sdf.format(dto.getWriteday()) %></td>
			
		</tr>
		<tr>
			<td>
				<pre style="font-family:'Sunflower' "><%=dto.getContent() %></pre>
			</td>
			<td align="center" style="vertical-align: middle;">
			<%
				if(photo==null){%>
					<span class="noimg">X</span>
				<%}else{%>
								
				<img alt="" src="save/<%=dto.getPhotoname()%>" style="width: 100px; max-height: 200px;">
				<%}
				%>
			</td>
		</tr>
	</table>
	</div>
<%}
}
%>
<ul  class="pagination justify-content-center">
		<%
		//이전
		if(startPage>1){%>
			<li class="page-item">
				<a class="page-link" href="index.jsp?main=memberguest/guestlist.jsp?currentPage=<%=startPage-1%>"
				style="color: black;">이전</a>
			</li>
		<%}
		for(int pp=startPage;pp<=endPage;pp++){
			if(pp==currentPage)
			{%>
				<li class="page-item active">
					<a class="page-link" href="index.jsp?main=memberguest/guestlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
				</li>
			<%}else{%>
				<li class="page-item">
					<a class="page-link" href="index.jsp?main=memberguest/guestlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
				</li>
			<%}
		}
		//다음
		if(endPage<totalPage){%>
			<li class="page-item">
				<a class="page-link" href="index.jsp?main=memberguest/guestlist.jsp?currentPage=<%=endPage+1%>"
				style="color: black;">다음</a>
			</li>
		<%}
		
		%>
	
	</ul>


</div>
</body>
</html>