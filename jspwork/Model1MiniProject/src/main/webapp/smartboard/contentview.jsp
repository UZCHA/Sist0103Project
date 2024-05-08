<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	span.aday{
		float: right;
		font-size: 0.8em;
		color: gray;
	}
	div.alist{
		font-size: 0.8em;
		color: gray;
		margin-left: 20px;
	}
	span.icon{
		margin-left: 20px;

	}
</style>
<script type="text/javascript">
	function funcdel(num,currentPage){
		alert(num+","+currentPage);
		if(confirm("삭제하시겠습니까?"))
		location.href="smartboard/delete.jsp?num="+num+"&currentPage="+currentPage;
	}
	
	$(function(){
		
		//처음 시작시 댓글 호출
		list();
		
		$("#btnsend").click(function(){
			var num=$("#num").val();
			var nickname=$("#nickname").val().trim();
			var content=$("#content").val().trim();
			
			if(nickname.length==0){
				alert("닉네임 입력후 저장해주세요")
				return;
			}
			if(content.length==0){
				alert("댓글 입력후 저장해주세요");
				return;
			}
			//alert(num);
			
			$.ajax({
				type:"post",
				url:"smartanswer/insertanswer.jsp",
				dataType:"html",
				data:{"num":num,"nickname":nickname,"content":content},
				success:function(){
					//alert("댓글입력성공");
					
					//초기화
					$("#nickname").val("");
					$("#content").val("");
					//댓글 추가하고 댓글목록 다시 출력
					list();
				}
				
			})
			
		});
		//댓글삭제
		$(document).on("click",".adel",function(){
			
			var idx=$(this).attr("idx");
			var yes=confirm("댓글을 삭제하시겠습니까?");
			
			if(yes){
				$.ajax({
					type:"get",
					url:"smartanswer/deleteanswer.jsp",
					dataType:"html",
					data:{"idx":idx},
					success:function(){
						swal("삭제성공", "삭제가 완료되었습니다.", "success");
						list();
					}
					
				})
			}
		
		});
		
		$(document).on("click",".aup",function(){
			var idx=$(this).attr("idx");
			
			$("#myModal").modal("show");
			
			$.ajax({
				type:"get",
				url:"smartanswer/jsonupdateform.jsp",
				dataType:"json",
				data:{"idx":idx},
				success:function(res){
					//alert("댓글수정");
					$("#idx").val(idx);
					$("#unickname").val(res.nick);
					$("#ucontent").val(res.content);
				}
				
			})
			
		});
		$("#btnupdate").click(function(){
			var idx=$("#idx").val();
			var nickname=$("#unickname").val();
			var content=$("#ucontent").val();
			
			$.ajax({
				type:"post",
				url:"smartanswer/updateanswer.jsp",
				dataType:"html",
				data:{"idx":idx,"nickname":nickname,"content":content},
				success:function(){
					//alert("수정성공22");
					list();
				}
			
			})
			
		})
		
	});
	
	function list(){
		
	var num=$("#num").val();
	console.log("list num="+$("#num").val());
	
		$.ajax({
			type:"get",
			url:"smartanswer/listanswer.jsp",
			dataType:"json",
			data:{"num":num},
			success:function(res){
				//alert(res.length);
				//댓글 개수 출력
				$("b.acount>span").text(res.length);
				var s="";
				$.each(res,function(idx,item){
					s+="<div>"+item.nick+" : "+item.content;
					s+="<span class='aday'>"+item.writeday+"</span>";
					s+="<span class='icon'><i class='bi bi-pencil aup' idx="+item.idx+"></i>&nbsp;&nbsp;&nbsp;";
					s+="<i class='bi bi-trash-fill adel' idx="+item.idx+" ></i></span>";
					s+="</div>";
				})
				
				$("div.alist").html(s);
			}
			
		})
		
	}
</script>
</head>
<body>
<%
//상세페이지 만들어볼것/ 조회수증가/ 아래에 목록,글쓰기,수정,삭제 버튼 만들기
String num=request.getParameter("num");
String currentPage=request.getParameter("currentPage");
SmartDao dao=new SmartDao();
SmartDto dto=dao.getData(num);
dao.updateReadcount(num);
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<div style="margin: 50px 100px; width: 500px;">
<input type="hidden" name="num" id="num" value="<%=num%>">
	<h4><%=dto.getSubject() %> <span style="float: right;">조회:<%=dto.getReadcount() %></span></h4>
	
	<hr>
	<table class="table table-bordered">
		<tr>
			<td>작성자: <%=dto.getWriter() %></td>
			<td><%=sdf.format(dto.getWriteday())%></td>
		</tr>
		<tr height="150">
			<td colspan="2">
				<pre><%=dto.getContent() %></pre>
			</td>
		</tr>
		<!-- 댓글 -->
		<tr>
			<td colspan="2">
				<b class="acount">댓글<span>0</span></b>
				<div class="alist">
					댓글목록
				</div>
				<div class="aform d-inline-flex">
					<input type="text" id="nickname" class="form-control" style="width: 100px;"
					placeholder="닉네임">
					<input type="text" id="content" class="form-control" style="width: 300px;"
					placeholder="댓글메세지">
					<button type="button" id="btnsend" class="btn btn-info">저장</button>
				</div>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="button" 
				onclick="location.href='index.jsp?main=smartboard/boardlist.jsp?currentPage=<%=currentPage%>'">목록</button>
				<button type="button" 
				onclick="location.href='index.jsp?main=smartboard/smartform.jsp'">글쓰기</button>
				<button type="button" 
				onclick="location.href='index.jsp?main=smartboard/updateform.jsp?num=<%=num%>&currentPage=<%=currentPage%>'">수정</button>
				<button type="button" 
				onclick="funcdel(<%=num%>,<%=currentPage%>)">삭제</button>
			</td>
		</tr>
	</table>
</div>

<!-- The Modal -->
<div class="modal" id="myModal">

  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<input type="hidden" id="idx">
        <input type="text" id="unickname" style="width: 100px;">
        <input type="text" id="ucontent" style="width: 200px; ">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal"
        id="btnupdate">수정</button>
      </div>

    </div>
  </div>
</div>

</body>
</html>