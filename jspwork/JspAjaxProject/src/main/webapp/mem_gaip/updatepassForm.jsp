<%@page import="mem_gaip.model.MemgaipDto"%>
<%@page import="mem_gaip.model.MemgaipDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
String m_num=request.getParameter("m_num");


%>

<div style="margin: 200px 200px;">
 	<form action="updatepassAction.jsp" method="post">
 		<table class="table table-bordered" style="width: 300px;">
 			<caption align="top"><b>수정 비밀번호 입력</b></caption>
 			<tr>
 				<td>
 					비밀번호를 입력해 주세요.<br><br>
 					<input type="password"class="form-control" name="m_pass"
 					required="required" placeholder="숫자 4자리">
 					
 					<input type="hidden" name="m_num" value="<%=m_num%>">
 					
 					<br><br>
 					<button type="submit" class="btn btn-danger">수정</button>
					<button type="button" class="btn btn-success" 
					onclick="history.back()">이전</button>
 				</td>
 			</tr>
 		</table>
 	</form>
 </div>
</body>
</html>