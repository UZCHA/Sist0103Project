<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Grandiflora+One&family=Gugi&family=Hahmlet:wght@100..900&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
	input {
		height: 50px;
		border-radius:10px;
		border: 1px solid gray;
		font-family: 'Nanum Gothic';
}

	div{ 
		font-family: 'Nanum Gothic';
	}
	
	.swal-footer{
		text-align: center;
	}
	.swal-button {
		background-color: tomato;
	}
	.swal-title,.swal-text{
		font-family: 'Orbit-Regular';
		font-weight: 100;
	}
	.btninsert,.btnreset,#btnidcheck{
		background-color: #618E6E;
		color: white;
		border-radius: 5px;
		border:0px;
	}

@font-face {
    font-family: 'KCCChassam';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCCChassam.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Orbit-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/Orbit-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

</style>
<script type="text/javascript">
	$(function(){
		$("#ddd").hide();
		$("#aaa").hide();
		
		$("#btnidcheck").click(function(){
			
			var id=$("#id").val();
			//alert(id);
			
			if(id.trim() === "") {
       alert("아이디를 입력해주세요.")
        return; // Exit the function early if id is empty
    }
			
			$.ajax({
				type:"get",
				url:"testidcheck.jsp",
				dataType:"json",
				data:{"id":id},
				success:function(res){
					//alert("중복체크확인");
					
					if(res.idcount==1){
						$("#ddd").show();
						$("#id").val("");
						$("#ddd").text("사용할 수 없는 아이디입니다. 다른 아이디를 입력해주세요.").css("color","red");
					}else {
						$("#ddd").show();
						$("#ddd").text("사용 가능한 아이디입니다.").css("color","green");
					}
				}
				
			})
			
		});
		
		$("#nick").on("blur",function(){
			var nick=$(this).val();
			//console.log(nick);
			
			//닉네임을 입력하지 않았을때는 span부분에 있는 text가 사라짐
			if (!nick) {
            $("#aaa").hide();
            return; 
        }
			
			$.ajax({
				type:"get",
				url:"testnickcheck.jsp",
				dataType:"json",
				data:{"nick":nick},
				success:function(res){
					if(res.nickcount==1){
						$("#aaa").show();
						$("#aaa").text("사용할 수 없는 닉네임입니다. 다른 닉네임을 입력해주세요.").css("color","red");
					}else {
						$("#aaa").show();
						$("#aaa").text("사용 가능한 닉네임입니다.").css("color","green");
					}
				}
				
			})
			
		});
		
		$("form").submit(function(e){
			e.preventDefault();
			var f=this;
			
			if(f.pass.value!=f.pass2.value){
				//alert("비밀번호가 다릅니다.");
				swal("비밀번호가 다릅니다", "비밀번호를 확인해주세요", "error");
				f.pass.value="";
				f.pass2.value="";
				return false;
			}
			
			var name=$("#name").val();
			swal("회원가입 완료",name+"님의 회원가입이 성공적으로 완료되었습니다.","success")
			.then(function(){
				f.submit();
			})
			
		});
		
		
	})
	
	
	//////////////////////////////
	/*function check(f){
		if(f.pass.value!=f.pass2.value){
			//alert("비밀번호가 다릅니다.");
			swal("비밀번호가 다릅니다", "비밀번호를 확인해주세요", "error");
			f.pass.value="";
			f.pass2.value="";
			return false;
		}
	}*/
	
	

</script>
</head>
<body>
<div  style="width: 500px; margin: 0 auto; margin-top: 100px; border: 1px solid gray; border-radius: 10px;">

	<form style="margin: 50px;" action="gaipaction.jsp" method="post" onsubmit="return check(this)">
	
		<table class="table table-bordered-light" style="width: 400px; margin: 0 auto;">
		<caption align="top">회원가입</caption>
			<tr>
				
				<td >
					<input  type="text" placeholder="아이디"  style="width: 250px;"required="required"
					name="id" id="id">		
					<button type="button" class="btn btn-outline-success btn-sm" style="width: 100px;"
					id="btnidcheck">중복확인</button>
				</td>
			</tr>
			<tr id="ddd">
				<td>
					<span style="width: 250px;" id="idcheck"></span>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" placeholder="닉네임(1~6글자)" style="width: 350px;" required="required"
					name="nick" id="nick" maxlength="6" >
				</td>
			</tr>
			<tr id="aaa">
				<td>
					<span style="width: 250px;" id="nickcheck" ></span>
				</td>
			</tr>
			<tr>
				<td >
					<input type="password" placeholder="비밀번호" style="width: 350px;" required="required"
					name="pass" >
				</td>
			</tr>
			<tr>
				<td >
					<input type="password" placeholder="비밀번호 확인" style="width: 350px;" required="required"
					name="pass2">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" placeholder="[선택]이메일 주소(본인 확인용) " style="width: 350px;"
					name="email" id="email">
				</td>
			</tr>	
			<tr>
				<td>
					<input type="text" placeholder="이름" style="width: 350px;" required="required"
					name="name" id="name">
				</td>
			</tr>
			<tr>
				<td>
					생년월일&nbsp;&nbsp;<i class="bi bi-calendar-check"></i>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="date" style="width: 200px; text-align: center;" required="required"
					name="birth" id="birth" value="1990-01-01">
				</td>
			</tr>
			<tr>
				<td>
					<select id="hp1" name="hp1">
						<option value="SKT">SKT</option>
						<option value="LG">LG</option>
						<option value="KT">KT</option>
						<option value="알뜰폰">알뜰폰</option>
					</select>
					<input type="text" placeholder="휴대전화번호('-'생략)" style="width: 300px;" required="required"
					name="hp2" id="hp2">
				</td>
			</tr>
			<tr>
				<td align="center">
					<button type="submit" style="width: 100px;" class="btninsert">회원가입</button>
					<button type="button" style="width: 100px;" class="btnreset"
					onclick="location.href=''">취소</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>