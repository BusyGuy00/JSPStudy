<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 가입 페이지</h2>
	<form action="memberjoin_process.jsp" method="post">
	<p>아이디 : <input type="text" name="id" /></p>
	<p>비밀번호 : <input type="password" name="pwd" /></p>
	<p>이름 : <input type="text" name="name" /></p>
	<p><input type="submit" value="전송"></p>
	</form>


</body>
</html>