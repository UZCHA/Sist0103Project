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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
	$("i.del").click(function(){
		var idx=$(this).attr("idx");
		var pass=prompt("비밀번호를 입력해 주세요.");
		//alert(idx+","+pass);
		if(pass==null)//prompt 취소시 함수 종료하겠다.
			return;
		$.ajax({
			type:"get",
			dataType:"json",
			url:"adelete",
			data:{"idx":idx,"pass":pass},
			success:function(res){
				if(res.check==0){
					alert("비밀번호가 맞지않습니다.");
				}else{
					alert("삭제되었습니다.");
					location.reload();
				}
			}
			
		})
	})
		
	})
</script>
</head>
<body>
<div style="margin: 0 auto; width: 80%; margin-top: 10%;">
	<table class="table table-bordered">
		<tr>
			<td>
				<h3><b>${dto.subject }</b></h3>
				<br>
				<span style="float: left;">작성자: ${dto.writer }</span>
				<span style="float: right;color: #ccc">&nbsp;조회:${dto.readcount }</span>
				<span style="float: right;color: #ccc"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/> | 
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<pre>${dto.content }</pre>
				<br><br>
				<c:if test="${dto.photo!='no' }">
					<c:forTokens  var="im" items="${dto.photo }" delims=",">
						<a href="../photo/${im }">
							<img alt="" src="../photo/${im }">
						</a>
					</c:forTokens>
				</c:if>
			</td>
		</tr>
		
		<!-- 댓글 -->
		<tr>
			<td>
				<div id="answer">
				<b>댓글 ${acount }개</b><br><br>
				<c:forEach var="a" items="${alist}">
					${a.nickname }&nbsp;:&nbsp;${a.content }&nbsp;&nbsp;
					<span style="color: gray; font-size: 0.8em;">
						<fmt:formatDate value="${a.writeday }"/>
					</span>&nbsp;
					<i class="bi bi-pencil-square edit" idx='${a.idx }'></i>
					<i class="bi bi-trash del" idx='${a.idx }'></i>
				</c:forEach>			
				</div>
				
				<form action="ainsert" method="post">
					<input type="hidden" name="num" value="${dto.num }" id="num">
					<input type="hidden" name="currentPage" value="${currentPage}" id="currentPage">
					<div class="d-inline-flex">
						<b>닉네임: </b>
						<input type="text" name="nickname" class="form-control"
						style="width: 100px;height: 30px;" required="required">
						<b>비밀번호: </b>
						<input type="password" name="pass" class="form-control"
						style="width: 100px;height: 30px;" required="required"></div>
						<br><br>
					<div class="d-inline-flex">
						<input type="text" name="content" class="form-control"
						style="width: 500px;" required="required" placeholder="댓글 내용을 입력해 주세요.">&nbsp;
						<button type="submit" class="btn btn-outline-success">확인</button>
					</div>
				</form>
			</td>
		</tr>
		
		<tr>
			<td>
				<button type="button" class="btn btn-outline-success"
				onclick="location.href='writeform'">글쓰기</button>
				<button type="button" class="btn btn-outline-success"
				onclick="location.href='writeform?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글</button>
			<button type="button" class="btn btn-outline-success"
				onclick="location.href='updatepassform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
			<button type="button" class="btn btn-outline-success"
				onclick="location.href='deletepassform?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
			<button type="button" class="btn btn-outline-success"
				onclick="location.href='list?currentPage=${currentPage }'">목록</button>
			
			</td>
		</tr>
	</table>
</div>
</body>
</html>