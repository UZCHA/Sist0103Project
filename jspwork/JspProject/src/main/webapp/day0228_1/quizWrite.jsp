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
	String ibsadate=request.getParameter("ibsadate");
	String lunch=request.getParameter("jumsim");
	String []menu=request.getParameterValues("menu");
	
	%>
	
	<h4>결과<br>
	이름: <%=name %><br>
	입사일자: <%=ibsadate %><br>
	점심메뉴: <img src="<%=lunch%>" style="width: 150px"><br>
	건의하는 메뉴: 
	<%	
		if(menu==null)
		{%>
			<b>원하는 메뉴가 없습니다.</b>
		<%}else{
	
		for(int i=0;i<menu.length;i++)
		{%>
			[<%=menu[i] %>]&nbsp;&nbsp;
		<%}
		}
	
	%>
	</h4>
</body>
</html>