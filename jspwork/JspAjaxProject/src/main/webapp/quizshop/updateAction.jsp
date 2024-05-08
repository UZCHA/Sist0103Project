<%@page import="quizshop.model.QuizShopDao"%>
<%@page import="quizshop.model.QuizShopDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num=request.getParameter("num");
String sang_name=request.getParameter("sang_name");
int price=Integer.parseInt(request.getParameter("price"));
String photo=request.getParameter("photo");
String ipgoday=request.getParameter("ipgoday");

QuizShopDto dto=new QuizShopDto();
dto.setNum(num);
dto.setSang_name(sang_name);
dto.setPhoto(photo);
dto.setPrice(price);
dto.setIpgoday(ipgoday);

QuizShopDao dao=new QuizShopDao();
dao.updateQuiz(dto);

response.sendRedirect("shopList.jsp");
%>