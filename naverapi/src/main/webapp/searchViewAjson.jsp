<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	//html문서의 로딩이 완료되면 내부의 코드가 실행되도록 한다.
	$(function() {
		//버튼(searchBtn) 클릭하면 api요청 
		$("#searchBtn").click(function() {
			console.log("aaaaaaa");
			$.ajax({
				url: "./NaverSearchAPI.do",
				type : "get" ,
				data : {
					keyword : $("#keyword").val(),
					startNum : $("#startNum option:selected").val()
				},
				dataType : "json",		//응답 데이터 형식 
				success : sucFuncJson,	//요청 성공시 호출할 함수 
				error : errFunc			//요청 실패 시 호출할 함수 
			});
		})
	})
	//검색 성공시 결과를 화면에 출력 
	function sucFuncJson(d) {
		let str = "";
		//제이쿼리 포이치이다
		$.each(d.items, function(index,item) {
			str += "<ul>";
			str += "<li>"+(index+1)+"</li>";
			//객체의 속성값은 콘솔에서 볼 수 있다. 
			str += "<li>"+item.title+"</li>";
			str += "<li>"+item.description+"</li>";
			str += "<li>"+item.bloggername+"</li>";
			str += "<li>"+item.bloggerlink+"</li>";
			str += "<li>"+item.postdate+"</li>";
			str += "<li><a href='"+item.link+"' target='_blank'>바로가기</a></li>";
			str += "</ul>"
			//'_blank'는 새창을 띄워준다
		})
		$("#searchResult").html(str);
	}
	//실패시 경고창을 띄움
	function errFunc(e) {
		alert("실패 : " + e.status);
	}
	
</script>
</head>
<body>
<h2>검색해보세요</h2>
	<div>
		<div>
			<form id="searchform">
				한페이지에 10개씩 출력됨
				<select id="startNum">
					<option value="1"> 1페이지 </option>
					<option value="11"> 2페이지 </option>
					<option value="21"> 3페이지 </option>
					<option value="31"> 4페이지 </option>
					<option value="41"> 5페이지 </option>
				</select>
			</form>
			<input type="text" id="keyword" placeholder="검색어를 입력 하세요"/>
			<button type="button" id="searchBtn">검색요청</button>
		</div>
		<div class="row" id="searchResult">
			여기에 검색결과 출력
		</div>
	</div>
</body>
</html>