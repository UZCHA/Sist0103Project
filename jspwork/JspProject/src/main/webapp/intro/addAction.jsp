<%@page import="intro.model.IntroDao"%>
<%@page import="intro.model.IntroDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Diphylleia&family=Gaegu&family=Nanum+Myeongjo&family=Single+Day&family=Sunflower:wght@300&display=swap"
        rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String age=request.getParameter("age");
	String birthday=request.getParameter("birthday");
	String hometown=request.getParameter("hometown");
	String memo=request.getParameter("memo");
	
	String[] hobbies=request.getParameterValues("hobby");
	
	IntroDto dto=new IntroDto();
	dto.setName(name);
	dto.setAge(age);
	dto.setBirthday(birthday);
	dto.setHometown(hometown);
	dto.setMemo(memo);
	
	if(hobbies!=null){
		String s="";
		
		for(int i=0;i<hobbies.length;i++){
			s+=hobbies[i]+",";
	
		}
		s=s.substring(0,s.length()-1);
		dto.setHobby(s);
		
		
	}
	
	IntroDao dao=new IntroDao();
	dao.insertIntro(dto);
	
	response.sendRedirect("introList.jsp");
	
	%>
</body>
</html>