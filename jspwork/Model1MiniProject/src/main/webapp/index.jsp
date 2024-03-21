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
<style type="text/css">
	div.layout{
		border: 0px solid gray;
		position: absolute;
	}
	div.title{
		width: 100%;
		height: 80px;
		line-height: 80px;
		font-size: 30pt;
		font-family: 'Gugi';
		text-align: center;
	}
	div.menu{
		width: 100%;
		height: 80px;
		line-height: 80px;
		font-size: 20px;
		font-family: 'Gugi';
		text-align: center;
		top: 90px;
	}
	div.info{
		width: 210px;
		height: 170px;
		line-height: 10px;
		font-size: 15pt;
		font-family:'Gugi';
		left: 50px;
		top: 300px;
		border: 2px groove purple;
		border-radius: 30px;
		padding: 20px 20px;
	}
	div.main{
		width: 1200px;
		height: 700px;
		font-family:'Sunflower';
		font-size: 15pt;
		border: 0px groove purple;
		left: 400px;
		top: 200px;
		
	}
</style>
</head>
<%
String mainPage="layout/main.jsp"; //기본페이지

//url을 통해서 main값을 읽어서 메인페이지에 출력한다
if(request.getParameter("main")!=null)
{
	mainPage=request.getParameter("main");
}
%>
<body>
<div class="layout title">
	<jsp:include page="layout/title.jsp"/>
</div>
<div class="layout menu">
	<jsp:include page="layout/menu.jsp"/>
</div>
<div class="layout info">
	<jsp:include page="layout/info.jsp"/>
</div>
<div class="layout main">
	<jsp:include page="<%=mainPage%>"/>
</div>
</body>
</html>