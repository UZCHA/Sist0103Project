<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String num=request.getParameter("num");
String pass=request.getParameter("pass");

MemberDao dao= new MemberDao();

//비번체크해서 맞으면 삭제
boolean b=dao.isEqualPass(num, pass);

//JSONObject ob=new JSONObject();


if(b){
	dao.deleteMember(num);
	//세션삭제(로그인에 대한걸 삭제하겠다는 것)
	//회원탈퇴해도 타이틀에 자꾸 00님 로그인 중이라고 뜨기때문..
	session.removeAttribute("loginok");
	session.removeAttribute("myid");
	session.removeAttribute("saveok");
	%>
	<script type="text/javascript">
		alert("회원 탈퇴 성공.");
		location.href='../index.jsp';
	</script>
	<%
	//response.sendRedirect("../index.jsp");
	//ob.put("a", "true");

}else{
//ob.put("a", "false");
	%>
<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		history.back();
	</script>
<%}

%>

