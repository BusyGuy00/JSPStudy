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
<link href="../css/style.css" rel="stylesheet" type="text/css">
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
	<div id="QalistPage">
	<form method="get">
		<div class="QalistSearch">
			<select name="searchField">
				<option value="제목">제목</option>
				<option value="내용">내용</option>
			</select>
			<input id="QasearchWord" name="searchWord" type="text" />
			<input id="QasearchWordSubmit" type="submit" value="" />
		</div>
		<jsp:include page="../book/ca.jsp"></jsp:include>
	</form>
	</div>
	<div class="QalistBord">
		<ul class="QaView">
		<li>번호</li>
		<li>제목</li>
		<li>게시일</li>
		<li>내용</li>
		</ul>
		<c:choose>
		<c:when test="${empty qalist}">
			<ul>
			<li>게시글이 없습니다.</li>
			</ul>
		</c:when>
		<c:otherwise>
		<c:forEach items="${qalist}" var="row" varStatus="loop">
			<ul class="QaView">
				<li><a href="qaview.do?idx=${row.idx}">${row.title}</a></li>
				<li><c:choose>
				<c:when test="${empty row.title}">X</c:when>
				<c:otherwise>O</c:otherwise>
				</c:choose>
				</li>
				<li>${row.postdate}</li>
				<li>
				<c:choose>
				<c:when test="${empty row.recontent}">X</c:when>
				<c:otherwise>O</c:otherwise>
				</c:choose>
				</li>
			</ul>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		</div>
		<div id="QaBtn">
			${map.pagingStr}
			<button onclick="location.href='qawrite.do'">글쓰기</button>
		</div>
</body>
</html>