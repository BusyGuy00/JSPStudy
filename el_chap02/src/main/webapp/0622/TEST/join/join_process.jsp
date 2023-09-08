<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	request.setCharacterEncoding("utf-8");
%>
	<jsp:include page="join_header.jsp" flush="false"/>
	<p> 
		이름 : <%= request.getParameter("mname") %>
	</p>
	<p> 
		아이디 : <%= request.getParameter("mid") %>
	</p>
	<p> 
		비밀번호 : <%= request.getParameter("mpas") %>
	</p>
	<p> 
		이메일 : <%= request.getParameter("memail") %>
	</p>
	<p> 
		생년월일 : <%= request.getParameter("my") %>
				<%= request.getParameter("mm") %>
				<%= request.getParameter("md") %>
	</p>
	<p> 
		휴대폰번호 : <%= request.getParameter("mp") %>
	</p>
	<p> 
		인증번호입력 : <%= request.getParameter("mcheck") %>
	</p>
	


</body>
</html>