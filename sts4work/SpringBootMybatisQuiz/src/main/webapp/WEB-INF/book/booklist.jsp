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
</head>
<body>
<div style="margin: 0 auto;margin-top: 5%; width: 70%;">
<button type="button" onclick="location.href='addbook'" class="btn btn-outline-warning">도서추가등록</button>
<br><br>
	<c:if test="${totalCount==0 }">
		<div class="alert alert-warning">
			<b>등록된 상품이 없습니다.</b>
		</div>
	</c:if>
	<c:if test="${totalCount>0 }">
		<div class="alert alert-warning" >
			<b>총 ${totalCount}권의 도서가 판매중입니다.</b>
			<table class="table table-bordered">
				<c:forEach var="a" items="${list }" varStatus="i">
				
					<tr style="width: 50px;">
						<td rowspan="8" align="center" style="vertical-align: middle;">${i.count }</td>
					</tr>
					<tr style="width: 200px;">
						<td rowspan="8" align="center">
							<img alt="" src="../bookphoto/${a.bookimage }" style="width: 150px; height: 200px;">
						</td>
					</tr>
					<tr>
						<td>도서제목: ${a.bookname}</td>
					</tr>
					<tr>
						<td>글쓴이: ${a.writer }</td>
					</tr>
					<tr>
						<td>도서가격: <fmt:formatNumber value="${a.bookprice }"/>원 </td>
					</tr>
					<tr>
						<td>출판사: ${a.bookcompany }</td>
					</tr>
					<tr>
						<td>
							<fmt:formatDate value="${a.ipgoday }" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
						<td>
							<button type="button" onclick="loction.href='bookupdateform?num=${d.num}'">수정</button>
							<button type="button" onclick="loction.href='delete?num=${a.num}'">삭제</button>
						</td>
					</tr>
				
				</c:forEach>
			</table>
		</div>
	</c:if>
</div>
</body>
</html>