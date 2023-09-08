<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.findpass}">
		<h2>찾으시는 아이디 : ${sessionScope.findId}</h2>
	</c:when>
	<c:otherwise>
		<h2>찾으시는 비밀번호 : ${sessionScope.findpass}</h2>
	</c:otherwise>
</c:choose>
<% session.removeAttribute("findId"); 
 session.removeAttribute("findpass");
%>
</body>
</html>