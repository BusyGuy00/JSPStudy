<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../javascript/script.js"></script>
<script>off();</script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
	<table class="write">
		<tr>
			<td>번호</td>
			<td>${dto.idx}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${dto.postdate}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${dto.title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">${dto.content}</td>
		</tr>
		<tr>
			<td>답변내용</td>
			<td colspan="3">${dto.recontent}</td>
		<tr>
		<tr>
			<td colspan="3">
				<c:if test="${sessionScope.UserId eq 'admin'}">
				<button onclick="location.href='./qaanswer.jsp?idx=${dto.idx}'">답변</button>
				<button onclick="location.href='./qadeletcheck.jsp?idx=${dto.idx}'">삭제</button>
				</c:if>
				<button onclick="location.href='./qa.do'">목록</button>
			</td>
		</tr>
	</table>
</body>
</html>