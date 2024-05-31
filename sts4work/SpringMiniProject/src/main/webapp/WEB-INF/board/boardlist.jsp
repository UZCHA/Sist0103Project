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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	a{
	text-decoration: none;
	color: black;
	}
</style>
<script type="text/javascript">
function anscount(num){
	
	$.ajax({
		type:"get",
		url:"/board/anscount",
		data:{"num":num},
		dataType:"html",
		success:function(count){
			if(count==0){
				$("#ansCount_" + num).text('');
			}else{
				$("#ansCount_" + num).text("[" + count+"]").css("color","red");
			}
			
		}
		
	})
}
$(document).ready(function() {
    <c:forEach var="a" items="${list}">
        anscount(${a.num});
    </c:forEach>
});
</script>
</head>
<body>
<div style="margin: 0 auto; width: 80%; text-align: center; padding-top: 5%;">
<h1>boardlist</h1>
<button type="button" onclick="location.href='form'"
style="float: right;">글쓰기</button><br><br>

<table class="table table-bordered">
	<tr align="center">
		<th width="50">번호</th>
		<th width="300">제목</th>
		<th width="150">작성자</th>
		<th width="50">조회</th>
		<th width="200">등록일</th>
	</tr>
	<c:if test="${totalCount==0 }">
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${totalCount>0 }">
		<c:forEach var="a" items="${list }">
			<tr>
				<td align="center">${no }</td>
				<c:set var="no" value="${no-1 }"/>
				<td>
					<a href='content?num=${a.num }&currentPage=${currentPage}'>${a.subject }
						<c:if test="${a.uploadfile!='no' }">
							<i class="bi bi-card-image"></i>
						</c:if>
						<span id="ansCount_${a.num}"></span>
					</a>
				</td>
				<td>${a.name }</td>
				<td>${a.readcount }</td>
				<td>
					<fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd HH:mm"/>
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>

<!-- 페이징 -->
<div style="margin: 0 auto; width: 80%; text-align: center; padding-top: 5%;">
	<ul  class="pagination justify-content-center">
		
		<!-- 이전 -->
		<c:if test="${startPage>1 }">
			<li class="page-item">
			<a class="page-link" href="list?currentPage=${startPage-1 }"
			style="color: black;">이전</a>
			</li>
		</c:if>
		
		<!-- 페이지 번호 -->
		<c:forEach var="pp" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage==pp }">
				<li class="page-item active">
					<a class="page-link" href="list?currentPage=${pp }">${pp }</a>
				</li>
			</c:if>
			<c:if test="${currentPage!=pp }">
				<li class="page-item">
					<a class="page-link" href="list?currentPage=${pp }">${pp }</a>
				</li>
			</c:if>
		</c:forEach>
		
		<!-- 다음 -->
		<c:if test="${endPage<totalPage }">
			<li class="page-item">
				<a class="page-link" href="list?currentPage=${endPage+1}"
				style="color: black;">다음</a>
			</li>
		</c:if>
	</ul>
</div>

</div>
</body>
</html>