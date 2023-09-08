<%@page import="fileupload.MyfileDTO"%>
<%@page import="fileupload.MyfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청할때 idx를 받아온다.
	String idx = request.getParameter("idx");
	out.println(idx);
	//커넥션 연결 
	MyfileDAO dao = new MyfileDAO();
	//게시글 상세조회 메소드 호출해서 DTO타입의 객체 리턴 
	MyfileDTO dto = dao.selectView(idx);
	//pageContext로 등록하면 표현언어로 사용이 가능하다 
	pageContext.setAttribute("dto", dto);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상세보기</h2>
<table>
		<tr>
			<td>번호</td>
			<td><%= dto.getIdx()%></td>
			<!--<td> ${dto.idx}</td> -->
		</tr>
		<tr>
			<td>작성자</td>
			<td><%= dto.getName() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%= dto.getTitle() %></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td><%= dto.getCate()%></td>
		</tr>
		<tr>
			<td>사진명</td>
			<td><%= dto.getOfile() %></td>
		</tr>
		<tr>
			<td>사진</td>
			<td colspan="2"><img src="../uploads/<%= dto.getSfile() %>" width="100"></td>
			<!--<td><img src="../uploads/${dto.sfile}" width="100"></td>  -->
		</tr>
		<tr>
			<td>작성일</td>
			<td><%= dto.getPostdate() %></td>
		</tr>
</table>
<div>
	<form method="post" action="filedeit.jsp">
	<input type="hidden" name="idx" value="<%= dto.getIdx()%>"/>
	<button type="submit">수정하기</button>
	</form>
</div>
<div>

	<form method="post" action="filedelete_process.jsp">
	<input type="hidden" name="idx" value="<%= dto.getIdx()%>"/>
	<button type="submit">삭제하기</button>
	</form>
</div>

</body>
</html>