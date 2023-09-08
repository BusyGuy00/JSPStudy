<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//내장객체에 속성 추가하기
	pageContext.setAttribute("페이지스코프", "페이지영역");
	//pageContext.setAttribute("scopeValue", "페이지영역");
	String pageValue =(String) pageContext.getAttribute("scopeValue");
	request.setAttribute("requestValue", "리퀘스트영역");
	session.setAttribute("sessionValue", "세션영역");  
	application.setAttribute("application-Value", "애플리케이션영역");
	//application.setAttribute("applicationValue", "애플리케이션영역");  
	
	pageContext.setAttribute("scopeValue", "페이지 스코프");
	request.setAttribute("scopeValue", "리퀘스트 스코프");
	session.setAttribute("scopeValue", "세션 스코프");
	application.setAttribute("scopeValue", "애플리케이션 스코프");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>각 영역에 저장된 속성 읽기</h2>
	<p><%=pageValue%></p>
	<ul>
	<!--  
		객체 표현 발식 (",'모두 사용 가능 ) 영역명 생략가능하다!
		생략가능시 page-> request-> session-> application
		${pageScope.scopeValue}
		${pageScope["scopeValue"]}
		${pageScope['scopeValue']}  
		*속성명에 특수 기호나 한글이 있을떄는 대괄호만 사용 할 수 있다.
	-->
		<li>페이지 영역 : ${pageScope["페이지스코프"]}</li>
		<!--
		한글은 []만 인식이 가능 하다.
		<li>페이지 영역 : ${pageScope["페이지스코프"]}</li>  
		<li>페이지 영역 : ${pageScope.scopeValue}</li> 
		-->
		<li>리퀘스트 영역 : ${requestScope.requestValue}</li>
		<li>세션 영역 : ${sessionScope.sessionValue}</li>
		<li>페이지 영역 : ${applicationScope["application-Value"]}</li>  
		<!--
		특수기호가 들어가면 []만 인식이 가능 하다.
		<li>애플리케이션 영역 : ${applicationScope.applicationValue}</li> 출력이 안된다
		<li>페이지 영역 : ${applicationScope["application-Value"]}</li>  
		-->
	</ul>
	<!-- 영역 지정하지 않고 값을 주면 페이지 리퀘스트 세션 애플리케이션 우선 순위로 받아 올 수 있다. -->
	<p>${scopeValue}</p>
</body>
</html>