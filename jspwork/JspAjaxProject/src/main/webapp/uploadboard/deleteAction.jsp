<%@page import="java.io.File"%>
<%@page import="uploadboard.data.UploadBoardDao"%>
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
<%
String num=request.getParameter("num");
String pass=request.getParameter("pass");
UploadBoardDao dao=new UploadBoardDao();

boolean b=dao.isEqualPass(num, pass);

if(b){
	//게시글 지우기 전에 업로드된 이미지 지우기
	String imgName= dao.getData(num).getImgname();
	//업로드 경로 얻기
	String uploadPath=getServletContext().getRealPath("/save");	
	//파일생성
	File file=new File(uploadPath+"/"+imgName);
	//파일삭제
	if(file.exists())//파일이 존재하면
	{
		file.delete();//파일을 삭제하겠다
	}
	//파일을 삭제하고 그 다음이 db삭제
	dao.deleteUploadBoard(num);//db만 삭제되는것 'save'폴더에 가면 삭제한 이미지가 그대로있다!
	response.sendRedirect("boardList.jsp");
}else{%>
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		history.back();
	</script>
	
<%}

%>
<body>

</body>
</html>