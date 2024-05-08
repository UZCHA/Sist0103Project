<%@page import="org.json.simple.JSONObject"%>
<%@page import="test1.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name=request.getParameter("name");
String hp2=request.getParameter("hp2");
String id=request.getParameter("id");

TestDao dao=new TestDao();
String mempass=dao.passSearch(name, hp2, id);
JSONObject ob=new JSONObject();
ob.put("mempass", mempass);

%>
<%=ob.toString()%>