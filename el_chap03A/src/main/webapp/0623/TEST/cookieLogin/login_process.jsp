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
	//abc
	String mIdCheck = request.getParameter("mId");
	String mPasCheck = request.getParameter("mPas");
	Cookie cookie = new Cookie("userId", "admin");
	Cookie cookie2 = new Cookie("UserPas","1234");


	

	if(cookie.getValue().equals(mIdCheck)&&cookie2.getValue().equals(mPasCheck)){	
		
		response.addCookie(cookie);
		response.addCookie(cookie2);
		
	}
	response.sendRedirect("index.jsp");
	
%>


</body>
</html>