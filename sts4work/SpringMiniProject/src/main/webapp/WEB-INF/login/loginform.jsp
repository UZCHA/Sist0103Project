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
<h1>로그인 폼</h1>
<div style="width: 500px;">
<form style="margin:50px;" action="loginprocess" method="post">

		<table class="table table-bordered" >
		<caption align="top" style="font-size: 1.2em;">아이디 로그인</caption>
		<tr>
			<th width="50"><i class="bi bi-person-circle fs-4"></i></th>
			<td >
				<input type="text" placeholder="아이디" name="id" required="required"
				 style="width: 300px;height: 40px;" value='${sessionScope.saveok==null?"":sessionScope.myid }'>
			</td>
		</tr>
		<tr>
			<th width="50"><i class="bi bi-lock-fill fs-4"></i></th>
			<td>
				<input type="password" placeholder="비밀번호" name="pass" required="required"style="width: 300px;height: 40px;">
			</td>
		</tr>
		</table>
		<div class="d-inline-flex">
		<input type="checkbox" name="cbsave" value=' ${sessionScope.saveok==null?"":"checked" }'>&nbsp;&nbsp;
		아이디 저장
		</div>
		<div align="center" style="margin-top: 30px;">
		<button type="submit" style="width: 400px;" class="loginbtn">로그인</button>
		</div>
	</form>
	</div>
</body>
</html>