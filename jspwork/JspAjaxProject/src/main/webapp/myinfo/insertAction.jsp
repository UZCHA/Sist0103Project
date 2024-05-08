<%@page import="myinfo.db.MyinfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String hp1=request.getParameter("hp1");
String hp2=request.getParameter("hp2");
String hp3=request.getParameter("hp3");

String hp=hp1+"-"+hp2+"-"+hp3;
%>
<jsp:useBean id="dao" class="myinfo.db.MyinfoDao"/>
<jsp:useBean id="dto" class="myinfo.db.MyinfoDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
dto.setHp(hp);
dao.insertMyinfo(dto);
response.sendRedirect("infoList.jsp");
%>

<%
//위에도 아래도 모두 가능!
/*request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
String blood=request.getParameter("blood");
String birth=request.getParameter("birth");

String hp=request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");

MyinfoDto dto=new MyinfoDto();
dto.setName(name);
dto.setBlood(blood);
dto.setBirth(birth);
dto.setHp(hp);

MyinfoDao dao=new MyinfoDao();
dao.insertMyinfo(dto);
response.sendRedirect("infoList.jsp");*/
%>