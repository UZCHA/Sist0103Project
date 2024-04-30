<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
img.photo{
	width: 200px;
	height: 230px;
	border: 1px solid gray;
	margin-bottom: 10px;
}

.shoptable{
	padding: 10px;
	height: 150px;
}
a.godetail{
	text-decoration: none;
	color: black;
}
</style>
<script type="text/javascript">
	$(function(){
		$("a.godetail").click(function(){
			var shopnum=$(this).attr("shopnum");
			//alert(shopnum);
			
			//디테일 페이지로 이동
			location.href='index.jsp?main=shop/shopdetailpage.jsp?shopnum='+shopnum;
			
		})
		
	})
</script>
</head>
<%
	ShopDao dao=new ShopDao();
	List<ShopDto> list=dao.getAllSangpums();
	NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<body>
<div class="container mt-3">
  
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#tabs-total">전체</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-outer">아우터</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-top">상의</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-bottom">하의</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-acc">악세사리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-shose">신발</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="tabs-total" class="container tab-pane active"><br>
      <h3>전체</h3>
      <p>
      	<table class="shoptable table table-bordered" style="width: 1000px;">
      		<tr>
      			<%
      				
      			for(int i=0;i<list.size();i++){
      				ShopDto dto=list.get(i);
      				
      				//20-50까지 난수 발생
      				int sale=(int)(Math.random()*31)+20;
      			%>
      				<td>
      				
      				<a shopnum="<%=dto.getShopnum() %>" style="cursor: pointer;" class="godetail">
      				<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo">
      				<br>
      				<%=dto.getSangpum() %><br>
      				<b style="color: red;"><%=sale %>%</b>
      				<span style="float: right;">
      					<div style="color: gray; font-size: 12px;">
      						<%
      							int price=(int)(dto.getPrice()+dto.getPrice()*(sale/100.0));
      						%>
      						<strike><%=nf.format(price) %></strike>
      					</div>
      					<div style="color: black;">
      						<%=nf.format(dto.getPrice()) %>
      					</div>
      				</span>
      				</a>
      				</td>  
      				
      				<%
      					if((i+1)%4==0){%>
      						</tr><tr>
      					<%}
      				%>   				
      			<%}
      			%>
      		</tr>
      	</table>
      </p>
    </div>
    <div id="tabs-outer" class="container tab-pane fade"><br>
      <h3>아우터</h3>
      <p>
      	<table class="table table-bordered" style="width: 1000px;">
      		<tr>
      			
      			<table class="shoptable table table-bordered" style="width: 1000px;">
        		<tr>
        			<%
        				int i=0;
        			for(ShopDto dto:list){
        				
        				if(dto.getCategory().equals("아우터")){
        				//20-50까지 난수 발생
        				int sale=(int)(Math.random()*31)+20;
        			%>
        				<td>
        				
        				<a shopnum="<%=dto.getShopnum() %>" style="cursor: pointer;" class="godetail">
        				<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo">
        				<br>
        				<%=dto.getSangpum() %><br>
        				<b style="color: red;"><%=sale %>%</b>
        				<span style="float: right;">
        					<div style="color: gray; font-size: 12px;">
        						<%
        							int price=(int)(dto.getPrice()+dto.getPrice()*(sale/100.0));
        						%>
        						<strike><%=nf.format(price) %></strike>
        					</div>
        					<div style="color: black;">
        						<%=nf.format(dto.getPrice()) %>
        					</div>
        				</span>
        				</a>
        				</td>  
        				
        				<%
        					if((i+1)%4==0){%>
        						</tr><tr>
        					<%}i++;}
        					
        				%>   				
        			<%}
        			%>
        		</tr>
        	</table>
      		     			     			
      		</tr>
      	</table>
      </p>
    </div>
    <div id="tabs-top" class="container tab-pane fade"><br>
      <h3>상의</h3>
      <p>
      <table class="table table-bordered" style="width: 1000px;">
      		<tr>
      			
      			<table class="shoptable table table-bordered" style="width: 1000px;">
        		<tr>
        			<%
        				i=0;
        			for(ShopDto dto:list){
        				
        				if(dto.getCategory().equals("상의")){
        				//20-50까지 난수 발생
        				int sale=(int)(Math.random()*31)+20;
        			%>
        				<td>
        				
        				<a shopnum="<%=dto.getShopnum() %>" style="cursor: pointer;" class="godetail">
        				<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo">
        				<br>
        				<%=dto.getSangpum() %><br>
        				<b style="color: red;"><%=sale %>%</b>
        				<span style="float: right;">
        					<div style="color: gray; font-size: 12px;">
        						<%
        							int price=(int)(dto.getPrice()+dto.getPrice()*(sale/100.0));
        						%>
        						<strike><%=nf.format(price) %></strike>
        					</div>
        					<div style="color: black;">
        						<%=nf.format(dto.getPrice()) %>
        					</div>
        				</span>
        				</a>
        				</td>  
        				
        				<%
        					if((i+1)%4==0){%>
        						</tr><tr>
        					<%}i++;}
        					
        				%>   				
        			<%}
        			%>
        		</tr>
        	</table>
      		     			     			
      		</tr>
      	</table>
      </p>
    </div>
    <div id="tabs-bottom" class="container tab-pane fade"><br>
      <h3>하의</h3>
      <p><table class="table table-bordered" style="width: 1000px;">
      		<tr>
      			
      			<table class="shoptable table table-bordered" style="width: 1000px;">
        		<tr>
        			<%
								i=0;
        			for(ShopDto dto:list){
        				
        				if(dto.getCategory().equals("하의")){
        				//20-50까지 난수 발생
        				int sale=(int)(Math.random()*31)+20;
        			%>
        				<td>
        				
        				<a shopnum="<%=dto.getShopnum() %>" style="cursor: pointer;" class="godetail">
        				<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo">
        				<br>
        				<%=dto.getSangpum() %><br>
        				<b style="color: red;"><%=sale %>%</b>
        				<span style="float: right;">
        					<div style="color: gray; font-size: 12px;">
        						<%
        							int price=(int)(dto.getPrice()+dto.getPrice()*(sale/100.0));
        						%>
        						<strike><%=nf.format(price) %></strike>
        					</div>
        					<div style="color: black;">
        						<%=nf.format(dto.getPrice()) %>
        					</div>
        				</span>
        				</a>
        				</td>  
        				
        				<%
        					if((i+1)%4==0){%>
        						</tr><tr>
        					<%}i++;}
        					
        				%>   				
        			<%}
        			%>
        		</tr>
        	</table>
      		     			     			
      		</tr>
      	</table></p>
    </div>
    <div id="tabs-acc" class="container tab-pane fade"><br>
      <h3>악세사리</h3>
      <p><table class="table table-bordered" style="width: 1000px;">
      		<tr>
      			
      			<table class="shoptable table table-bordered" style="width: 1000px;">
        		<tr>
        			<%
        			i=0;
        			for(ShopDto dto:list){
        				
        				if(dto.getCategory().equals("악세사리")){
        				//20-50까지 난수 발생
        				int sale=(int)(Math.random()*31)+20;
        			%>
        				<td>
        				
        				<a shopnum="<%=dto.getShopnum() %>" style="cursor: pointer;" class="godetail">
        				<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo">
        				<br>
        				<%=dto.getSangpum() %><br>
        				<b style="color: red;"><%=sale %>%</b>
        				<span style="float: right;">
        					<div style="color: gray; font-size: 12px;">
        						<%
        							int price=(int)(dto.getPrice()+dto.getPrice()*(sale/100.0));
        						%>
        						<strike><%=nf.format(price) %></strike>
        					</div>
        					<div style="color: black;">
        						<%=nf.format(dto.getPrice()) %>
        					</div>
        				</span>
        				</a>
        				</td>  
        				
        				<%
        					if((i+1)%4==0){%>
        						</tr><tr>
        					<%}i++;}
        					
        				%>   				
        			<%}
        			%>
        		</tr>
        	</table>
      		     			     			
      		</tr>
      	</table></p>
    </div>
    <div id="tabs-shose" class="container tab-pane fade"><br>
      <h3>신발</h3>
      <p><table class="table table-bordered" style="width: 1000px;">
      		<tr>
      			
      			<table class="shoptable table table-bordered" style="width: 1000px;">
        		<tr>
        			<%
        			i=0;
        			for(ShopDto dto:list){
        				
        				if(dto.getCategory().equals("신발")){
        				//20-50까지 난수 발생
        				int sale=(int)(Math.random()*31)+20;
        			%>
        				<td>
        				
        				<a shopnum="<%=dto.getShopnum() %>" style="cursor: pointer;" class="godetail">
        				<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo">
        				<br>
        				<%=dto.getSangpum() %><br>
        				<b style="color: red;"><%=sale %>%</b>
        				<span style="float: right;">
        					<div style="color: gray; font-size: 12px;">
        						<%
        							int price=(int)(dto.getPrice()+dto.getPrice()*(sale/100.0));
        						%>
        						<strike><%=nf.format(price) %></strike>
        					</div>
        					<div style="color: black;">
        						<%=nf.format(dto.getPrice()) %>
        					</div>
        				</span>
        				</a>
        				</td>  
        				
        				<%
        					if((i+1)%4==0){%>
        						</tr><tr>
        					<%}i++;}
        					
        				%>   				
        			<%}
        			%>
        		</tr>
        	</table>
      		     			     			
      		</tr>
      	</table></p>
    </div>
  </div>
</div>

</body>
</html>