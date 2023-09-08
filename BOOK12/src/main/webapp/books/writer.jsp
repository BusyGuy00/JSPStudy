<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/include/header.jsp"%>
 <%@ include file="/include/fotter.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href= "/BOOK/css/style.css" rel="stylesheet"/>
</head>

<body>
	<div class="a">
	<h2>도서 목록</h2>
	<form method="post" action="writer_process.jsp" >
	<table>
	<tr>
	<td>번호 </td>
	<td><input type="text" name="deptno"/></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title"/></td>
	</tr>
	<tr>
		<td>작가</td>
		<td><input type="text" name="writer"/></td>
	</tr>
	<tr>
		<td>출판사</td>
		<td><input type="text" name="publisher"/></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" name="price"/></td>
	</tr>
	<tr>
		<td>출판날짜</td>
		<td><input type="date" name="publication"/></td>
	</tr>
	<tr>
		<td><input type="submit" value="도서등록"/></td>
		<td><input type="submit" value="취소"/></td>
	</tr>
	</table>
	</form>
	</div>

</body>
</html>