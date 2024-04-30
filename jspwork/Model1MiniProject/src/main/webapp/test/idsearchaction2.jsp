<%@page import="org.json.simple.JSONObject"%>
<%@page import="test1.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String name=request.getParameter("name2");
String email=request.getParameter("email2");

TestDao dao=new TestDao();
String memid= dao.idsearchtwo(name, email);
JSONObject ob=new JSONObject();
ob.put("memid", memid);


%>
<%=ob.toString() %>
