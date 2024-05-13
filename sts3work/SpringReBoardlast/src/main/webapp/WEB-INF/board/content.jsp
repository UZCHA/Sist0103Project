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
		<tr>
			<td>
				<button type="button" class="btn btn-outline-success"
				onclick="location.href='writeform'">글쓰기</button>
				<button type="button" class="btn btn-outline-success"
				onclick="location.href='writeform?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글</button>
			<button type="button" class="btn btn-outline-success"
				onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
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