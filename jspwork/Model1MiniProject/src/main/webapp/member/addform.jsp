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
<script type="text/javascript">
	$(function(){
	
		$("#btnIdCheck").click(function(){
			var id=$("#id").val();
			//alert(id);
			
			if(id.trim() === "") {
        $("span.idsuccess").text("아이디를 입력해주세요");
        return; // Exit the function early if id is empty
    }
			
			$.ajax({
				type:"get",
				url:"member/idCheck.jsp",
				dataType:"json",
				data:{"id":id},
				success:function(res){
					//alert(res.count);
					
					if(res.count==1){					
						//alert("이미 가입된 아이디입니다.\n다시입력해 주세요.");		
						$("span.idsuccess").text("가입불가");
						$("#id").val("");
					}	
					else{
						//alert("사용가능한 아이디입니다.");
						$("span.idsuccess").text("가입가능");
						}
						
				}
				
			})
			
		});
		
		$("#selemail").change(function(){
			if($(this).val()=='-'){
				$("#email2").val("");
			}
			else{
				
				$("#email2").val($(this).val());
			}
			
			
		})
		
	})
	//////////////////////////
	
	function check(f){
		if(f.pass.value!=f.pass2.value){
			alert("비밀번호가 다릅니다.");
			f.pass.value="";
			f.pass2.value="";
			return false;//action
		}
	}
</script>
</head>
<body>
<div style="margin: 100px 100px; width: 500px;">
<form action="member/addaction.jsp" method="post"onsubmit="return check(this)">
	<table class="table table-bordered">
		<caption align="top"><b>회원가입</b></caption>
		<tr>
			<th width="100" class="table-success">아이디</th>
			<td>
				<div class="d-inline-flex">
					<input type="text" name="id" id="id" maxlength="8" class="form-control"
					required="required" style="width: 120px;">
					<button type="button" class="btn btn-danger" id="btnIdCheck"
					style="margin-left: 20px;">중복체크</button>
					<span class="idsuccess" style="color: blue;margin-left: 20px"></span>
				</div>
			</td>
		</tr>
		<tr>
			<th width="100" class="table-success">비밀번호</th>
			<td>
				<div class="d-inline-flex">
					<input type="password" name="pass" class="form-control"
					required="required" style="width: 150px;" placeholder="비밀번호">
					<input type="password" name="pass2" class="form-control"
					required="required" style="width: 150px; margin-left: 20px;" placeholder="비밀번호 확인">
				</div>
			</td>
		</tr>
		<tr>
			<th width="100" class="table-success">이름</th>
			<td>
				<input type="text" name="name" class="form-control" required="required"
				style="width:120px; ">
			</td>
		</tr>
		<tr>
			<th width="100" class="table-success">핸드폰</th>
			<td>
				<input type="text" name="hp" class="form-control" required="required"
				style="width:200px; ">
			</td>
		</tr>
		<tr>
			<th width="100" class="table-success">주소</th>
			<td>
				<input type="text" name="addr" class="form-control" required="required"
				style="width:300px; ">
			</td>
		</tr>
		<tr>
			<th width="100" class="table-success">이메일</th>
			<td>
			<div class="d-inline-flex">
				<input type="text" name="email1" class="form-control"required="required"
				style="width: 100px;">
				<b style="margin-left: 10px;">@</b>
				<input type="text" name="email2" id="email2" class="form-control"required="required"
				style="width: 100px; margin-left: 10px;">
				<select id="selemail" class="form-control" style="margin-left: 10px;">
					<option value="-" >직접입력</option>
					<option value="naver.com">네이버</option>
					<option value="nate.com">네이트</option>
					<option value="gmail.com">구글</option>
					<option value="daum.net">다음</option>
				</select>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-outline-info"
				style="width: 100px;">저장하기</button>
				<button type="reset" class="btn btn-outline-info"
				style="width: 100px;">초기화</button>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>