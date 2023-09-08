<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../javascript/script.js"></script>
<script>off();</script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
	<h2>작성한 게시글은 수정 / 삭제가 불가능하오니 주의하시기바랍니다.</h2>
	<form name="writeForm" method="post" action="qawrite.do" onsubmit="return validateForm(this)">
		<table id="qa_write" class="write">
		 <tr>
		 	<td>제목</td>
		 	<td><input type="text" name="title"/></td>
		 </tr>
		 <tr>
		 	<td>내용</td>
		 	<td><textarea name="content"></textarea></td>
		 </tr>
		 <tr>
		 <td colspan="2">
		 	<button type="submit">완료</button>
		 	<button type="reset">취소</button>
		 	<button type="button" onclick="location.href='./qa.do'">목록</button>
		 </td>
		 </tr>
		</table>
	</form>
</body>
</html>