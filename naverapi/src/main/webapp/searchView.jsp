<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	<script>
		let btn = document.querySelector("#searchBtn");
		let skeyword = document.querySelector("#keyword");
		let num = document.querySelector("#startNum");
		btn.addEventListener("click",async function(){
			let text;
			//async 와 await을 가지고 대기를 하게 만든다.
			try {
				text = await getSearch();
				console.log(text);
				sucFuncJson(text.items);
			}
			catch(error){
				console.log(error);
			}
		}
		)
		//getSearch() 함수 호출시 원하는 검색 결과를 얻을 수 있다 .
		function getSearch() {
			//중요하다 잘 기억해 두자
			const response = fetch("./NaverSearchAPI.do?keyword="+skeyword.value
					+"&startNum="+num.value);
			return response.then(res=>res.json());
		}
		//실제 화면에 나타낼 함수 
		function sucFuncJson(data) {
			let str = "";
			data.forEach((item, index)=>{
				str += "<ul>";
				str += "<li>"+(index+Number(num.value))+"</li>";
				//객체의 속성값은 콘솔에서 볼 수 있다. 
				str += "<li>"+item.title+"</li>";
				str += "<li>"+item.description+"</li>";
				str += "<li>"+item.bloggername+"</li>";
				str += "<li>"+item.bloggerlink+"</li>";
				str += "<li>"+item.postdate+"</li>";
				str += "<li><a href='"+item.link+"' target='_blank'>바로가기</a></li>";
				str += "</ul>";
				//'_blank'는 새창을 띄워준다
			})
			//forEach를 이용한 str의 값을 innerHTML를 통해 출력이 가능해 진다.
			document.querySelector("#searchResult").innerHTML = str;
		}
	</script>
</body>
</html>








