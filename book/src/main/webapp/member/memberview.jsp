<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<jsp:include page="../header.jsp"></jsp:include>
		<div id="loginView">
			<p>${sessionScope.UserId}님 로그인상태입니다.</p>
			<p><button onclick="location.href='/book/member/memberlogout.do'">로그아웃</button></p>
		</div>
	</div>
</body>
</html>