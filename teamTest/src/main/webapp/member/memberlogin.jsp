<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<jsp:include page="../header.jsp"></jsp:include>
			<div id="memberlogin">
		<form action="/book/member/memberlogin.do" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" /></td>
					<td></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="pass" /></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" value="로그인">
					<button type="button" onclick="location.href='/book/member/merberinsert.jsp'">회원가입</button>
					<button type="button" onclick="location.href='/book/member/memberidpass.jsp'">아이디/비밀번호 찾기</button>
					<button type="button" onclick="location.href='/book/member/nomemberlogin.jsp'">비회원인증</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</body>
</html>