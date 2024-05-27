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
<div class="alert alert-info" style="width: 800px;">
	<h4>${totalcount}개의 상품이 있습니다.</h4>
</div>
<table class="table table-bordered" style="width: 800px;">
	<caption align="top">
		<span style="float: right;"> <button type="button" class="btn btn-outline-success"
		onclick="location.href='writeform'">상품추가</button></span>
	</caption>
	
	<c:forEach var="dto" items="${list }">
		<tr>
			<td width="250" rowspan="4" align="center">
				<c:if test="${dto.photoname!='no' }">
					<c:forTokens var="pn" items="${dto.photoname }" delims="," begin="0" end="0">
						<a>
							<img alt="" src="../ipgoimage/${pn }" style="width: 150px;">
						</a>
					</c:forTokens>
				</c:if>
				<c:if test="${dto.photoname=='no' }">
					<img alt="" src="../image/noimage.png" style="width: 150px;">
				</c:if>
			</td>
			<td>상품명:${dto.sangpum }</td>
		</tr>
		<tr>
			<td>
				가격:<fmt:formatNumber value="${dto.price }" type="currency"/>
			</td>
		</tr>
		<tr>
			<td>
				입고일:<fmt:formatDate value="${dto.ipgoday }" pattern="yyyy년 MM월 dd일"/>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" onclick="location.href='updateform?num=${dto.num}'">수정</button>
				<button type="button" onclick="location.href='delete?num=${dto.num}'">삭제</button>
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>