<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
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
<%
String shopnum=request.getParameter("shopnum");
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");
//아이디에 해당하는 멤버 시퀀스
MemberDao mdao=new MemberDao();
String num=mdao.getNum(myid);
//해당상품에 대한 데이타
ShopDao sdao=new ShopDao();
ShopDto dto=sdao.getData(shopnum);
NumberFormat nf=NumberFormat.getCurrencyInstance();
%>

<body>
<div style="margin: 0 auto;margin-top:100px; width: 800px;">
<form id="frm">
	<input type="hidden" name="shopnum" value="<%=shopnum%>">
	<input type="hidden" name="num" value="<%=num%>">
	<table>
		<tr>
			<td rowspan="6">
				<img alt="" src="shopsave/<%=dto.getPhoto()%>">
			</td>
		</tr>
		<tr>
			<th style="width: 200px;">카테고리</th>
			<td><%=dto.getCategory() %></td>
		</tr>
		<tr>
			<th style="width: 200px;">상품명</th>
			<td><%=dto.getSangpum() %></td>
		</tr>
		<tr>
			<th style="width: 200px;">가격</th>
			<td><%=nf.format(dto.getPrice()) %>원</td>
		</tr>
		<tr>
			<th style="width: 200px;">수량</th>
			<td>
				<input type="number" min="1" max="10" value="1" step="1" name="cnt" style="width: 100px;">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" style="width: 100px; margin-right:30px;"
				class="btn btn-info" id="btncart">장바구니</button>
				<button type="button" style="width: 100px;" class="btn btn-info"
				onclick="location.href='index.jsp?main=shop/shoplist.jsp'">목록</button>
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript">
	
			$("#btncart").click(function(){
				
				//먼저 로그인 체크를 한다.
				var login="<%=loginok%>";
				if(login=="null"){
					alert("먼저 로그인을 해주세요");
					return;
				}
				
				var cartdata=$("#frm").serialize();
				//alert(cartdata);
				
				//insert처리
				$.ajax({
					type:"post",
					url:"shop/detailprocess_cart.jsp",
					dataType:"html",
					data:cartdata,
					success:function(){
						//alert("장바구니 성공");
						var a=confirm("장바구니에 저장했습니다.\n장바구니로 이동하겠습니까?");
						if(a){
							location.href='index.jsp?main=shop/mycart.jsp';
						}
					}
					
				})
				
			});
	

</script>

</div>
</body>
</html>