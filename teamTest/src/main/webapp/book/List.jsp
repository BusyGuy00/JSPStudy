<%@page import="java.util.List"%>
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
<script>on();</script>
<c:if test="${param.result eq '1'}">
<script>listinsertch();</script>
</c:if>
</head>
<body>
	<c:choose>
	<c:when test="${empty sessionScope.noaddress}">
		<c:choose>
		<c:when test="${empty sessionScope.UserId}">
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
	<!-- 검색  -->
	<form method="get">
		<div id="search">
			<select name="searchField" >
				<option value="이름">제목</option>
				<option value="저자">작가</option>
				<option value="금액">가격</option>
				<option value="카테고리">카테고리</option>
				<option value="출판사">출판사</option>
			</select>
			<input name="searchWord" type="text"/>
			<input type="submit" value="검색"/>
		</div>
	<!-- 카테고리 -->
		<jsp:include page="./ca.jsp"></jsp:include>
	</form>
		<c:choose>
			<c:when test="${empty booklist}">
			<ul>
				<li> 등록된 게시물이 없습니다.</li>
			</ul>
			</c:when>
			<c:otherwise> 
				<c:forEach items="${booklist}" var="row" varStatus="loop">
				<ul>
					<li>${row.idx}</li>
					<li>${row.name}</li>
					<li><a href="/book/book/view.do?idx=${row.idx}"><img src="../uploads/${row.sfile}" width="100"></a></li>
					<li>${row.writer}</li>
					<li>${row.publisher}</li>
					<li>${row.postdate}</li>
					<li>${row.price}</li>
				</ul>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	<div>
		${map.pagingStr}
		<c:if test="${sessionScope.UserId eq 'admin'}">
			<button onclick="location.href='./Write.jsp'">글쓰기</button>
		</c:if>
	</div>
</body>
</html>