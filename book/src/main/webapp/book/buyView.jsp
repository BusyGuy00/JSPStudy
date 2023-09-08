<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../javascript/script.js"></script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script>buych(${result});
off();
</script>
</head>
<body>
	<table class="write">
		<tr>
			<td>책이름</td>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<td>저자</td>
			<td>${dto.writer}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${dto.price}</td>
		</tr>
		<tr>
			<td>구매자명</td>
			<td>${user.name}</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${user.id}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${user.address}</td>
		</tr>
		<tr>
			<td><button onclick="location.href='./list.do'">목록</button></td>
		</tr>
	</table>
</body>
</html>