<%@page import="org.json.simple.JSONObject"%>
<%@page import="test1.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String nick=request.getParameter("nick");
TestDao dao=new TestDao();
int nickcount=dao.nickcount(nick);

JSONObject ob=new JSONObject();
ob.put("nickcount", nickcount);

%>
<%=ob.toString() %>
