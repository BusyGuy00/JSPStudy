<%@page import="fileupload.MyfileDTO"%>
<%@page import="fileupload.MyfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx = request.getParameter("idx");
	MyfileDAO dao = new MyfileDAO();
	MyfileDTO dto = dao.selectView(idx);
	int result = dao.deletePost(idx);
		if (result == 1){
		%>
		<script>
			alert("게시글이 삭제 되었습니다.");
			location.replace("../filelist.jsp");
		</script>
		<% 
		} 
		else{
		%>
		<script>
			alert("게시글이 삭제에 실패 했습니다.");
			location.replace("../filelist.jsp");
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


</body>
</html>