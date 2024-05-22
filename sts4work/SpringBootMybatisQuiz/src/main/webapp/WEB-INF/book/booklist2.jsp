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
<style type="text/css">
	span {
	font-size: 0.9em;
}
</style>
</head>
<body>
<div style="margin: 0 auto;margin-top: 5%;width: 80%;">
<button type="button" onclick="location.href='addbook'" class="btn btn-outline-dark">도서추가등록</button>
<br><br>
	<c:if test="${totalCount==0 }">
		<div class="alert alert-warning">
			<b>등록된 상품이 없습니다.</b>
		</div>
	</c:if>
	<c:if test="${totalCount>0 }">
		<div class="alert alert-warning" >
			<b>총 ${totalCount}권의 도서가 판매중입니다.</b><br>
			
				<c:forEach var="a" items="${list }" varStatus="i">
					<div style="margin:0 auto; display: inline-block;padding-left: 20px;" align="center">
						<img alt="" src="../bookphoto/${a.bookimage }" style="width: 150px;height: 200px;"><br>
						<span><b> ${a.bookname }</b></span><br>
						<span>글쓴이:${a.writer }</span><br>
						<span>출판사:${a.bookcompany }</span><br>
						<span>가격:<fmt:formatNumber value="${a.bookprice}"/>원</span><br>
						<span>입고일:<fmt:formatDate value="${a.ipgoday }" pattern="yyyy-MM-dd"/></span><br>
						<span>
							<button type="button" onclick="location.href='bookupdateform?num=${a.num}'" class="btn btn-outline-dark btn-sm" >수정</button>
							<button type="button" onclick="location.href='delete?num=${a.num}'" class="btn btn-outline-dark btn-sm">삭제</button>
						</span>
					</div>
					<c:if test="${i.count%4==0 }">
						<br><br>
					</c:if>
				
				</c:forEach>

		</div>
	</c:if>
</div>
</body>
</html>