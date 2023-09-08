<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie("userId","admin");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	response.sendRedirect("index.jsp");
%>