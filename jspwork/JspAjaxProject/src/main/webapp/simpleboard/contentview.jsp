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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
table{
	font-family: 'Sunflower';
	margin: 30px 50px;
	
}
pre{
	font-family:'Sunflower';
	font-size: 1.3em;
}
button {
	width: 80px;
}
span.aday{
	float: right;;
	font-size: 0.8em;
	color: #ccc;
}
i.amod{
	float: right;
	color: green;
	margin-left: 10px;
	margin-right: 10px;
}
 i.adel{
 	float: right;
 	color: red;
 }
</style>
<script type="text/javascript">
	$(function(){
		
		list();
		$("div.aupdateform").hide();
		
		//ajax insert
		var num=$("#num").val();
		//alert(num);
		$("#btnsend").click(function(){
			var nickname=$("#nickname").val().trim();
			var content=$("#content").val().trim();
			
			if(nickname=='')
				{
					alert("닉네임을 입력후 저장해주세요");
					return;
				}
			if(content=='')
			{
				alert("댓글내용을 입력후 저장해주세요");
				return;
			}
			
			$.ajax({
				type:"post",
				url:"../simpleboardanswer/insertAnswer.jsp",
				dataType:"html",
				data:{"num":num,"nickname":nickname,"content":content},
				success:function(){
					//alert("성공");
					list();
					$("#nickname").val("");
					$("#content").val("");
					
				}
			
				
			});
		});
		
			//삭제
		$(document).on("click",".adel",function(){
			var idx=$(this).attr("idx");
			//alert(idx);
			
			var ans=confirm("댓글을 삭제하려면 [확인]을 눌러주세요");
			
			if(ans){
					$.ajax({
					
						type:"post",
						url:"../simpleboardanswer/deleteAnswer.jsp",
						dataType:"html",
						data:{"idx":idx},
						success:function(){
							//alert("삭제성공");
							list();
							alert("삭제되었습니다");
						
						}
						
					})
			}
			
		});
		
		//수정
		$(document).on("click",".amod",function(){
			var idx=$(this).attr("idx");
			$("#idx").val(idx);
			//alert(idx);
			
			$("div.aform").hide();
			$("div.aupdateform").show();
			
			$.ajax({
				type:"get",
				url:"../simpleboardanswer/oneDataAnswer.jsp",
				dataType:"json",
				data:{"idx":idx},
				success:function(data){
					//alert("수정성공");
					$("#idx").val(idx);
					$("#unickname").val(data.nick);
					$("#ucontent").val(data.content);
					
				}
				
			})
			
		});
		$("#btnusend").click(function(){
			var idx=$("#idx").val();
			var nick=$("#unickname").val().trim();
			var content=$("#ucontent").val().trim();
			//alert(idx+","+nick+","+content);
			
			$.ajax({
				type:"get",
				url:"../simpleboardanswer/updateAnswer.jsp",
				dataType:"html",
				data:{"idx":idx,"nickname":nick,"content":content},
				success:function(){
					//alert("수정성공22");
					list();
					$("div.aupdateform").hide();
					$("div.aform").show();
				}
				
			})
			
		});
		
		
	})
	
	//////////////////////////////
	function list(){
		
		console.log("list num="+$("#num").val());
		
		$.ajax({
			type:"get",
			url:"../simpleboardanswer/listAnswer.jsp",
			dataType:"json",
			data:{"num":$("#num").val()},
			success:function(res){
				
				//댓글갯수 먼저 출력해보자
				$("b.acount>span").text(res.length);
				var s="";
				$.each(res,function(idx,item){
					
					s+="<div><span>"+item.nickname+" : "+item.content+"</span>";
					s+="<span class='aday'>"+item.writeday+"</span>";
					s+="<i class='bi bi-pencil-square amod' idx="+item.idx+" ></i>";
					s+="<i class='bi bi-trash3 adel' idx="+item.idx+"></i>";
					s+="<br>";
					s+="</div>";
					
				});
				
				$("div.alist").html(s);
			}
			
		})
		
	};
	
</script>
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
<input type="hidden" id="num" name="num" value="<%=num%>">
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
				<pre><%=dto.getContent() %></pre>
				<span style="align:left">조회:<%=dto.getReadcount()%></span>
			</td>
		</tr>
		
		<!-- 댓글 -->
		<tr>
			<td colspan="4">
				<b class="acount">댓글<span>0</span></b>
				<div class="alist" id="alist">
					댓글목록
				</div>
				<!-- 댓글 입력폼 -->
				<div class="aform input-group">
					<input type="text" id="nickname" class="form-control"
					style=" width: 80px;" placeholder="닉네임">
					<input type="text" id="content" class="form-control"
					style=" width: 300px; margin-left: 10px" placeholder="댓글메세지">
					
					<button type="button" id="btnsend" class="btn btn-outline-info btn-sm"
					style="margin-left: 10px;">저장</button>
				</div>
				
				<!-- 댓글 수정폼 -->
				<div class="aupdateform input-group">
				<input type="hidden" id="idx">
					<input type="text" id="unickname" class="form-control"
					style=" width: 80px;" placeholder="닉네임">
					<input type="text" id="ucontent" class="form-control"
					style=" width: 300px; margin-left: 10px" placeholder="댓글메세지">
					
					<button type="button" id="btnusend" class="btn btn-outline-success btn-sm"
					style="margin-left: 10px;">수정</button>
				</div>
			</td>
		</tr>
		
		<tr>
			<td colspan="4" align="center">
				<button type="button" onclick="location.href='boardlist.jsp'"><i class="bi bi-list-check"></i>목록</button>
				<button type="button" onclick="location.href='addform.jsp'"><i class="bi bi-pencil"></i>글쓰기</button>
				<button type="button" 
				onclick="location.href='updatepassform.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-pencil-square"></i>수정</button>
				<button type="button" 
				onclick="location.href='deletepassform.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-trash3"></i>삭제</button>
			</td>
		</tr>
	</table>
</div>
</html>