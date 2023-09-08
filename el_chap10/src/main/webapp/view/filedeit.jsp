<%@page import="fileupload.MyfileDTO"%>
<%@page import="fileupload.MyfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청할때 idx를 받아온다.
	String idx = request.getParameter("idx");
	//커넥션 연결 
	MyfileDAO dao = new MyfileDAO();
	//게시글 상세조회 메소드 호출해서 DTO타입의 객체 리턴 
	MyfileDTO dto = dao.selectView(idx);
	//pageContext로 등록하면 표현언어로 사용이 가능하다 
	pageContext.setAttribute("dto", dto);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>
<!-- 파일뷰에서 바디 안에 택 전부 가져 왔다  -->
	<h2>수정하기</h2>
<form action="../fileedit_process.jsp" method="post" enctype="multipart/form-data">
<table>
		<tr>
			<td>작성자</td>
			<!-- 딜리트 프로세스에 idx를 넘겨 주기 위해 히든으로 인풋을 만들었다  -->
			<td>
				<input type="hidden" name="idx" value="<%= dto.getIdx()%>"/>
				<input type="text" name="name" value="<%= dto.getName()%>"/>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="<%= dto.getTitle()%>"/></td>
			<!--<td> ${dto.idx}</td> -->
		</tr>
		<tr>
			<td>사진</td>
			<td><input type="file" name="attachedFile" required="required" /></td>
			<!--<td><img src="../uploads/${dto.sfile}" width="100"></td>  -->
		</tr>
		<tr>
			<td>카테고리</td>
			<td>
			<input type="checkbox" name="cate" value="사진"/> 사진
			<input type="checkbox" name="cate" value="과제"/> 과제
			<input type="checkbox" name="cate" value="워드"/> 워드
			<input type="checkbox" name="cate" value="음원"/> 음원
			<td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit">수정하기</button>
				<button type="reset">취소</button>
			</td>
		</tr>
</table>
</form>
	<script>
		let str = "<%=dto.getCate()%>";	//사진,과제,워드
		let strarr = str.split(","); //["사진",과제,워드]
		//strarr 이 배열이 있으면  checks에서 체크드를 ture로 바꿔줘서 수정하기에서 체크가 된다.
		let checks = document.querySelectorAll("input[type='checkbox']");
		checks.forEach(ch =>{
			if(strarr.includes(ch.value)){
				ch.checked=true;
			}
		})
	</script>

</body>
</html>