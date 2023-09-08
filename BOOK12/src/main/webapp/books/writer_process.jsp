<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@page import="bookmember.BookDAO"%>
<%@page import="bookmember.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//로그인 폼으로 부터 받은 아이디와 패스워드
	String BookNo = request.getParameter("deptno");
	String BookTitle = request.getParameter("title");
	String Bookwriter = request.getParameter("writer");
	String Bookpublisher = request.getParameter("publisher");
	String Bookprice = request.getParameter("price");
	String Bookpublication = request.getParameter("publication");

	
	//db연결
			JDBCConnect jdbc = new JDBCConnect();
			
			String sql = "insert into book values(?,?,?,?,?, sysdate)";
			PreparedStatement psmt = jdbc.con.prepareStatement(sql);
			
			psmt.setString(1,BookNo);
			psmt.setString(2,BookTitle);
			psmt.setString(3,Bookwriter);
			psmt.setString(4,Bookpublisher);
			psmt.setString(5,Bookprice);

			
			//쿼리 수행
			int inResult = psmt.executeUpdate();
			out.println(inResult+ "행이 입력되었습니다.");
			
			jdbc.close();
			//response.sendRedirect("selectMember.jsp");
		%>
	
	
	
	