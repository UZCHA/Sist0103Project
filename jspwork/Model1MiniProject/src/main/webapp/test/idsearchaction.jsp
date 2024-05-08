<%@page import="org.json.simple.JSONObject"%>
<%@page import="test1.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String name=request.getParameter("name");
String hp2=request.getParameter("hp2");

TestDao dao=new TestDao();
String memid= dao.idsearch(name, hp2);
JSONObject ob=new JSONObject();
ob.put("memid", memid);


%>
<%=ob.toString() %>
