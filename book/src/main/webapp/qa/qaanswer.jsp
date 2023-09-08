<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../javascript/script.js"></script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
	<form name="answerForm" method="post" action="qaanswer.do" onsubmit="return anvalidateForm(this)">
		<table class="write">
		 <tr>
		 	<td>답변</td>
		 	<td><textarea name="answer"></textarea>
		 		<input type="hidden" name="idx" value="${param.idx}" />
		 	</td>
		 </tr>
		 <tr>
		 <td colspan="2">
		 	<button type="submit">완료</button>
		 	<button type="reset">취소</button>
		 	<button type="button" onclick="location.href='/book/qa.do'">목록</button>
		 </td>
		 </tr>
		</table>
	</form>
</body>
</html>