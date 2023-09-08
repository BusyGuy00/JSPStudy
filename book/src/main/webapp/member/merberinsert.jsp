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
</head>
<body>
	<form action="memberinsert.do" method="post" onsubmit="return mevalidateForm(this)">
		<table class="write">
			<tr>
				<td>아이디</td>
				<td colspan="2"><input type="text" name="id" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td colspan="2"><input type="password" name="pass" /></td>
			</tr>
			<tr>
				<td>이름</td>
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
				<td>성별</td>
				<td colspan="2">
					<div class="input_display">
					<input type="radio" name="gender" value="남" checked="checked"/>남
					<input type="radio" name="gender" value="여" />여
					</div>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td colspan="2"><input type="text" name="age" /></td>
			</tr>
			<tr>
				<td>직업</td>
				<td colspan="2"><input type="text" name="job" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="회원가입" /></td>
				<td><input type="reset" value="취소" /></td>
				<td><button type="button" onclick="location.href='/book/index.jsp'">뒤로가기</button></td>
			<tr>
		</table>
	</form>
</body>
</html>