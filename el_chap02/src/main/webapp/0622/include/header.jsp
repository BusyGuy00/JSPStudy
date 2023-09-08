<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%	
	String siteTitle = request.getParameter("title");
	Calendar cal = (Calendar) request.getAttribute("time");
%>
<body>
	<div>
		<h1><%= siteTitle %> </h1>
			<ul>
				<li>menu1</li>
				<li>menu2</li>
				<li>menu3</li>	
			</ul>
			<p> 
			 현재 시간은 <%=Calendar.HOUR %>시
			 <%=Calendar.MINUTE %>분
			 <%=Calendar.SECOND %>초 입니다.
			 </p>
	</div>
</body>
</html>