<%@page import="quizshop.model.QuizShopDao"%>
<%@page import="quizshop.model.QuizShopDto"%>
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
img{
	border-radius: 20px;
}

div{
margin: 30px 30px;
border: 1px solid gray;
width: 500px;
text-align: center;
}


</style>
</head>
<body>
<!--상품명 눌렀을때 이미지가 크게 나오고 옆에 설명이 추가됨 
상품명, 가격, 입고일
목록,수정,삭제 버튼 추가할 것-->
<%
String num=request.getParameter("num");
QuizShopDto dto=new QuizShopDto();
QuizShopDao dao=new QuizShopDao();
dto=dao.getOneData(num);

%>
<div>
<h3 >**상품명: <%=dto.getSang_name() %>**</h3>
<h4>가격: <%=dto.getPrice() %> 원</h4>
<h4>입고일:<%=dto.getIpgoday() %></h4>
<img src='../image/쇼핑몰사진/<%=dto.getPhoto()%>.jpg'>
<hr>
<button type="button" onclick="location.href='shopList.jsp'" class="btn btn-outline-success btn-sm" >목록</button>
<button type="button" class="btn btn-outline-primary btn-sm"
onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
<button type="button" class="btn btn-outline-danger btn-sm"
onclick="location.href='deletequiz.jsp?num=<%=dto.getNum()%>'">삭제</button>
<br>
<br>
</div>
</body>
</html>