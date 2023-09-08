<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 컨트롤러에서 제어한 것을 보여주는 jsp -->
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
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input name="searchWord" type="text"/>
			<input type="submit" value="검색"/>
		</div>
	</form>
	<!-- 목록 테이블 -->
	<table border ="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>출력이미지</td>
			<td>저자</td>
			<td>출판사</td>
			<td>리뷰수</td>
		</tr>
		
		<c:choose>
		
			<c:when test="${empty boardlists} ">
			<tr>
				<td colspan="6"> 등록된 게시물이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise> 
				<c:forEach items="${boardlists}" var="row" varStatus="loop">
				<tr>
					<td>${row.번호}</td>
					<td>${row.제목}</td>
					<td><a href="view.do?idx=${row.번호}">${row.출력이미지}</a></td>
					<td>${row.저자}</td>
					<td>${row.출판사}</td>
					<td>${row.리뷰수}</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div>
		${map.pagingStr}
		<button onclick="location.href='Write.do'">글쓰기</button>
	</div>
</body>
</html>













