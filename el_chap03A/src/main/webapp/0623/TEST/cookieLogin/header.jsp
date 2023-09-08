<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>그린 컴퓨터 아카데미</h2>
<div>
	<form method="post" action="login.jsp">
		<table>
			<tr>
				<td>green</td>
				<td>
				<%
					Cookie[] cookies = request.getCookies();
					boolean islogin = false;
					if(cookies.length > 0) {
						for(Cookie cookiev : cookies){
							if(cookiev.getName().equals("userId")
									&& cookiev.getValue().equals("admin")
									&& cookiev.getName().equals("userPas")
									&& cookiev.getValue().equals("1234")){
								islogin = true;
							}
						}
					}
					if(islogin){
					%>
					<button type="button"><a href="logout_process.jsp">로그아웃 </a></button>
					|
					<button type="button">정보수정</button>
					<% 
					}
					else{
						%>
						<button type="button"><a href="login.jsp">로그인</a></button>
							|
						<button type="button">회원가입</button>
						<% 	
					}
				%>
				</td>
				
			</tr>
		</table>
	
	</form>
</div>
</body>
</html>