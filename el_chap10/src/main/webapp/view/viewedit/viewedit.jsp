<%@page import="fileupload.MyfileDTO"%>
<%@page import="fileupload.MyfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String idx = request.getParameter("idx");
	MyfileDAO dao = new MyfileDAO();
	MyfileDTO dto = dao.selectView(idx);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="viewedit_process.jsp" method="post">
<table>
		<input type="hidden" name="num" value="<%=dto.getIdx()%>"/>
		<tr>
			<td>제목</td>
			<td>
			<input type="text" name="title"
			value="<%= dto.getTitle()%>"/>
			</td>
		</tr>
		<tr>
			<td><%= dto.getCate() %></td>
			<td>카테고리</td>
			<td>
				<input type="checkbox" name="cate" value="사진"/> 사진
				<input type="checkbox" name="cate" value="과제"/> 과제
				<input type="checkbox" name="cate" value="워드"/> 워드
				<input type="checkbox" name="cate" value="음원"/> 음원
			</td>
		</tr>
		<tr>
			<td>사진</td>
			<td>
				<img src="../../uploads/<%=dto.getSfile() %>" width="100">
				<input type="file" name="attachedFile" />
			</td>
		</tr>
</table>
<button type="submit">수정하기</button>
<button type="reset">다시입력</button>
<button type="button" onclick="location.href='../../filelist.jsp'">목록보기</button>
</form>
</body>
</body>
</html>