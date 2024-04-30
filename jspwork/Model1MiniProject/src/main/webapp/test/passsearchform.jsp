<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Grandiflora+One&family=Gugi&family=Hahmlet:wght@100..900&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#passsearchbtn{
		background-color: #618E6E;
		color: white;
		border-radius: 5px;
		border:0px;
		height: 30px;
		margin-top: 40px;
}
	table th{
	padding-top: 20px;
	font-size: 0.9em;
}
	input {
		width:300px;
		height: 50px;
		border-radius:10px;
		border: 1px solid gray;
}
	div{
		font-family: 'Nanum Gothic';
	}
</style>
<script type="text/javascript">
$(function(){
	
	$("#passresult").hide();
	
	$("#passsearchbtn").click(function(){

			
			var name=$("#m_name").val();
			var hp2=$("#m_hp2").val();
			var id=$("#m_id").val();
			
			//alert(name+","+hp2+","+id);

			$.ajax({
				type:"post",
				url:"passaction.jsp",
				dataType:"json",
				data:{"name":name,"hp2":hp2,"id":id},
				success:function(res){
					//alert("비밀번호 찾기 성공");
					$("#passsearch").hide();
					$("#passresult").show();
					if(res.mempass==""){
						$("#result").html("일치하는 회원정보가 없습니다.<br>입력하신 정보를 다시 확인바랍니다.");
						
					}else{
						$("#result").html("<b>"+name+"</b>"+"님의 비밀번호는"+"<b>"+res.mempass+"</b>입니다.");
						
					}
				}
				
			})
			
		
	});
	
})
</script>
</head>
<body>
	
<div style="width: 500px;  margin: 0 auto; border: 1px solid #ccc; border-radius: 10px;"
id="passsearch">
<h3 style="margin-top:50px; width: 500px; text-align: center; ">비밀번호 찾기</h3>
	<form style="margin:50px;" action="#" method="post" >

		<table style="margin: 0 auto;">
			<tr>
				<th>아이디</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="m_id" id="m_id" placeholder="아이디를 입력해 주세요.">
				</td>
			</tr>
			<tr>
				<th>이름</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="m_name" id="m_name" placeholder="이름을 입력해 주세요.">
				</td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="m_hp2" id="m_hp2" placeholder="핸드폰 번호를 입력해 주세요."
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</td>
			</tr>
			
		</table>
		<div align="center">
			<button type="button" id="passsearchbtn">비밀번호 찾기</button><br>
		</div>
	</form>
</div>

<div id="passresult">
<h3 style="margin-left:840px;margin-top:50px; width: 500px; color: green;font-weight: bold;">비밀번호 확인</h3>
<div style="width: 500px;  margin: 0 auto; margin-top: 50px; border: 1px solid gray; border-radius: 10px;">
	<form style="margin:50px; padding-left: 20px;" action="#" method="post" >
		<span id="result"></span>
		<hr>
		<button type="button" onclick="location.href='loginform.jsp'">로그인</button>
		<button type="button" onclick="location.href='passsearchform.jsp'">비밀번호 찾기</button>
	</form>
</div>
</div>
</body>
</html>