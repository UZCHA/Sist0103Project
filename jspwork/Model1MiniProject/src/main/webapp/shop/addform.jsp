<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<div style="margin: 50px 100px; width: 600px;">
	<form action="shop/addaction.jsp" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
			<caption align="top"><b>상품등록</b></caption>
			<tr>
				<td style="width: 150px;">
					<b>카테고리</b>
				</td>
				<td>
					<select style="width: 200px;" class="form-control" required="required" 
					name="category">
						<option value="아우터">아우터</option>
						<option value="상의">상의</option>
						<option value="하의">하의</option>
						<option value="악세사리">악세사리</option>
						<option value="신발">신발</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width: 150px"><b>상품명</b></td>
				<td>
					<input name="sangpum" style="width: 200px;" type="text"placeholder="상품명입력"  class="form-control">
				</td>
			</tr>
			<tr>
				<td style="width: 150px"><b>상품이미지</b></td>
				<td>
					<input type="file" name="photo" style="width: 300px;"  class="form-control">
				</td>
			</tr>
			<tr>
				<td style="width: 150px"><b>상품가격</b></td>
				<td>
					<input style="width: 200px;" type="text" name="price" placeholder="가격입력"  class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<td style="width: 150px"><b>입고일</b></td>
				<%
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					String day=sdf.format(new Date());
				%>
				<td>
					<input type="date" name="ipgoday" style="width: 200px;"  class="form-control" required="required"
					value="<%=day%>">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info" style="width: 100px">상품저장</button>
					<button type="button" class="btn btn-info" style="width: 100px"
					onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>