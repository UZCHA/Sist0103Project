<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Diphylleia&family=Gaegu&family=Nanum+Myeongjo&family=Single+Day&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	String grade = request.getParameter("grade");
	String[] lang = request.getParameterValues("lang");
	String like = request.getParameter("like");
	String weight = request.getParameter("weight");
	String height = request.getParameter("height");
	String ibsaday = request.getParameter("ibsaday");
	%>

	<h4>
		<b>***사원정보***</b><br>
		<br> 최종학력:
		<%=grade%><br> 
		가능한 컴퓨터 언어:
		<%
		if (lang == null) {
		%>
			<font color="green">가능한 언어가 없습니다</font>
		<%
		} else 
		{

			for (int i = 0; i < lang.length; i++) {
		%>
		[<%=lang[i]%>]&nbsp;&nbsp;
		<%
			}
		}
		%><br> 같은 조 하고싶은 사람: <%=like%><br> 
		나의 키: <%=height%>cm<br> 
		나의 몸무게: <%=weight%>kg<br> 
		입사한 날짜: <%=ibsaday%>
	</h4>
</body>
</html>