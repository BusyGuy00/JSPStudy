<%@page import="book.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<form name="reviewWriteForm" method="post" enctype="multipart/form-data"
		action="/book/reviewWrite.do" onsubmit="return validateForm(this)">

		<table id="review_write">
			<tr>
				<td>책번호</td>
				<td><input type="text" name ="bookNumber" value="${param.idx}"></td>
			</tr>
			<tr>
				<td>이름</td>
					<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="content"/></td>
			</tr>
			<tr>
				<td>별점</td>
				<td>
					<div class="input_display">
					<input type="radio" name="score" value="1"/> 1
					<input type="radio" name="score" value="2"/> 2
					<input type="radio" name="score" value="3"/> 3
					<input type="radio" name="score" value="4"/> 4
					<input type="radio" name="score" value="5"/> 5
					</div>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="2">
					<button type="submit">작성완료</button>
					<button type="reset">취소</button> <!-- ./mvcboard/list.do -->
					<button type="button" onclick="location.href='/book/book/list.do'">목록 바로가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>