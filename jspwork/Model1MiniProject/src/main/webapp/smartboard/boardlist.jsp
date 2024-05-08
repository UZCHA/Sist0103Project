<%@page import="data.dao.SmartAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.SmartDao"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="java.util.List"%>
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
	a:hover{
		color: gray;
		text-decoration: underline;
	}
	.title{
		width:200px;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow:hidden;
		display: block;
	}
</style>
<script type="text/javascript">
	$(function(){
		//전체체크 클릭시 체크값 얻어서 모든 체크값에 전달
		$(".alldelcheck").click(function(){
			//전체 체크값을 얻는다(true/false)
			var chk= $(this).is(":checked");
			console.log(chk);
			
			//얻은 전체체크값을 글 앞에 있는 체크에 일괄 전달한다
			//chk의 true/false 속성을 checked라는 속성으로 전달한다는 것
			$(".alldel").prop("checked",chk);
			
		});
		
		//삭제버튼 클릭시 삭제
		//내가 삭제하려는게 몇개인지 알아야 한다.
		$("#btndel").click(function(){
			var len= $(".alldel:checked").length;
			//alert(len);
			if(len==0){
				alert("선택된 게시글이 없습니다.");
			}else{
				if(confirm(len+"개의 글을 삭제하시겠습니까?")){
					//체크된곳의 value값(num)얻기
					var n="";
					$(".alldel:checked").each(function(idx){
						n+=$(this).val()+",";
						
					})
					
					n=n.substring(0,n.length-1);
					console.log(n);
					//삭제파일로 전송
					location.href="smartboard/alldelete.jsp?nums="+n;
				}
			}
		});
		
	})
</script>
<%
SmartDao dao=new SmartDao();
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
List<SmartDto> list=dao.getList(startNum, perPage);
//List<SimpleBoardDto> list=dao.getAllDatas(); 이건 이제 주석처리

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

//댓글개수 표시
SmartAnswerDao adao=new SmartAnswerDao();
for(SmartDto dto:list){
	//댓글변수에 댓글 총 갯수 넣기
	int acount=adao.getAnswerList(dto.getNum()).size();
	dto.setAnswercount(acount);
}
%>
</head>
<body>
<div style="margin: 50px 100px;">
	
	<br><br>
	<div>
		<form>
			<table class="table table-bordered">
				<caption align="top">총 <%=totalCount %>개의 글이 있습니다.</caption>
				<tr  align="center">
					<th width="70">번호</th>
					<th width="250">제목</th>
					<th width="100">작성자</th>
					<th width="200">작성일</th>
					<th width="70">조회</th>
				</tr>
					<%
						if(totalCount==0){%>
							<tr>
								<td colspan="5" align="center"><b>등록된 게시글이 없습니다.</b></td>
							</tr>
						<%}else{
						for(SmartDto dto:list){%>
						<tr>
							<td align="center">
								<input type="checkbox" value="<%=dto.getNum()%>" class="alldel">&nbsp;&nbsp;
								<%=no-- %>
							</td>
							<td><a href='index.jsp?main=smartboard/contentview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'>
							<span class="title"> <%=dto.getSubject() %></span></a>
							<%
								if(dto.getAnswercount()>0){%>
									<a href='index.jsp?main=smartboard/contentview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'
									style="color: red;">[<%=dto.getAnswercount() %>]</a>
								<%}
							%>
							</td>
							<td align="center"><%=dto.getWriter()%></td>
							<td align="center"><%=sdf.format(dto.getWriteday()) %></td>
							<td align="center"><%=dto.getReadcount() %></td>
						</tr>	
						<%}%>
						<tr>
							<td colspan="5">
								<input type="checkbox" class="alldelcheck">전체선택
								<span style="float: right;">
									<button type="button" class="btn btn-danger btn-sm" id="btndel">
									<i class="bi bi-trash"></i>삭제</button>
									<button type="button" class="btn btn-info btn-sm" onclick="location.href='index.jsp?main=smartboard/smartform.jsp'">
									<i class="bi bi-pencil"></i>글쓰기</button>
								</span>
							</td>
						</tr>
			<%}%>
			</table>
			<!-- 페이지 번호 출력 -->
	<ul  class="pagination justify-content-center">
		<%
		//이전
		if(startPage>1){%>
			<li class="page-item">
				<a class="page-link" href="index.jsp?main=smartboard/boardlist.jsp?currentPage=<%=startPage-1%>"
				style="color: black;">이전</a>
			</li>
		<%}
		for(int pp=startPage;pp<=endPage;pp++){
			if(pp==currentPage)
			{%>
				<li class="page-item active">
					<a class="page-link" href="index.jsp?main=smartboard/boardlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
				</li>
			<%}else{%>
				<li class="page-item">
					<a class="page-link" href="index.jsp?main=smartboard/boardlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
				</li>
			<%}
		}
		//다음
		if(endPage<totalPage){%>
			<li class="page-item">
				<a class="page-link" href="index.jsp?main=smartboard/boardlist.jsp?currentPage=<%=endPage+1%>"
				style="color: black;">다음</a>
			</li>
		<%}
		
		%>
	
	</ul>
		</form>
	</div>
</div>
</body>
</html>