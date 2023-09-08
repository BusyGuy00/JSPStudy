<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../javascript/script.js"></script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script>off();</script>
</head>
<body>
	<form action="/book/member/memberidpass.do" method="post">
		<table class="write">
			<tr>
				<td>사용자이름</td>
				<td colspan="2"><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td rowspan="3">주소</td>
				<td><input type="text" id="sample6_postcode" placeholder="우편번호"></td>
				<td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" id="sample6_address" placeholder="주소" name="address"></td>
			</tr>
			<tr>
				<td><input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address2"></td>
				<td><input type="text" id="sample6_extraAddress" placeholder="참고항목"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="아이디찾기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>