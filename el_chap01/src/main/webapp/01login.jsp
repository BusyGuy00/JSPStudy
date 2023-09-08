<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("memberid");
	if(id != null && id.equals("green")){
		response.sendRedirect("While_Example.jsp");
	}else{
		%>
		<body>
			잘못된 아아디입니다.
		</body>
		<% 
		}
	%>
</body>
</html>