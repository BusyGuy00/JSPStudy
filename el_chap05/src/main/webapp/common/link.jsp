<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul>
	<%
		if(session.getAttribute("UserName")!= null){
	%>
		<li><a href="/el_chap05/login/logout_process.jsp">로그아웃</a></li>
		<li><a href="/el_chap05/join/memberlist.jsp">회원목록</a></li>
	<%		
			
		}else{
	%>
		<li><a href="/el_chap05/login/login.jsp">로그인</a></li>
		<li><a href="/el_chap05/join/joinForm.jsp">회원가입</a></li>
	<%		
			
		}
	%>

	<li><a href="/el_chap05/board/boardlist.jsp">게시판</a></li>
</ul>