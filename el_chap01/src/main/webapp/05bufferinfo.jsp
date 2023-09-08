<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="8kb" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버퍼 정보</title>
</head>
<body>
	<!-- 버퍼크기 크기 구하기 -->
	버퍼크기 : <%= out.getBufferSize() %>	
	<!-- 남은 버퍼 크기 크기 구하기 -->
	남은크기 : <%= out.getRemaining() %> 
	autoflush : <%= out.isAutoFlush() %>
</body>
</html> 