<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.MyfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String,Object> param = new HashMap<>();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>DB에 등록된 파일 목록 보기</h2>
	<a href="fileUpload.jsp"> 파일 등록하기</a>
	<%
		MyfileDAO dao = new MyfileDAO();
		List<MyfileDTO> filelist = dao.myfilelist();
		dao.close();
		//작동하는지 확인하는 방법 
		//String saveD = application.getRealPath("./uploads");
		//out.println(saveD);
	%>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>카테고리</td>
			<td>원본파일명</td>
			<td>저장된파일명</td>
			<td>작성일</td>
		</tr>
		<% for(MyfileDTO f: filelist){
		%>
		<tr >
			<td><a href="view/fileview.jsp?idx=<%= f.getIdx() %>"><%= f.getIdx() %></a></td>
			<td><%= f.getName()%></td>
			<td><%= f.getTitle() %></td>
			<td><%= f.getCate() %></td>
			<td><%= f.getOfile() %></td>
			<td><img src="./uploads/<%=f.getSfile() %>" width="100"></td>
			<td><%= f.getPostdate() %></td>
		</tr>
		<%
		} 
		%>
	</table>


</body>
</html>






