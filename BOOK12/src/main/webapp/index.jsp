<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBCConnect"%>
<%@page import="bookmember.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/include/header.jsp"%>
 <%@ include file="/include/fotter.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href= "css/style.css" rel="stylesheet" type="text.css">

</head>

<body>
<!-- <%
		//DB연결
		JDBCConnect jdbc = new JDBCConnect();
		//쿼리문 생성
		String sql = "select deptno, title, writer, publisher, price, publication from BOOK";
		Statement stmt = jdbc.con.createStatement();
		
		//쿼리수행
		ResultSet rs = stmt.executeQuery(sql);
		//결과확인
		while(rs.next()){
			String deptno = rs.getString("deptno");
			String title = rs.getString("title");
			String writer = rs.getString("writer");
			String publisher = rs.getString("publisher");
			String price = rs.getString("price");
			String publication = rs.getString("publication");
			
			out.println(String.format("%s %s %s %s %s %s", deptno, title, writer, publisher,price,publication) + "</br>");
			String a = request.getParameter("deptno");
			
		}
		jdbc.close();
	%> -->
	<section>
	<div>
	<h2>도서 목록</h2>
	<table>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>출판사</td>
		<td>가격</td>
		<td>출판날짜</td>
	</tr>
	
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	
	</table>
	</section>
	</div>
</body>
</html>