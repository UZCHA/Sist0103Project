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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#btncheck").click(function(){
			//id읽기
			var id= $("#id").val();
			//alert(id);
			
			$.ajax({
				type:"get",
				dataType:"json",
				url:"idcheck",
				data:{"id":id},
				success:function(res){
					if(res.count==1){
						alert("이미 가입된 아이디입니다.\n다시 입력해 주세요.");
						$("#id").val('');
					}else{
						alert("가입이 가능한 아이디입니다.");
					}
				}
			})
		})
		
	})
</script>
</head>
<body>
<div style="margin: 0 auto;">
<form action="gaip" method="post">
		<table class="table table-bordered" style="width: 400px;">
		<caption align="top"><b>회원가입</b></caption>
			<tr>
				<th class="table-light">회원이름</th>
				<td>
					<input type="text" name="name" style="width: 120px;" required="required">
				</td>
			</tr>
			
			<tr>
				<th class="table-light">아이디</th>
				<td>
					<input type="text" name="id" id="id" style="width: 120px;" required="required">
					<button type="button" id="btncheck">중복확인</button>
				</td>
			</tr>
			<tr>
				<th class="table-light">비밀번호</th>
				<td>
					<input type="text" name="pass" style="width: 120px;" required="required">
				</td>
			</tr>
			<tr>
				<th class="table-light">연락처</th>
				<td>
					<input type="text" name="hp" style="width: 120px;" required="required">
				</td>
			</tr>
			<tr>
				<th class="table-light">가입날짜</th>
				<td>
					<input type="date" name="gaipday" style="width: 120px;" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success" style="width: 100px">회원가입</button>
					<button type="button" class="btn btn-info" onclick="location.href='list'"
					style="width: 100px">목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>