<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Grandiflora+One&family=Gugi&family=Hahmlet:wght@100..900&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8"/>
	
	<form action="ex3_if_choose.jsp">
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" class="form-control" 
					style="width: 120px;">				
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" name="age" class="form-control" 
					style="width: 120px;">				
				</td>
			</tr>
			<tr>
				<th>부서</th>
				<td>
					<input type="text" name="buseo" class="form-control" 
					style="width: 120px;">				
				</td>
			</tr>
			<tr>
				<th>급여</th>
				<td>
					<input type="text" name="pay" class="form-control" 
					style="width: 200px;">				
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" >결과확인</button>
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 이름을 입력했을 경우에만 출력
		이름:한소희 님
		나이:23세(성인) (20세 이상은 성인, 나머지는 미성년자)
		월급:(화폐단위와 천단위 구분기호 붙여서 나오게할것)
		부서:경영관리부
		(choose 사용해서 기획부, 경영관리부, 디자인부..그 외에는 해당부서는 저희 회사에 없습니다.라고 나오게)
	 -->
	 
	 <c:if test="${!empty param.name}">
	 <div>
	 	이름:${param.name } 님<br>
	 	나이:${param.age }세(
		 	<c:if test="${param.age>=20 }">
		 		 <span>성인</span>
		 	</c:if>
		 	<c:if test="${param.age<20 }">
		 			<span>미성년자</span>
		 	</c:if>
		 	)<br>
	 	월급:<fmt:formatNumber value="${param.pay }" type="currency"/><br>
	 	부서:${param.buseo }<br>
		<c:choose>
			<c:when test="${param.buseo=='기획부' }">
				기획부
			</c:when>
			<c:when test="${param.buseo=='경영관리부' }">
				경영기획부
			</c:when>
			<c:when test="${param.buseo=='디자인부' }">
				디자인부
			</c:when>
			<c:otherwise>
				${param.buseo}는 존재하지 않습니다.
			</c:otherwise>
		</c:choose>
		</div>
	 </c:if>
</body>
</html>