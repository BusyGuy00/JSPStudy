<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function validateForm(form) {
		if(form.name.value == ""){
			//required를 지정하지 않고  alert으로 표출되기 원하면 required을 지우고 하면 된다.
			alert("작성자를 입력하세요")
			form.name.focus();
			return false;
		}
		if(form.title.value == ""){
			alert("제목을 입력하세요")
			form.title.focus();
			return false;
		}
		if(form.attachedFile.value == ""){
			alert("첨부파일 입력은 필수 입니다.")
			return false;
		}
			
	}
</script>
</head>
<body>
	<h3>파일 업로드</h3>
	<form method="post" enctype="multipart/form-data"
		action="uploadProcess.jsp" onsubmit="return validateForm(this)"> 
			<!--  validateForm은 인풋에 값이 없으면 false로 리턴하는 
				함수로 전송이 안됀다  this는 form을 뜻한다.-->
		<!-- required 필수 속성으로 지정 하는 방법 1-->
		<p>작성자 <input type="text" name="name" required/> </p>	
		<p>제목 <input type="text" name="title" required/> </p>	
		<p>카테고리 (선택사항) 
		<input type="checkbox" name="cate" value="사진"/> 사진
		<input type="checkbox" name="cate" value="과제"/> 과제
		<input type="checkbox" name="cate" value="워드"/> 워드
		<input type="checkbox" name="cate" value="음원"/> 음원
		</p>
		<p>
			<input type="file" name="attachedFile" />
		</p>	
		<p> <input type="submit" value="전송하기" /> </p>
	</form>

</body>
</html>