<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
 <%
	request.setCharacterEncoding("UTF-8");
	//수정내용 받기
	String idx = request.getParameter("idx");
	String title = request.getParameter("title");
	String sfile = request.getParameter("sfile");
	String cate = request.getParameter("cate");
	
	//DTO 객체에 저장 
	MyfileDTO dto = new MyfileDTO();
	dto.setCate(cate);
	dto.setTitle(title);
	dto.setSfile(sfile);
	dto.setIdx(idx);
	
	//데이터베이스 반영
	MyfileDAO dao = new MyfileDAO();
	//int result = dao.updateEdit(dto);
	dao.close();
	//성공 했을때 
	//if(result == 1) {
		response.sendRedirect("../fileview.jsp?idx=" + dto.getIdx());
		
	//}
	//실패 했을때
	//else{
		%>
		<script>
			alert("수정하기에 실패 했습니다.")
			location.replace("../fileview.jsp?dix=<%= dto.getIdx()%>")
		</script>
		//<%
		
	//}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>