<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="reqeustVar" value="리퀘스트변수값" scope="request" />

<c:import url="../inc/otherpage.jsp?userParam1=aaa&userParam2=bbb" var="contents"> 

</c:import>
<h2>다른문서에 삽입하기</h2>
${contents}
</body>
</html>