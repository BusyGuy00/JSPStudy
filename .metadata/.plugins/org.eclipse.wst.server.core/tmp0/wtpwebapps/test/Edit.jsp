<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>수정하기(Edit)</h2>
	<form name="editForm" method="post" enctype="multipart/form-data"
		action="edit.do" onsubmit="return validateForm(this)">
		<input type="hidden" name="idx" value="${dto.idx}"/>
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="name" value="${dto.name}"/></td>
			</tr>
			<tr>
				<td>출력이미지</td>
				<td><input type="file" name="ofile" value="${dto.ofile}"/></td>
				
			</tr>
			<tr>
				<td>삽입이미지</td>
				<td><input type="file" name="sfile" value="${dto.sfile}" /></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher" value="${dto.publisher}"/></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="writer" value="${dto.writer}"/></td>
			</tr>
			<tr>
				<td>소설 카테고리</td>
				<td>
					<input type="checkbox" name="cate" value="한국소설"/> 한국소설
					<input type="checkbox" name="cate" value="영미소설"/> 영미소설
					<input type="checkbox" name="cate" value="청소년소설"/> 청소년소설
					<input type="checkbox" name="cate" value="고전소설"/> 고전소설
				</td>
			</tr>
			<tr>
				<td>건강 카테고리</td>
				<td>
					<input type="checkbox" name="cate" value="뇌건강"/> 뇌건강
					<input type="checkbox" name="cate" value="한방치료"/> 한방치료
					<input type="checkbox" name="cate" value="자연건강"/> 자연건강
					<input type="checkbox" name="cate" value="질병치료"/> 질병치료
				</td>
			</tr>
			<tr>
				<td>기술/공학</td>
				<td>
					<input type="checkbox" name="cate" value="전기"/> 전기/전자
					<input type="checkbox" name="cate" value="자동차"/> 자동차/운전
					<input type="checkbox" name="cate" value="금속"/> 금속/재료
					<input type="checkbox" name="cate" value="대학교재"/> 대학교재
				</td>
			</tr>
			<tr>
				<td>외국어</td>
				<td>
					<input type="checkbox" name="cate" value="영어"/> 영어
					<input type="checkbox" name="cate" value="일본어"/> 일본어
					<input type="checkbox" name="cate" value="중국어"/> 중국어
					<input type="checkbox" name="cate" value="독일어"/> 독일어
				</td>
			</tr>
			<tr>
				<td>금액</td>
				<td><input type="text" name="price" value="${dto.price}" /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="2">
					<button type="submit">작성완료</button>
					<button type="reset">취소</button> <!-- ./mvcboard/list.do -->
					<button type="button" onclick="location.href='/book/list.do'">목록 바로가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>