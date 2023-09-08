
<%@page import="utils.BoardPage"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//사용자가 입력한 검색 조건을 Map에 저장
	Map<String,Object> param = new HashMap<>();
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	if(searchWord != null) {
		param.put("searchField",searchField);
		param.put("searchWord",searchWord);
	}
	BoardDAO dao = new BoardDAO();
	//게기슬 수 확인
	int selectCount = dao.selectCount(param);
	out.println("게시글 수는 : " + selectCount);
	//1페이지당 보여지는 게시글 수 10
	int pageSize = 10;
	//블럭단위 
	int blockpages = 5;
	//전체 페이지 수 전체 게시글/1ㅠㅔ이지당 보여지는 게시글 수 ---> 올림하여 정수로 리턴
	int totalpages =(int) Math.ceil((double) selectCount/pageSize);
	//현재 페이지 
	int pageNum =1;
	//페이지 클릭시 요청하는 값을  받아서 pageTemp에 할당
	String pageTemp = request.getParameter("pageNum");
	
	//pageTemp가 null이 아니거나 ""아닐때
	//페이지문자를 숫자로 변환해서 pageNum에 할당
	if(pageTemp != null && !pageTemp.equals("")){
		pageNum = Integer.parseInt(pageTemp);
	}
	//게시글 페이지 받아 오기 위해 수정 
		//int start = 1;
		int start = (pageNum-1) * pageSize + 1;
		//int end = 10;
		int end = pageNum * pageSize;
		param.put("start", start);
		param.put("end", end);
	List<BoardDTO> blist = dao.getboardlist(param);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/link.jsp"></jsp:include>
<h2>게시판 목록</h2>
	<div>
		<form method="get">
			<select name="searchField">
				<option value="Title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord"/>
			<input type="submit" name="검색"/>
		</form>
	</div>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>아아디</td>
			<td>게시일</td>
			<td>조회수</td>
		</tr>
		<% 
			//리스트 항목이 비었는지 체크
			if(blist.isEmpty()){
				%>
				<tr>
					<td colspan="6">게시글이 없습니다.</td>
				</tr>
				<% 
			}else{
				for(BoardDTO dto: blist){
				%>
				<tr><!--  style=cursor:hand; onclick=location.href="boardview.jsp" -->
					<td><a href="boardview.jsp?num=<%=dto.getNum() %>"><%= dto.getNum() %></a></td>
					<td><%= dto.getTitle() %></td>
					<td><%= dto.getId()%></td>
					<td><%= dto.getPostdate() %></td>
					<td><%= dto.getVisitcount() %></td>
				</tr>
				<%
				}
			}
		%>
	
	</table>
	<div>
		<button onclick="location.href='boardcreate/boardwrite.jsp'">글쓰기</button>
	</div>
	<!-- 페이징 처리 -->
	<div>
		<%= BoardPage.pagingStr(selectCount, totalpages, pageSize, blockpages 
								,pageNum, request.getRequestURI()
								,request.getParameter("searchField")
								,request.getParameter("searchWord")) %>
	</div>
</body>
</html>