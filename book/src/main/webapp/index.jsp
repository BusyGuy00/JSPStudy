<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<c:choose>
		<c:when test="${empty sessionScope.noaddress}">
			<c:choose>
			<c:when test="${empty sessionScope.UserIn}">
			<jsp:include page="./member/memberlogin.jsp" />
			</c:when>
			<c:otherwise>
			<jsp:include page="./member/memberview.jsp" />
			</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<jsp:include page="./member/nomemberview.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
	<jsp:include page="/webchat/chat.jsp">
	<jsp:param name="chat" value="${sessionScope.admin}"/>
	</jsp:include>
</body>
<c:if test="${!empty sessionScope.noaddress}">
<script>sessionTime();</script>
</c:if>
</html>