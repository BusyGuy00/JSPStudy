<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../javascript/script.js"></script>
<script>on();</script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<c:if test="">
<script></script>
</c:if>
</head>
<body>
	<c:choose>
	<c:when test="${empty sessionScope.noaddress}">
		<c:choose>
		<c:when test="${empty sessionScope.UserIn}">
		<jsp:include page="../member/memberlogin.jsp" />
		</c:when>
		<c:otherwise>
		<jsp:include page="../member/memberview.jsp" />
		</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<jsp:include page="../member/nomemberview.jsp"></jsp:include>
	</c:otherwise>
	</c:choose>
	<jsp:include page="../book/ca.jsp"></jsp:include>
	<form method="get">
		<div>
			<select name="searchField">
				<option value="제목">제목</option>
				<option value="내용">내용</option>
			</select>
			<input name="searchWord" type="text" />
			<input type="submit" value="검색" />
		</div>
	</form>
	<table>
		<tr>
			<td>제목</td>
			<td>내용</td>
			<td>작성일</td>
			<td>답변</td>
		</tr>
		<c:choose>
		<c:when test="${empty qalist}">
			<td colspan="4">게시글이 없습니다.</td>
		</c:when>
		<c:otherwise>
		<c:forEach items="${qalist}" var="row" varStatus="loop">
			<tr>
				<td><a href="qaview.do?idx=${row.idx}">${row.title}</a></td>
				<td><c:choose>
				<c:when test="${empty row.title}">X</c:when>
				<c:otherwise>O</c:otherwise>
				</c:choose>
				</td>
				<td>${row.postdate}</td>
				<td>
				<c:choose>
				<c:when test="${empty row.recontent}">X</c:when>
				<c:otherwise>O</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
	${map.pagingStr}
	<button onclick="location.href='qawrite.do'">글쓰기</button>
</body>
</html>