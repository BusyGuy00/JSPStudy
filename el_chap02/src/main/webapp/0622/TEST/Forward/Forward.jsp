<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<h2>forward tag example</h2>
		<p> 혈액형별로 성격 테스트 </p>
		<p> 당신의 혈액형은 </p>
		<form action="Forward_re.jsp" method="post" >
			<p><input type="radio" name="bloodType" value="A">A형</p>
			<p><input type="radio" name="bloodType"  value="B">B형</p>
			<p><input type="radio" name="bloodType"  value="O">O형</p>
			<p><input type="radio" name="bloodType"  value="AB">AB형</p>
			<p>
				<button type="submit">보내기</button>
			</p>
		</form>
	</div>

</body>
</html>