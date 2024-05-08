<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding"%>
<%@page import="java.awt.Stroke"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Grandiflora+One&family=Gugi&family=Hahmlet:wght@100..900&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String num=request.getParameter("num");
String name=request.getParameter("name");
String hp=request.getParameter("hp");
String addr=request.getParameter("addr");
String email=request.getParameter("email1")+"@"+request.getParameter("email2");

MemberDto dto=new MemberDto();
dto.setNum(num);
dto.setName(name);
dto.setHp(hp);
dto.setAddr(addr);
dto.setEmail(email);

MemberDao dao=new MemberDao();
dao.updateMember(dto);

response.sendRedirect("../index.jsp?main=member/mypage.jsp");

%>
</body>
</html>