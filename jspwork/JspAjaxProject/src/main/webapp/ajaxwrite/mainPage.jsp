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
	div.board{
		position: absolute;
		left: 20%;
		top: 20%;
		font-family: 'Gugi';
		font-size: 1.2em;
	}
	
	div.list{
		width: 800px;
	}
	
	a{
		text-decoration: none;
		color: black;
		cursor: pointer;
	}
	span.day{
	float: right;
	color: #ccc;
	}
	span.likes{
	float: right;
	}
</style>
<script type="text/javascript">
	$(function(){
	
			list();
		$("div.addform").hide();
		$("div.updateform").hide();
		$("div.detailview").hide();
		$("div.list").show();
		
		$("#selimage").change(function(){
			var im=$(this).val();
			
			//이미지명을 현재값에 추가로 더하기			
			$("#image").val(im);
			
			//아래 imageview에 이미지가 보이게
			var s="<img src='"+im+"' width='50'>";
			$("#imgview").html(s);
		})
		
		$("#btninsert").click(function(){
			var writer=$("#writer").val();
			var subject=$("#subject").val();
			var story=$("#story").val();
			var image=$("#image").val();
			
			//var data=$("addfrm").serialize();
			//alert(data);
			
			$.ajax({
				type:"post",
				url:"insertWrite.jsp",
				dataType:"html",
				data:{"writer":writer,"subject":subject,"story":story,"image":image},
				success:function(){		
					//alert("입력성공");
					
					list();
					
					
					$("#writer").val("");
					$("#subject").val("");
					$("#story").val("");
					$("#image").val("");					
					$("#imgview").empty();
					
					$("div.addform").hide();
					$("div.list").show();
				}
				
			})
			
		});
		
		//글쓰기 버튼 누르면 addform이 나오고 list숨기고
		$(document).on("click",".addbtn",function(){
			$("div.list").hide();
			$("div.addform").show();
			$("div.detailview").hide();
			
		});
		
		//제목클릭시 이벤트 
		$(document).on("click",".detail",function(){
			var num=$(this).attr("num");
			//alert(num);
			
			$.ajax({
				type:"get",
				dataType:"json",
				url:"getDataWrite.jsp",
				data:{"num":num},
				success:function(data){
					//alert(data.writer);
					$("span.title").html(data.subject);
					$("span.day").html(data.writeday);
					$("span.writer").html(data.writer);
					$("div.story").html("<pre>"+data.story+"</pre>");
					$("div.image").html("<img src='"+data.image+"'>");
					$(".deletebtn").attr("num",data.num);
					
					//목록안보이게 
					$("div.list").hide();
					$("div.detailview").show();
					
					
				}
				
			})
			
			
		});
		//삭제버튼 클릭시
		$(".deletebtn").click(function(){
			var num=$(this).attr("num");
			//alert(num);
			$.ajax({
				type:"post",
				url:"deleteWrite.jsp",
				dataType:"html",
				data:{"num":num},
				success:function(){
					//alert("삭제성공");
					list();
					$("div.list").show();
					$("div.detailview").hide();
				}
				
			})
	
		
			
		});
		
		
	})
	//////////////////////
	function list(){
		
		$.ajax({
			type:"get",
			url:"listWrite.jsp",
			dataType:"json",
			success:function(res){
				//alert(res.length);
				var s="";
				s+="<table class='board table table-bordered'>";
				s+="<caption align='top'><button type='button' class='btn btn-info addbtn'>";
				s+="<i class='bi bi-pencil-fill'></i>글쓰기</button></caption>";
				s+="<tr align='center'>";
				s+="<td width='100'>번호</td>";
				s+="<td width='200'>제목</td>";
				s+="<td width='150'>작성자</td>";
				s+="<td width='200'>작성일</td>";
				s+="<td width='100'>추천</td>";
				s+="</tr>";
				
				var n=res.length;
				if(n==0){
					s+="<tr>";
					s+="<td colspan='5' align='center'>";
					s+="<b>게시된 글이 없습니다</b></td></tr>";
				}else{
					$.each(res,function(i,elt){
						//출력
						s+="<tr>";
						s+="<td align='center'>"+(i+1)+"</td>";
						s+="<td><a num='"+elt.num+"' class='detail'>"+elt.subject+"</a></td>";
						s+="<td align='center'>"+elt.writer+"</td>";
						s+="<td align='center'>"+elt.writeday+"</td>";
						s+="<td align='center'>"+elt.likes+"</td>";
						s+="</tr>";
									
					})
				}
				s+="</table>";
				$("div.list").html(s);
				
				
			}
			
			
		})
		
		
	};
	
</script>
</head>
<body>
<!-- 추가폼  -->
<div class="board addform" style="margin: 50px 100px; width: 400px;">
	<form id="addfrm">
		<table class="table table-bordered">
			<caption align="top"><b>글쓰기</b></caption>
			<tr>
				<th width="100" class="table-warning">작성자</th>
				<td>
					<input type="text" name="writer" id="writer" class="form-control"
					required="required" style="width: 130px;">
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-warning">제목</th>
				<td>
					<input type="text" name="subject" id="subject" class="form-control"
					required="required" style="width: 130px;">
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-warning">내용</th>
				<td>
					<textarea style="width: 300px; height: 100px;"
					name="story" id="story" required="required" class="form-control"></textarea>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-warning">이미지</th>
				<td>
					<input type="hidden" name="image" id="image" width="100%">
					<select id="selimage" style="width: 100px" class="form-control">
						<option value="../image/avata/b1.png">사랑해</option>
						<option value="../image/avata/b2.png">우울해</option>
						<option value="../image/avata/b3.png">배고파</option>
						<option value="../image/avata/b6.png">좌절해</option>
						<option value="../image/avata/b5.png">생축해</option>
						<option value="../image/avata/b8.png">최고야</option>
					</select><br>
					<div id="imgview"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="btn btn-danger" id="btninsert">DB추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<div class="board updateform">
	수정폼
</div>

<div class="board list">
	목록
</div>

<div class="board detailview">
	<table class="story table table-bordered" style="width: 600px;">
		<caption align="top"><b>게시글 확인</b></caption>
		<tr>
			<td>
				<span class="title">제목</span>
				<span class="day">작성일</span>
			</td>
		</tr>
		<tr>
			<td>
				<span class="writer">작성자</span>
				<span class="likes">
					<i class="bi bi-emoji-kiss"></i>
					<span class="su">0</span>
				</span>
			</td>
		</tr>
		<tr>
			<td style="height: 200px;" valign="top">
				<div class="story">내용</div>
				<div class="image">이미지</div>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" class="btn btn-outline-dark btn-sm"
				onclick="location.href='mainPage.jsp'">목록</button>
				<button type="button" class="addbtn btn btn-outline-success btn-sm"
				>글쓰기</button>
					<button type="button" class="updatebtn btn btn-outline-warning btn-sm"
				>수정</button>
					<button type="button" class="deletebtn btn btn-outline-danger btn-sm"
				>삭제</button>
			</td>
		</tr>
	</table>
</div>


</body>
</html>