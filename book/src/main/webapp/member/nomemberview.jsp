<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String aa = (String) request.getAttribute("intime");
	out.println(aa);
%>
</head>
<body>
	<div id="header">
		<jsp:include page="../header.jsp"></jsp:include>
		<div id="nomemberView">
			<table>
				<tr>
					<td>${sessionScope.UserId}님</td>
					<td>${intime} 인증완료</td>
				</tr>
			</table>
			<p><button onclick="location.href='/book/member/memberlogout.do'">인증취소</button></p>
		</div>
	</div>
</body>
</html>