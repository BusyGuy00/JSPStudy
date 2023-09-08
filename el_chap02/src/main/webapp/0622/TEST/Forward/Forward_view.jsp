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
		String option = request.getParameter("bloodType");
		String Forward_viewURL = null;
		if(option.equals("A")){
			//response.sendRedirect("module/a.jsp");
			Forward_viewURL = "module/A.jsp";
		}else if(option.equals("B")){
			//response.sendRedirect("module/b.jsp");
			Forward_viewURL = "module/A.jsp";
			
		}else if(option.equals("O")){
			//response.sendRedirect("module/b.jsp");
			Forward_viewURL = "module/O.jsp";
		}else {
			//response.sendRedirect("module/c.jsp");
			Forward_viewURL = "module/AB.jsp";
		}
	%>
	<jsp:forward page="<%=Forward_viewURL %>"/>

	
</body>
</html>