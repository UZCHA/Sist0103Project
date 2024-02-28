<%@page import="test.Student"%>
<%@page import="java.util.Vector"%>
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
<h3>request에 Vector 저장 후 불러오는 연습</h3>
	
	<%
		Vector<Student> list=new Vector<>();
		list.add(new Student("김철수","중랑구",88));
		list.add(new Student("이영희","강남구",95));
		list.add(new Student("신지수","용산구",70));
		list.add(new Student("박남길","서초구",80));
		list.add(new Student("황희찬","노원구",90));
		
		//데이타 vector를 request에 저장
		request.setAttribute("list",list);
		
		//페이지 이동2: forward(url주소 안바뀜), redirect(url주소 바뀜)
		//<jsp:> 태그이동
		response.sendRedirect("stuRedirect_11.jsp");
	%>
	
	
</body>
</html>