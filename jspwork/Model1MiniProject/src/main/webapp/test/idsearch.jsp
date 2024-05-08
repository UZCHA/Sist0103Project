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
#idsearchbtn{
	background-color: #618E6E;
		color: white;
		border-radius: 5px;
		border:0px;
		height: 50px;
		margin-top: 40px;
}
table th{
	padding-top: 20px;
	font-size: 0.9em;
}
#result{
	
}

</style>
<script type="text/javascript">
$(function(){
	
	$("#idresult").hide();
	
	$("#idsearchbtn").click(function(){
		var name=$("#name").val();
		var hp2=$("#hp2").val();
		
		//alert(name+","+hp2);
	
		$.ajax({
			type:"post",
			url:"idsearchaction.jsp",
			dataType:"json",
			data:{"name":name,"hp2":hp2},
			success:function(res){
				//alert("성공");
				//alert(res.memid);
				$("#idsearch").hide();
				$("#idresult").show();
				if(res.memid==""){
					$("#result").html("일치하는 아이디가 없습니다.<br>이름과 핸드폰 번호 다시 확인바랍니다.");
					
				}else{
					$("#result").html("<b>"+name+"</b>"+"님의 아이디는"+"<b>"+res.memid+"</b>입니다.");
					
				}
			
			}
		})
		
	})
	
})
</script>

</head>
<body>
<div id="idsearch">
	<h3 style="margin-left:840px;margin-top:50px; width: 500px; color: green;font-weight: bold;">휴대폰 본인확인</h3>
<div style="width: 500px;  margin: 0 auto; margin-top: 50px; border: 1px solid gray; border-radius: 10px;">
	<form style="margin:50px;" action="#" method="post" >

		<table style="margin: 0 auto;">
			<tr>
				<th>이름</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="name" id="name" placeholder="이름을 입력해 주세요."
					style="width: 250px;height: 40px;">
				</td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="hp2" id="hp2" placeholder="핸드폰 번호를 입력해 주세요."
					style="width: 250px;height: 40px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</td>
			</tr>
		</table>
		<div align="center">
			<button type="button" id="idsearchbtn"style="width: 250px;height: 40px;">아이디 찾기</button><br>
			<span> <a>비밀번호 찾기</a></span>
		</div>
	</form>
</div>
</div>

<div id="idresult">
<h3 style="margin-left:840px;margin-top:50px; width: 500px; color: green;font-weight: bold;">아이디 확인</h3>
<div style="width: 500px;  margin: 0 auto; margin-top: 50px; border: 1px solid gray; border-radius: 10px;">
	<form style="margin:50px; padding-left: 20px;" action="#" method="post" >
		<span id="result"></span>
		<hr>
		<button type="button" onclick="location.href='loginform.jsp'">로그인</button>
	</form>
</div>
</div>
</body>
</html>