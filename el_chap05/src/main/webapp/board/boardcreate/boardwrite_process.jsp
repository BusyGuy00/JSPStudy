<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//폼에 입력값 받기 
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//DTO객체 생성후 DTO객체에 입력값 설정
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	//세션에서 값을 가져 오는 경우 강제 형 변환을하거나 읽을 수있게 해줘야 한다. 
	dto.setId(session.getAttribute("UserId").toString());
	//오라클 연결하고 메소드 호출 
	BoardDAO dao = new BoardDAO();
	int result = dao.insertWrite(dto);
	dao.close();
	if(result == 1){
	%>
	<script>
		alert("게시글이 등록되었습니다.");
		location.replace("../boardlist.jsp");
	</script>
	<%	
	}else{
	%>
		<script>
		alert("게시글이 등록이 실패 했습니다..");
		location.replace("../boardlist.jsp");
		</script>
	<%
		
	}
	
%>