<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.layout div{
		border: 0px solid black;
	}
	div.layout div.title{
		position: absolute;
		top: 10px;
		height: 100px;
		left:280px;
		width: 30%;
		display: flex;
		justify-content: center; /* Flexbox를 사용하여 자식 요소를 가운데 정렬 */
		align-items: center;
	}
	div.layout div.menu{
		position: absolute;
		top: 150px;
		left: 280px;
		height: 100px;
		width: 80%;
		display: flex;
		justify-content: center; /* Flexbox를 사용하여 자식 요소를 가운데 정렬 */
		align-items: center;
	}
	div.layout div.info{
		position: absolute;
		top: 250px;
		left: 30px;
		height: 200px;
		width: 200px;
		border: 5px solid purple;
		border-radius:30px;
		padding: 30px 20px;
	}
	div.layout div.main{
		position: absolute;
		top: 250px;
		left: 280px;
		height: 100%;
		width: 80%;
		
		
	}
</style>
</head>
<body>
	<div class="layout" >
		<div class="title">
			<tiles:insertAttribute name="title"/>
		</div>
		<div class="menu">
			<tiles:insertAttribute name="menu"/>
		</div>
		<div class="info">
			<tiles:insertAttribute name="info"/>
		</div>
		<div class="main">
			<tiles:insertAttribute name="main"/>
		</div>
	</div>
</body>
</html>