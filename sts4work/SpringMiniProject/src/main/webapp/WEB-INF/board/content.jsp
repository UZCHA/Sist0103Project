<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	list();
	var loginok="${sessionScpoe.loginok}";
	var myid="${sessionScope.myid}";
	
	$("#btnansweradd").click(function(){
		var num=$("#num").val();
		var content=$("#content").val();
		//alert(num);
		if(content.trim().length==0){
			alert("댓글내용을 입력해주세요.");
			return;
		}
		$.ajax({
			type:"post",
			url:"/answer/insert",
			dataType:"html",
			data:{"num":num,"content":content},
			success:function(){
				list();
				$("#content").val('');
			}
			
		})
		
	});
	
	$(document).on("click","i.del",function(){
		
		var idx=$(this).attr("idx");
		//alert(idx);
		var a=confirm("삭제?");
		
		if(a){
			
			$.ajax({
				type:"get",
				url:"/answer/ansdelete",
				dataType:"html",
				data:{"idx":idx},
				success:function(){
					list();
				}
				
			})
		}	
	});
	
	$(document).on("click","i.edit",function(){
		idx=$(this).attr("idx");
		$.ajax({
			type:"get",
			url:"/answer/ansupdateform",
			data:{"idx":idx},
			dataType:"json",
			success:function(data){
				$("#updatename").text(data.myid);
				$("#updatecontent").val(data.content);
			}
			
		})
		
	});
	
	$("#btnupdateok").click(function(){
		var content=$("#updatecontent").val();
		//alert(content+","+idx);

		
		$.ajax({
			type:"post",
			data:{"content":content,"idx":idx},
			dataType:"html",
			url:"/answer/ansupdate",
			success:function(){
				list();
			}
		})
		
	});
	
	
	
	
	function list(){
		var num=$("#num").val();
		
		$.ajax({
			type:"get",
			url:"/answer/anslist",
			dataType:"json",
			data:{"num":num},
			success:function(res){
				var s = "";
                $.each(res, function(i, item) {
                    s += "<div>";
                    s += "<span><b>" + item.myid + "</b> : " + item.content + "</span>&nbsp;";
                    s+="<span style='color:gray;font-size:0.9em;'>("+item.writeday+")</span>";
                    if(loginok!=null && myid==item.myid){
                    	 s += "<i class='bi bi-trash2 del' idx='"+item.idx+"' style='font-size:0.8em'></i>"
                    	 s+="<i class='bi bi-pencil edit' idx='"+item.idx+"' style='font-size:0.8em' data-bs-toggle='modal' data-bs-target='#myAnsUpdateModal'></i>"
                    }
                    s+="</div>";
                });
                $(".alist").html(s);
                $(".acount").text(res.length);
			}
		});
	};
	
})

</script>
</head>
<body>

<div style="margin: 50px 100px">
	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td>
				<b>${dto.subject }</b>
				<span style="color: gray; float: right; font-size: 0.9em;">
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<span>작성자 : ${dto.name }(${dto.myid })</span>
				<span style="float: right;">
					<c:if test="${dto.uploadfile!='no'}">
						<a href='download?clip=${dto.uploadfile }'>
							<b><i class="bi bi-download">&nbsp;&nbsp;</i>${dto.uploadfile }</b>
						</a>
					</c:if>
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<c:if test="${bupload==true }">
					<h5>업로드된 파일 이미지입니다.</h5>
					<img alt="" src="../boardphoto/${dto.uploadfile }" style="width: 200px;">
				</c:if>
				<br>
				<pre>
					${dto.content }
				</pre>
				<span style="float: right;">조회 : ${dto.readcount }</span>
				<span>댓글 :<span class="acount"></span>개 </span> 
			</td>
		</tr>
		<tr>
			<td>
				<div class="alist">댓글목록</div>
				<input type="hidden" name="num" id="num" value="${dto.num }">
				<c:if test="${sessionScope.loginok!=null }">
					<div class="aform">
						<div class="d-inline-flex">
							<input type="text" class="form-control" style="width: 500px;"
							placeholder="댓글을 입력하세요." id="content">&nbsp;
							<button type="button" class="btn btn-info" style="width: 70px;"
							id="btnansweradd">등록</button>
						</div>
					</div>
				</c:if>
			</td>
		</tr>
		<tr>
			<td align="center">
				<c:if test="${sessionScope.loginok!=null }">
					<button type="button" onclick="location.href=''">글쓰기</button>
				</c:if>
					<button type="button" onclick="location.href='list'">목록</button>
				<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid}">
					<button type="button" onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
					<button type="button" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
				</c:if>
			</td>
		</tr>
	</table>
</div>

<!-- The Modal -->
<div class="modal" id="myAnsUpdateModal">
<input type="hidden" name="idx" id="updateIdx">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="d-inline-flex">
        	<label style="width: 80px;">ID:&nbsp;<span id="updatename"></span></label>
        </div>
        <br>
        <div class="d-inline-flex">
        	<label style="width: 80px;">내용: </label>&nbsp;&nbsp;
        	<input type="text" class="form-control" id="updatecontent">
        </div>

      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
        id="btnupdateok">수정</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>