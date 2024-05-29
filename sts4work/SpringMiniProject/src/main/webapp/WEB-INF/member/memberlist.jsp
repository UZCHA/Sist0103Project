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
	//전체선택하면 박스선택해제
	$("#allckeck").click(function(){
		var chk=$(this).is(":checked");
		//전체체크값을 모든체크에 일괄전달
		$(".del").prop("checked",chk);
		
	});
	
	$("#btnmemberdel").click(function(){
		var cnt=$(".del:checked").length;
		//alert(cnt);
		if(cnt==0){
			alert("먼저 삭제할 회원을 선택해 주세요.");
			return;
		}
			$(".del:checked").each(function(i,elt){
				var num=$(this).attr("num");
				console.log(num); //선택한 회원의 num만 나오는지 반드시 확인
				
				//선택한것 모두 삭제
				$.ajax({
					type:"get",
					url:"delete",
					data:{"num":num},
					dataType:"html",
					success:function(){
					
						location.reload();
					}
					
				})
			})
	})
	
});
</script>
</head>
<body>
<h1>${mcount }명의 회원이 존재합니다.</h1>
<div>
	<table class="table table-bordered">
		<tr align="center">
			<th>번호</th>
			<th>회원명</th>
			<th>회원아이디</th>
			<th>주소</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th><input type="checkbox" id="allckeck">삭제 </th>
		</tr>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td> ${dto.num }</td>
				<td><img alt="" src="../memberphoto/${dto.photo }" style="width:30px;height: 30px; ">${dto.name }</td>
				<td>${dto.id }</td>
				<td>${dto.addr}</td>
				<td>${dto.email }</td>
				<td>${dto.hp }</td>
				<td align="center">
					<input type="checkbox" num="${dto.num }" class="del">
				</td>
			</tr>
		</c:forEach>
	</table>
	<button type="button" class="btn btn-danger" style="float: right;" id="btnmemberdel">삭제</button>
</div>
</body>
</html>