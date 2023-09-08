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
request.setCharacterEncoding("Utf-8");
%>
	<div>
		<h2> While Example</h2>
		<p>
			<%= request.getParameter("wh") %>
		</p>
		<P>
			<%= request.getParameter("set") %>
		</P>
	</div>
	<div>
		<%
			String wh = request.getParameter("wh");
			int number = Integer.parseInt(request.getParameter("set"));
			int count= 0;
			while(number>count) {
				%>
					<p> <%=wh%> <%= count+1 %></p>
				<% 
				count++;
			}	
		%>
		
	</div>
	
</body>
</html>

