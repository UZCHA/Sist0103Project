<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
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
	.bi-camera{
		color: tomato;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("i.camera").click(function(){
			$("#photo").trigger("click");
			
		})
		
	})
	
	function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('showimg').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('showimg').src = "";
	  }
	}
	
</script>
</head>
<%
	//num뿐만 아니라 currentPage도 같이 읽어야 함
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	GuestDao dao=new GuestDao();
	GuestDto dto=dao.getData(num);

%>
<body>
<!-- 이미지 미리보기 -->
<img id="showimg" style="position: absolute; left: 1000px; top: 100px; max-width: 200px;"
src="<%=(dto.getPhotoname()==null?"":"save/"+dto.getPhotoname())%>">

<div style="margin: 0 auto; width: 600px;">
	<form action="memberguest/updateaction.jsp" method="post" enctype="multipart/form-data">
		<!-- num과 페이징처리시에는 currentPage도 히든으로 넘겨야한다. -->
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="currentPage" value="<%=currentPage%>">
		<table class="table table-bordered">
			<caption align="top">
				<b>방명록 수정</b>&nbsp;
				<i class="bi bi-camera camera fs-3"></i>
				<input type="file" name="photo" id="photo" style="visibility: hidden;"
				onchange="readURL(this)">
			</caption>
			
			<tr>
				<td>
					<textarea style="width: 500px; height: 100px;"
					name="content" class="form-control" required="required"><%=dto.getContent() %></textarea>
				</td>
				<td>
					<button type="submit" class="btn btn-success" 
					style="width: 100px; height: 100px;">수정</button>
				</td>
			</tr>
		</table>
	</form>
</div>	
</body>
</html>