<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../javascript/script.js"></script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<c:if test="${param.result eq '0'}">
<script>listinsertch();
off();
</script>
</c:if>
</head>
<body>
<h2>도서 목록 추가</h2>
	<form name="writeForm" method="post" enctype="multipart/form-data"
		action="/book/write.do" onsubmit="return livalidateForm(this)">
		<table class="write">
			<tr>
				<td>책 이름</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="ofile"/></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher"/></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="writer"/></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="number" name="Each"/></td>
			</tr>
			<tr>
				<td>소설 카테고리</td>
				<td>
					<div class="input_display">
					<input type="checkbox" name="cate" value="한국소설"/> 한국소설
					<input type="checkbox" name="cate" value="영미소설"/> 영미소설
					<input type="checkbox" name="cate" value="청소년소설"/> 청소년소설
					<input type="checkbox" name="cate" value="고전소설"/> 고전소설
					</div>
				</td>
			</tr>
			<tr>
				<td>건강 카테고리</td>
				<td>
					<div class="input_display">
					<input type="checkbox" name="cate" value="뇌건강b"/> 뇌건강
					<input type="checkbox" name="cate" value="한방치료b"/> 한방치료
					<input type="checkbox" name="cate" value="자연건강b"/> 자연건강
					<input type="checkbox" name="cate" value="질병치료b"/> 질병치료
					</div>
				</td>
			</tr>
			<tr>
				<td>기술/공학</td>
				<td>
					<div class="input_display">
					<input type="checkbox" name="cate" value="전기a"/> 전기/전자
					<input type="checkbox" name="cate" value="자동차a"/> 자동차/운전
					<input type="checkbox" name="cate" value="금속a"/> 금속/재료
					<input type="checkbox" name="cate" value="대학교재a"/> 대학교재
					</div>
				</td>
			</tr>
			<tr>
				<td>외국어</td>
				<td>
					<div class="input_display">
					<input type="checkbox" name="cate" value="영어"/> 영어
					<input type="checkbox" name="cate" value="일본어"/> 일본어
					<input type="checkbox" name="cate" value="중국어"/> 중국어
					<input type="checkbox" name="cate" value="독일어"/> 독일어
					</div>
				</td>
			</tr>
			<tr>
				<td>금액</td>
				<td><input type="number" name="price"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">작성완료</button>
					<button type="reset">취소</button>
					<button type="button" onclick="location.href='./List.jsp'">목록 바로가기</button>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>