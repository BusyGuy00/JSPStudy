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
<h2>상세보기(View)</h2>
	<table border="1">
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
			<td>판매량</td>
			<c:choose>
			<c:when test="${empty dto.count}">
			<td>0</td>
			</c:when>
			<c:otherwise>
			<td>${dto.count}</td>
			</c:otherwise>
			</c:choose>
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
			<td>제목</td>
			<td colspan="3">${dto.name}</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td colspan="3"><img src="./uploads/${dto.ofile}" width="200px" height="200px"></td>
		</tr>
		<tr>
		<button onclick="location.href='./cart.do?idx=${dto.idx}'">장바구니</button>
		<button onclick="location.href='./bookorder.do?idx=${dto.idx}'">구매하기</button>
		</tr>
		<tr>
			<td colspan="4">
				<button onclick="location.href='./edit.do?idx=${dto.idx}'">수정하기</button>
				<button onclick="location.href='./Delet.jsp?idx=${dto.idx}'">삭제하기</button>
				<button onclick="location.href='./list.do'">목록보기</button>
			</td>
		</tr>
	</table>
	<table class="댓글">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>내용</td>
			<td>별점</td>
		</tr>
		<c:choose>
			<c:when test="${empty reviewlists} ">
			<tr>
				<td colspan="4"> 등록된 리뷰가 없습니다.</td>
			<tr>
			</c:when>
			<c:otherwise> 
				<c:forEach items="${reviewlists}" var="row" varStatus="loop">
				<tr>
					<td>${dto.idx}</td>
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
	<div>
		${map.pagingStr} 
		<button onclick="location.href='./reviewWrite.do?idx=${dto.idx}'">댓글쓰기</button>
	</div>

	
</body>
</html>