<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("rename", "김그린");   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	request의 rename속성1 : ${rename} 
	request의 rename속성2 : <%=request.getAttribute("rename") %>
	
	request의 rename속성3 : %{requestScore.rename}<br/>
	code 파라미터 : ${param.code}
	<!-- ?code=ddd 라고 주소창에 입력해서 값을 넣어 준다.  -->
</body>
</html>