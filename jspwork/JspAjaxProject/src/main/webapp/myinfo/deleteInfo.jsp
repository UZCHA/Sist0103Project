<%@page import="myinfo.db.MyinfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num=request.getParameter("num");
MyinfoDao dao=new MyinfoDao();
dao.deleteMyinfo(num);
response.sendRedirect("infoList.jsp");

%>