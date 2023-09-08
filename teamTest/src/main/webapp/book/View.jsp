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
<script>off();
reviewch(${result});
</script>
</head>
<body>
		<table id="book_table">
		<tr>
			<td rowspan="8" id="book_cover">
				<img src="../uploads/${dto.sfile}" width="200px">
			</td>
			<td>번호</td>
			<td>${dto.idx}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>${dto.cate}</td>
		</tr>
		<tr>
			<td>저자</td>
			<td>${dto.writer}</td>
		</tr>
		<tr>
			<td>금액</td>
			<td>${dto.price}</td>
		</tr>
		<tr>
			<td>발매일</td>
			<td>${dto.postdate}</td>
		</tr>
		<tr>
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
			<td>리뷰수</td>
			<c:choose>
			<c:when test="${empty dto.review}">
			<td>0</td>
			</c:when>
			<c:otherwise>
			<td>${dto.review}</td>
			</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td colspan="3">
			<c:if test="${sessionScope.UserId eq 'admin'}">
				<button onclick="location.href='/book/book/edit.do?idx=${dto.idx}'">수정하기</button>
				<button onclick="location.href='./delete.jsp?idx=${dto.idx}'">삭제하기</button>
			</c:if>
				<button onclick="location.href='./list.do'">목록보기</button>
			<c:choose>
				<c:when test="${empty sessionScope.UserId}"></c:when>
				<c:otherwise>
				<button onclick="location.href='/book/book/buy.do?idx=${dto.idx}'">구매하기</button>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		</table>
	
	<table id="view_review" class="댓글">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>내용</td>
			<td>별점</td>
		</tr>
		<c:choose>
			<c:when test="${empty reviewlists}">
			<tr>
				<td colspan="4"> 등록된 리뷰가 없습니다.</td>
			<tr>
			</c:when>
			<c:otherwise> 
				<c:forEach items="${reviewlists}" var="row" varStatus="loop">
				<tr>
					<td>${row.idx}</td>
					<td>${row.name}</td>
					<td>${row.content}</td>
				<c:choose>
					<c:when test="${row.score eq 1}">
						<td>★☆☆☆☆</td>
					</c:when>
					<c:when test="${row.score eq 2}">
						<td>★★☆☆☆</td>
					</c:when>
					<c:when test="${row.score eq 3}">
						<td>★★★☆☆</td>
					</c:when>
					<c:when test="${row.score eq 4}">
						<td>★★★★☆</td>
					</c:when>
					<c:otherwise>
						<td>★★★★★</td>
					</c:otherwise>
				</c:choose>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div id="comment_submit">
		${map.pagingStr} </br></br>
		<button onclick="location.href='../review/ReviewWrite.jsp?idx=${dto.idx}'">댓글쓰기</button>
	</div>

	
</body>
</html>