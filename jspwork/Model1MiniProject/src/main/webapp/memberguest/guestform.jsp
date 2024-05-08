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
<body>
<!-- 이미지 미리보기 -->
<img id="showimg" style="position: absolute; left: 1100px; top: 80px; max-width: 200px;">

<div style="margin: 0 auto; width: 600px;">
	<form action="memberguest/guestaction.jsp" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
			<caption align="top">
				<b>방명록 등록</b>&nbsp;
				<i class="bi bi-camera camera fs-3"></i>
				<input type="file" name="photo" id="photo" style="visibility: hidden;"
				onchange="readURL(this)">
			</caption>
			
			<tr>
				<td>
					<textarea style="width: 500px; height: 100px;"
					name="content" class="form-control" required="required"></textarea>
				</td>
				<td>
					<button type="submit" class="btn btn-info" 
					style="width: 100px; height: 100px;">등록</button>
				</td>
			</tr>
		</table>
	</form>
</div>	
</body>
</html>