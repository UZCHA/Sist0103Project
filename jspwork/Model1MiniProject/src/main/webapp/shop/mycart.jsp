<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
	img.photo{
		width: 60px;
		height: 80px;
		border: 1px solid gray;
	}
	div.sangpum{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#allcheck").click(function(){
			
			var chk= $(this).is(":checked");
			$(".idx").prop("checked",chk);
			console.log(chk);
			
			$("div.sangpum").click(function(){
				var shopnum=$(this).attr("shopnum");
				//alert(shopnum);
				
				location.href="index.jsp?main=shop/shopdetailpage.jsp?shopnum="+shopnum;
			})
			
		});
		
		$("#btncartdel").click(function(){
			var cnt=$(".idx:checked").length;
			//alert(cnt);
			if(cnt==0){
				alert("먼저 삭제할 상품을 1개이상 선택해 주세요.");
				return;
			}
			
			$(".idx:checked").each(function(i,elt){
				var idx=$(this).attr("idx");
				//alert(idx);
				
				//선택한 장바구니 상품 모두 한번에 삭제
				del(idx);
			})
			//현재페이지 새로고침
			location.reload();

		});
		
		//i태그 한개 삭제 이벤트
		$("i.del").click(function(){
			var idx=$(this).attr("idx");
			//alert(idx);
			var a=confirm("삭제하시겠습니까?");
			if(a){
				del(idx);
				location.reload();
			}
			
		});
		
		})
//삭제하는 사용자 함수
function del(idx){
		$.ajax({
			
			type:"get",
			url:"shop/cartdelete.jsp",
			dataType:"html",
			data:{"idx":idx},
			success:function(){
				
			}
		})
	}
		
</script>
</head>
<body>
<%
String id=(String)session.getAttribute("myid");
ShopDao dao=new ShopDao();
List<HashMap<String, String>> list=dao.getCartList(id);
NumberFormat nf=NumberFormat.getInstance();
%>
<h4 class="alert alert-info" style="width: 1000px;"><%=id %>님의 장바구니</h4>
<table class="table table-striped" style="width: 1000px;">
	<tr>
		<th style="width: 30px;">
			<input type="checkbox" id="allcheck">
		</th>
		<th style="width: 200px;">상품정보</th>
		<th style="width: 200px;">상품금액</th>
	</tr>
	<%
	int totalmoney=0;
		for(int i=0;i<list.size();i++){
			HashMap<String,String> map=list.get(i);
			//사진얻기-map.put했던거 get으로 가져온다
			String photo=map.get("photo");
			%>
			<tr>
				<td>
					<input type="checkbox" name="idx" idx="<%=map.get("idx")%>" class="idx">
				</td>
				<td>
					<div class="sangpum" shopnum="<%=map.get("shopnum")%>">
						<img alt="" src="shopsave/<%=photo%>" class="photo" align="left"
						hspace="20">
						<b>상품명:<%=map.get("sangpum") %></b><br>
						<b>수량:<%=map.get("cnt") %>개</b><br>
						<b>수량:<%=map.get("price") %>원</b><br>
						<b>날짜:<%=map.get("cartday") %></b><br>
					</div>
				</td>
				<td style="vertical-align: middle;">
					<%
						int price=Integer.parseInt(map.get("price"));
						int cnt=Integer.parseInt(map.get("cnt"));
						
						price*=cnt;
						
						totalmoney+=price;
						
					%>
					<h5><%=nf.format(price) %>원 <i class="bi bi-trash3 del"idx=<%=map.get("idx") %>></i></h5>
				</td>
			</tr>
			
		<%}
	%>
			<tr>
				<td>
					<button type="button" id="btncartdel" class="btn btn-danger">삭제</button>
				</td>
				<td colspan="2" align="center">
					<span>총주문금액:<b><%=nf.format(totalmoney) %></b></span>
				</td>
			</tr>
</table>
</body>
</html>