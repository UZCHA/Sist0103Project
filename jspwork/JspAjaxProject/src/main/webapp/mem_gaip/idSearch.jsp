<%@page import="mem_gaip.model.MemgaipDao"%>
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
function saveId(id){
	//alert(id);
	//부모창:opener
	opener.mfrm.m_id.value=id;
	window.close();//현재창 닫기
}

</script>
</head>
<body>
<%

	//일부러 null값으로 만든다(변수명은 아무거나 상관무)
	String key=request.getParameter("key");//처음호출시 null값이 호출됨
	if(key==null){
		//null값일 때 form을 나타냄
		%>
		<div style="margin: 10px 30px;">
			<form action="idSearch.jsp" method="post">
				<input type="hidden" name="key" value="yes">
				<b>아이디를 입력해주세요</b><br><br>
				<div class="d-inline-flex">
					<input type="text" name="m_id" class="form-control" style="width:130px;"
					required="required" placeholder="이이디 입력">
					<button type="submit" class="btn btn-success" style="margin-left:20px ">중복체크</button>
				</div>
			</form>
		</div>
		
	<%}else{		
		//action처리(action="idSearch.jsp")
		String m_id=request.getParameter("m_id");
		//dao선언 후 id가 db에 존재하는지 확인해야함
		MemgaipDao dao=new MemgaipDao();
		boolean b=dao.isIdcheck(m_id);
		
		if(b){
			//존재하는 경우
			%>
			<div style="margin: 50px 50px;">
				<h5>[<%=m_id %>]는 이미 가입된 아이디입니다.</h5>
				<img alt="" src="../image/jquery_img/image_01.png" width="60"align="left">
				<button type="button" class="btn btn-danger" onclick="location.href='idSearch.jsp'">다시 입력</button>
			</div>
		<%}else{
			%>
			<div style="margin: 50px 50px;">
				<h5>[<%=m_id %>]는 사용가능한 아이디입니다.</h5>
				<img alt="" src="../image/jquery_img/image_03.png" width="60"align="left">
				<button type="button" class="btn btn-info" onclick="saveId('<%=m_id%>')">적용하기</button>
				<button type="button" class="btn btn-danger" onclick="location.href='idSearch.jsp'">다시 입력</button>
			</div>
		<%}
	
	
	}
%>
</body>
</html>