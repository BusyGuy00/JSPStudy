<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 영역을 통해 전달받은 객체 읽기</h2>
	<ul>
		<li>Person이름 : ${personObj.name}</li>
		<li>Person나이 : ${personObj.age}</li>
	</ul>
	<h2>포워드를 통해서 파라미터 전달 받기</h2>
	<ul>
		<li>firstNum : ${param.firstNum}</li>
		<li>secondNum : ${param.secondNum}</li>
	</ul>
</body>
</html>