<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인을 하지 않았다면 이전 페이지로 돌아가기 
	if(session.getAttribute("UserId") == null){
		%>
		<script>
		alert("로그인 후 게시판 글을 작성할 수 있습니다.");
		history.back();
		</script>
		<%
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../common/link.jsp"></jsp:include>
<h2>게시글 작성</h2>
	<form action="boardwrite_process.jsp" method="post">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
			<textarea name = "content">
			</textarea>
			</td>
		</tr>
	</table>
	<button type="submit">글 등록</button>
	<button type="reset">취소</button>
	</form>
	
</body>
</html>