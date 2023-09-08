<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="excuinsert.jsp">
	<p>아이디 입력 <input type="text" name="mid"> </p>
	<p>비밀번호 입력 <input type="text" name="mpas"></p>
	<p>이름 입력 <input type="text" name="mid"></p>
	<p><input type="submit"></p>
	</form>
	
</body>
</html>