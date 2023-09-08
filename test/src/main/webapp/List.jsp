<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>목록보기(List)</h2>
	<!-- 검색  -->
	<form method="get">
		<div>
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
	</form>
	<div>
		<p>카테고리</p>
		<ul>
			<a href="./list.do?ca=소설">소설</a>
			<li><a href="./list.do?ca=한국소설">한국소설</a></li>
			<li><a href="./list.do?ca=영미소설">영미소설</a></li>
			<li><a href="./list.do?ca=청소년소설">청소년소설</a></li>
			<li><a href="./list.do?ca=고전소설">고전소설</a></li>
		</ul>
		<ul>
			<a href="./list.do?ca=건강">건강</a>
			<li><a href="./list.do?ca=뇌건강">뇌건강</a></li>
			<li><a href="./list.do?ca=한방치료">한방치료</a></li>
			<li><a href="./list.do?ca=자연건강">자연건강</a></li>
			<li><a href="./list.do?ca=질병치료">질병치료</a></li>
		</ul>
		<ul>
			<a href="./list.do?ca=기술">기술/공학</a>
			<li><a href="./list.do?ca=전기">전기/전자</a></li>
			<li><a href="./list.do?ca=자동차">자동차/운전</a></li>
			<li><a href="./list.do?ca=금속">금속/재료</a></li>
			<li><a href="./list.do?ca=대학교재">대학교재</a></li>
		</ul>
		<ul>
			<a href="./list.do?ca=외국어">외국어</a>
			<li><a href="./list.do?ca=영어">영어</a></li>
			<li><a href="./list.do?ca=일본어">일본어</a></li>
			<li><a href="./list.do?ca=중국어">중국어</a></li>
			<li><a href="./list.do?ca=독일어">독일어</a></li>
		</ul>
		<a href="./list.do?re=1">최다 리뷰</a>
	</div>

		<c:choose>
			<c:when test="${empty booklists} ">
			<ul>
				<td colspan="6"> 등록된 게시물이 없습니다.</td>
			</ul>
			</c:when>
			<c:otherwise> 
				<c:forEach items="${booklists}" var="row" varStatus="loop">
				<ul>
					<li>${row.idx}</li>
					<li>${row.name}</li>
					<li><a href="/book/view.do?idx=${row.idx}"><img src="./uploads/${row.ofile}" width="100"></a></li>
					<li>${row.writer}</li>
					<li>${row.publisher}</li>
					<li>${row.postdate}</li>
					<li>${row.price}</li>
				</ul>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</ul>
	<div>
		${map.pagingStr}
		<c:choose>
		<c:when test="${sessionScope.UserId eq admin}">
		<button onclick="location.href='./Write.jsp'">글쓰기</button>
		</c:when>
		</c:choose>
	</div>
</body>
</html>