<%@page import="quizshop.model.QuizShopDto"%>
<%@page import="quizshop.model.QuizShopDao"%>
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
<script type="text/javascript">
	$(function(){
		//photo 이미지 선택시 옆에 이미지 나오게
		$("#photo").change(function(){
			var s="../image/쇼핑몰사진/"+$(this).val()+".jpg";
			$("#myphoto").attr("src",s);
		})
		
		
	});
</script>
<%
String num=request.getParameter("num");
QuizShopDao dao=new QuizShopDao();
QuizShopDto dto=dao.getOneData(num);

%>
</head>
<body>
<div style="margin: 50px 100px; width: 380px;">
	<form action="updateAction.jsp">
	<input type="hidden" name="num" id="num" value="<%=dto.getNum()%>">
		<table class="table table-bordered">
			<caption align="top"><b>상품수정</b></caption>
			<tr>
				<th class="table-danger" width="100">상품명</th>
				<td>
					<input type="text" name="sang_name" required="required"
					class="form-control" style="width: 150px;" value="<%=dto.getSang_name()%>">
				</td>
			</tr>
			
			<tr>
				<th class="table-danger" width="100">상품이미지</th>
				<td>
				<div class="d-inline-flex">
					<select name="photo" id="photo" class="form-control" style="width: 150px;">
						<option value="34" <%=dto.getPhoto().equals("34")?"selected":"" %>>반바지</option>
						<option value="33" <%=dto.getPhoto().equals("33")?"selected":"" %>>원피스</option>
						<option value="26" <%=dto.getPhoto().equals("26")?"selected":"" %>>머리끈</option>
						<option value="10" <%=dto.getPhoto().equals("10")?"selected":"" %>>스카프</option>
						<option value="5" <%=dto.getPhoto().equals("5")?"selected":"" %>>목폴라</option>
						<option value="22" <%=dto.getPhoto().equals("22")?"selected":"" %>>진주반지</option>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="" width="30" id="myphoto">
					</div>
				</td>
			</tr>
			
			<tr>
				<th class="table-danger" width="100">가격</th>
				<td>
					<input type="text" name="price" required="required"
					class="form-control" style="width: 150px;" value="<%=dto.getPrice()%>">
				</td>
			</tr>
			
			<tr>
				<th class="table-danger" width="100">입고일</th>
				<td>
					<input type="date" name="ipgoday" value="<%=dto.getIpgoday() %>"
					class="form-control" style="width: 150px;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-info">상품수정</button>
					<button type="button" class="btn btn-outline-success"
					onclick="location.href='shopList.jsp'">상품목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>