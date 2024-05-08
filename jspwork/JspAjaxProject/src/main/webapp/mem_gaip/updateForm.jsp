<%@page import="mem_gaip.model.MemgaipDto"%>
<%@page import="mem_gaip.model.MemgaipDao"%>
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
<style type="text/css">
	#preshow{
	position: absolute;
		left: 650px;
		top: 100px;
	}
</style>
<script type="text/javascript">
function openId(){
	window.open("idSearch.jsp","idcheck","left=300px,top=100px, width=400px, height=300px")
	
}
$(function(){
	$("#btnupdate").click(function(){
		if(mfrm.m_id.value.length==0){
			alert("아이디 입력버튼을 눌러주세요");
			return false; //form의 action호출 안되게 하는 것!
			//단순히 return으로 입력해도 됨.
		}
		
	})
	
	
});
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preshow').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preshow').src = "";
	  }
	}
<%
String m_num=request.getParameter("m_num");
MemgaipDao dao=new MemgaipDao();
MemgaipDto dto=dao.getData(m_num);
%>

</script>
</head>
<body>
<div style="margin: 50px 100px; width: 500px;">
	<form action="updateAction.jsp" method="post" enctype="multipart/form-data"
	name="mfrm">
	<input type="hidden" name="m_num" value="<%=m_num%>">
		<table class="table table-bordered">
			<caption align="top"><b>회원정보 수정</b></caption>
			<tr>
				<td width="120" class="table-warning" >아이디</td>
				<td >
				<div class="d-inline-flex">
					<input type="text" class="form-control" style="width: 120px;"
					name="m_id" required="required" readonly="readonly" value="<%=dto.getM_id()%>">
					<!-- <button type="button" class="btn btn-danger btn-sm" 
					style="margin-left:40px;" onclick="openId()">아이디 입력</button> -->
				</div>
				</td>
			</tr>
			
			<!--  <tr>
				<td width="120" class="table-warning">비밀번호</td>
				<td>
					<input type="password" class="form-control"
					style="width: 120px;" name="m_pass" required="required" value="<%=dto.getM_pass()%>">
				</td>
			</tr>-->
			
			<tr>
				<td width="120" class="table-warning">회원명</td>
				<td>
					<input type="text" class="form-control"
					style="width: 120px;" name="m_name" required="required" value="<%=dto.getM_name()%>">
				</td>
			</tr>
			
			<tr>
				<td width="120" class="table-warning">사진</td>
				<td>
					<input type="file" class="form-control"
					style="width: 200px;" name="m_photo" onchange="readURL(this)">
				</td>
			</tr>
			
			<tr>
				<td width="120" class="table-warning">핸드폰</td>
				<td>
					<input type="text" class="form-control"
					style="width: 180px;" name="m_hp" required="required" value="<%=dto.getM_hp()%>">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-dark" id="btnupdate">수정</button>
					<button type="button" class="btn btn-outline-success" 
					onclick="location.href='mem_List.jsp'" >목록</button>
				</td>
			</tr>
			
		</table>
	</form>
	<img alt="" src="<%=dto.getM_photo()%>" id="preshow">
</div>
</body>
</html>