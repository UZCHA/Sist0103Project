<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myworld.model.WorldDto"%>
<%@page import="myworld.model.WorldDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
WorldDao dao=new WorldDao();
String num=request.getParameter("num");
WorldDto dto=dao.getData(num);

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

JSONObject ob=new JSONObject();

ob.put("num", dto.getNum());
ob.put("writer", dto.getWriter());
ob.put("content", dto.getContent());
ob.put("avata", dto.getAvata());
ob.put("writeday", sdf.format(dto.getWriteday()));


%>
<!-- 이상태에서 보면 오류남 하지만 뒤에 주소에 ?num=입력하고 db에 저장되어있는 번호
입력하면 그 해당 번호에 대한 입력한 정보가 보입니다. -->
<%=ob.toString()%>