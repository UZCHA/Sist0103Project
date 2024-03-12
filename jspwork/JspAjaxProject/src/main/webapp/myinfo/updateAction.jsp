<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="myinfo.db.MyinfoDao"%>
<%@page import="myinfo.db.MyinfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String num=request.getParameter("num");
String name=request.getParameter("name");
String blood=request.getParameter("blood");
String birth=request.getParameter("birth");

String hp=request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");


MyinfoDto dto=new MyinfoDto();
dto.setNum(num);
dto.setName(name);
dto.setHp(hp);
dto.setBlood(blood);
dto.setBirth(birth);

 MyinfoDao dao=new MyinfoDao();
 dao.updateMyinfo(dto);
 
 response.sendRedirect("infoList.jsp");

%>