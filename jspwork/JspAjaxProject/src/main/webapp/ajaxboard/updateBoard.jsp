<%@page import="ajaxboard.AjaxBoardDao"%>
<%@page import="ajaxboard.AjaxBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String num= request.getParameter("unum");
String writer= request.getParameter("uwriter");
String subject= request.getParameter("usubject");
String content= request.getParameter("ucontent");
String avata= request.getParameter("uavata");

AjaxBoardDto dto=new AjaxBoardDto();
dto.setNum(num);
dto.setWriter(writer);
dto.setSubject(subject);
dto.setContent(content);
dto.setAvata(avata);


AjaxBoardDao dao=new AjaxBoardDao();
dao.updateBoard(dto);

//out.print("성공");
%>

