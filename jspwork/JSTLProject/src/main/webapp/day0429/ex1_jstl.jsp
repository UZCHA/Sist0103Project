<%@page import="java.util.Date"%>
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
	<h2>JSTL연산자</h2>
	<!-- 변수선언 -->
	<c:set var="su1" value="7"/>
	<c:set var="su2" value="4"/>
	<b>두변수값 출력(su1:${su1},su2:${su2})</b>
	
	<!-- if -->
	<c:if test="${su1>su2 }">
		<h2>숫자1이 더 큽니다!</h2>
	</c:if>
	<c:if test="${su1<su2 }">
		<h2>숫자2가 더 큽니다!</h2>
	</c:if>
	
	<!-- 문자선언 -->
	<c:set var="nara" value="프랑스"/>
	
	<c:if test="${nara=='하와이' }"><!-- 문자비교도 ==으로 비교가능 -->
		<h2>하와이는 훌라</h2>
	</c:if>
		<c:if test="${nara=='프랑스' }">
		<h2>프랑스는 에펠탑</h2>
	</c:if>
	
	<table class="table table-bordered" style="width: 400px;">
		<tr>
			<th width="250">\${su1+su2 }</th>
			<td>
				${su1+su2 }
			</td>
		</tr>
		<tr>
			<th width="250">\${su1-su2 }</th>
			<td>
				${su1-su2 }
			</td>
		</tr>
		<tr>
			<th width="250">\${su1*su2 }</th>
			<td>
				${su1*su2 }
			</td>
		</tr>
		<tr>
			<th width="250">\${su1/su2 }</th>
			<td>
				${su1/su2 }
			</td>
		</tr>
		<tr>
			<th width="250">\${su1 div su2 }</th>
			<td>
				${su1 div su2 }
			</td>
		</tr>
		<tr>
			<th width="250">\${su1%su2 }</th>
			<td>
				${su1%su2 }
			</td>
		</tr>
		<tr>
			<th width="250">\${su1 mod su2 }</th>
			<td>
				${su1 mod su2 }
			</td>
		</tr>
		<tr>
			<th width="250">su1 증가</th>
			<td>
				증가전 su1:<c:out value="${su1 }"/><br>
				<c:set var="su1" value="${su1+1 }"/>
				증가후 su1:${su1 }
			</td>
		</tr>
	</table>
	
	<!-- fmt태그 이용 -->
	<c:set var="name" value="손석구"/>
	<c:set var="age" value="22"/>
	<c:set var="today" value="<%=new Date()%>"/>
	
	<!-- jstl 출력1 -->
	<h2>이름:<c:out value="${name }"/> </h2>
	<!-- jatl 출력2 -->
	<h2>이름:${name }</h2>
	<h2>나이:${age }</h2>
	<h2>날짜:${today }</h2>
	<!-- fmt날짜 형식 -->
	<pre>
		<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm"/>
		<fmt:formatDate value="${today }" pattern="yyyy-MM-dd a HH:mm"/>
		<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm EEE"/>
		<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm EEEE"/>
	</pre>
	
	<!-- 숫자 변수선언 -->
	<c:set var="money" value="4567891000"/>
	<c:set var="num1" value="123458.5689"/>
	
	<!-- jstl에서의 숫자출력 양식 -->
	<pre>
		${money }
		${num1 }
		
		<!-- 3자리마다 컴마 붙이기 -->
		<fmt:formatNumber value="${money }" type="number"/>
		<!-- 3자리마다 컴마,화폐단위 -->
		<fmt:formatNumber value="${money }" type="currency"/>
		
		<fmt:formatNumber value="${num1 }" pattern="0.00"/>
		
		<fmt:formatNumber value="1.2" pattern="0.00"/>
		<fmt:formatNumber value="1.2" pattern="0.##"/>
	</pre>
</body>
</html>