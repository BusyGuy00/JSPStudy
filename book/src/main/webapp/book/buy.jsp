<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../javascript/script.js"></script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script>off();</script>
</head>
<body>
	<table class="write">
		<tr>
			<td>번호</td>
			<td>${dto.idx}</td>
			<td>카테고리</td>
			<td>${dto.cate}</td>
		</tr>
		<tr>
			<td>저자</td>
			<td>${dto.writer}</td>
			<td>금액</td>
			<td>${dto.price}</td>
		</tr>
		<tr>
			<td>발매일</td>
			<td>${dto.postdate}</td>
			<td>남은 재고</td>
			<c:choose>
			<c:when test="${empty dto.each}">
			<td>0</td>
			</c:when>
			<c:otherwise>
			<td>${dto.each}</td>
			</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${dto.name}</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td colspan="3"><img src="../uploads/${dto.sfile}" width="200px" height="200px"></td>
		</tr>
		</table>
		<table class="write">
			<tr>
				<td>구매자명</td>
				<td>${user.name}</td>
			</tr>
			<tr>
				<td>구매자 아이디</td>
				<td>${user.id}</td>
			</tr>
			<tr>
				<td>구매자 주소</td>
				<td>${user.address}</td>
			</tr>		
			<tr>
				<td><button onclick="location.href='./buyview.do?idx=${dto.idx}&id=${user.id}'">구매확정</button></td>
				<td><button onclick="location.href='./list.do'">취소</button></td>
			</tr>
		</table>
</body>
</html>