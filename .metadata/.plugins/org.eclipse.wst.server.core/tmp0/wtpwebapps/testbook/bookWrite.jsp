<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="writeForm" method="post" action="./bookwrite.do" >
		<table>
			<tr>
				<td>책이름</td>
				<td><input type="text" name="title"/></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="write"/></td>
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
				<td colspan="2">
					<button type="submit">작성완료</button>
					<button type="reset">취소</button>
				</td>
			</tr>
		</table>
	</form>
	

</body>
</html>