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
<%
String num=request.getParameter("num");
IntroDao dao=new IntroDao();
IntroDto dto=dao.getOneData(num);
%>
<body>
<div style="margin: 30px 50px;">
	<Form action="updateAction.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">
		<table class="table table-bordered" style="width: 600px">
			<caption align="top""><h2><%=dto.getName()%>님의 자기소개 수정</h2></caption>			
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" class="form-control"
					required="required" style="width: 200px;" value="<%=dto.getName()%>">
				</td>
			</tr>
			
			<tr>
				<th>나이</th>
				<td>
					<input type="number" name="age" class="form-control" 
					value="<%=dto.getAge() %>" style="width: 80px;">
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="date" name="birthday" class="form-control"
					value="<%=dto.getBirthday() %>" style="width: 200px;">
				</td>
			</tr>
			<tr>
				<th>거주지역</th>
				<td>
					<label><input type="radio" name="hometown" value="서울" 
					<%=dto.getHometown().equals("서울")?"checked":"" %>>서울</label>
					<label><input type="radio" name="hometown" value="경기"
					<%=dto.getHometown().equals("경기")?"checked":"" %>>경기</label>
					<label><input type="radio" name="hometown" value="인천"
					<%=dto.getHometown().equals("인천")?"checked":"" %>>인천</label>
					<label><input type="radio" name="hometown" value="대전"
					<%=dto.getHometown().equals("대전")?"checked":"" %>>대전</label>
					<label><input type="radio" name="hometown" value="부산"
					<%=dto.getHometown().equals("부산")?"checked":"" %>>부산</label>
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<!-- dto.getHobby()!="null"?"checked":"" 요렇게 해도 괜춘함 -->
					<label><input type="checkbox" name="hobby" value="독서"
					<%=dto.getHobby().contains("독서")?"checked":"" %>>독서</label>
					<label><input type="checkbox" name="hobby" value="영화"
					<%=dto.getHobby().contains("영화")?"checked":"" %>>영화</label>
					<label><input type="checkbox" name="hobby" value="산책"
					<%=dto.getHobby().contains("산책")?"checked":"" %>>산책</label>
					<label><input type="checkbox" name="hobby" value="운동"
					<%=dto.getHobby()!="null"?"checked":"" %>>운동</label>
					<label><input type="checkbox" name="hobby" value="명상"
					<%=dto.getHobby().contains("명상")?"checked":"" %>>명상</label>
				</td>
			</tr>
			<tr>
				<th>성격</th>
				<td>
					<textarea style="width: 500px; height: 100px" 
					placeholder="자유롭게 서술하세요." class="form-control" name="memo"><%=dto.getMemo() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success">수정</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='introList.jsp'">목록</button>
				</td>
			</tr>
		</table>
	</Form>

</div>
</body>
</html>