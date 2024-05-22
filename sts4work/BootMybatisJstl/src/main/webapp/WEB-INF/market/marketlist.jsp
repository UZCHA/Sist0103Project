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
<div>
	<button type="button" class="btn btn-outline-warning"
	onclick="location.href='addform'">상품등록</button><br><br>
</div>

<c:if test="${totalCount==0 }">
	<div class="alert alert-warning">
		<b>저장된 정보가 없습니다.</b>
	</div>
</c:if>

<c:if test="${totalCount>0 }">
	<div class="alert alert-warning">
		<b>총 ${totalCount}개의 상품정보가 있습니다.</b>
	</div>
</c:if>

<div>
	
		<c:forEach var="a" items="${list }" varStatus="i">
			<table>
				<tr>
					<td rowspan="5">
						<c:if test="${a.photoname==null }">
							<img alt="" src="../photo/noimage.png" style="width: 150px;height: 200px;">
						</c:if>
						<c:if test="${a.photoname!=null }">
							<img alt="" src="../photo/${a.photoname }" style="width: 150px;height: 200px;">
						</c:if>			
					</td>
				</tr>
				<tr>
					<td>상품명:${a.sang }</td>
				</tr>
				<tr>
					<td>가격:
						<fmt:formatNumber value="${a.dan }" type="currency"/>
					</td>
				</tr>
				<tr>
					<td>
						입고일: <fmt:formatDate value="${a.ipgoday }" pattern="yyyy-MM-dd HH:mm"/>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="btn btn-warning btn-sm"
						onclick="location.href='updateform?num=${a.num}'">수정</button>
						<button type="button" class="btn btn-warning btn-sm"
						onclick="location.href='delete?num=${a.num}'">삭제</button>
					</td>
				</tr>
			</table>
		</c:forEach>
		
</div>
</body>
</html>