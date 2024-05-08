<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Grandiflora+One&family=Gugi&family=Hahmlet:wght@100..900&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#mainimg{
	border-radius: 100px;
	border: 1px solid gray;
	}
	
</style>
<script type="text/javascript">
function delfunc(num){
	//alert(num);
	$("#delnum").val(num);
	$("#myModal").modal('show');

	//삭제버튼 이벤트
	$("button.btndel").click(function(){
		
		//num, pass 읽기
		var num=$("#delnum").val();
		var pass=$("#delpass").val();
		
		//alert(num+","+pass);
		//삭제파일 호출
		location.href="member/deletemypage.jsp?num="+num+"&pass="+pass;
		$("#delpass").val("");
	})
		
	};
	
	/*$(function(){
		

	$("button.btndel").click(function(){
	
	var num=$("#delnum").val();
	var pass=$("#delpass").val();
	//alert(num);
	//alert(pass);
	
	$.ajax({
		type:"post",
		url:"member/deletemypage.jsp",
		dataType:"json",
		data:{"num":num,"pass":pass},
		success:function(res){
			//alert("성공");
			if(res.a=="true"){
				//alert("성공22");
				location.href='index.jsp';
			}else
				{
				//alert("실패");
				$("#delpass").val("");
				alert("비밀번호가 틀렸습니다.");
				
				}
		
			}
			
		})
		
	});

	})*/

</script>
</head>
<%
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMemberd();
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
	
	String loginok=(String)session.getAttribute("loginok");
	String myid=(String)session.getAttribute("myid");
%>
<body>
<div style=" margin: 100px 100px; width: 800px;">
		<table class="table table-bordered">
			<%
				for(MemberDto dto:list){
					if(loginok!=null && myid.equals(dto.getId())){
				
				%>
				<tr>
					<td rowspan="6" align="center"  valign="middle">
						<img src="image2/flower_ani/redhair9.PNG" style="width: 100px;" id="mainimg" >
					</td>
					<td>회원명:<%=dto.getName() %></td>					
				</tr>	
				<tr>
					<td>아이디:<%=dto.getId() %></td>
				</tr>
				<tr>
					<td>이메일:<%=dto.getEmail() %></td>
				</tr>
				<tr>
					<td>핸드폰:<%=dto.getHp()%></td>
				</tr>
				<tr>
					<td>주소:<%=dto.getAddr() %></td>
				</tr>
				<tr>
					<td>가입날짜: <%=sdf.format(dto.getGaipday()) %></td>			
				</tr>
				<tr>
				<td colspan="2" align="center">
						<button type="button" class="btn btn-outline-success"
						onclick="location.href='index.jsp?main=member/updatepassform.jsp?num=<%=dto.getNum()%>'">수정</button>
						<button type="button" class="btn btn-outline-danger" 
						onclick="delfunc('<%=dto.getNum()%>')">탈퇴</button>
				</td>
				</tr>
					
			<%}
			
			%>
			<%}%>
		</table>
</div>
<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content ">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">삭제확인</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body d-inline-flex">
      	<input type="hidden" id="delnum" >
        <b>삭제비밀번호</b>
        <input type="password" id="delpass" class="form-control" style="width: 120px;">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btndel" data-bs-dismiss="modal">삭제</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>