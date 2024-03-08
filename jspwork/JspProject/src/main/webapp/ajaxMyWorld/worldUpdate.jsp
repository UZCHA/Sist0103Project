<%@page import="myworld.model.WorldDao"%>
<%@page import="myworld.model.WorldDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
//num,writer,content,avata 읽어오기
String num=request.getParameter("unum");
String writer=request.getParameter("uwriter");
String content=request.getParameter("ucontent");
String avata=request.getParameter("uavata");

WorldDto dto=new WorldDto();
dto.setNum(num);
dto.setWriter(writer);
dto.setContent(content);
dto.setAvata(avata);

WorldDao dao=new WorldDao();

dao.updateWorld(dto);


%>