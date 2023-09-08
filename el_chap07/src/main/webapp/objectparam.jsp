<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("personObj", new Person("김그린", 28));
//<jsp:forward로 인해서 위에 값은 버퍼에 담겨 있다가 지워지고 (출력이 안돼고) 흐름을 다른곳으로 넘기고 page="objectResult.jsp">에서 값을 가져 온다 
%>
 
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 영역을 통해 전달받은 객체 읽기</h2>
	<h2>객체 읽기</h2>
	<ul>
		<li>Person객체 이름 : ${personObj.name}</li>
		<li>Person객체 나이 : ${personObj.age}</li>
	</ul>
	
	<jsp:forward page="objectResult.jsp">
		<jsp:param name="firstNum" value="10"/>
		<jsp:param name="secondNum" value="20"/>
	</jsp:forward>

</body>
</html>
