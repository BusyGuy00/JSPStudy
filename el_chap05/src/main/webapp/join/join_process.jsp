<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	
	//DB 연결
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPass(pass);
	dto.setName(name);
	int result = dao.insertMember(dto);
	dao.close();
	out.println(result);
	
	
	
	//DAO를 생성하면 사용하지 않는다.
	//JDBCConnect jdbc = new JDBCConnect();
	//String sql = "insert into member values(?,?,?,sysdate)";
	//PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	//psmt.setString(1,id);
	//psmt.setString(2,pass);
	//psmt.setString(3,name);
	//쿼리 수행
	// inResult = psmt.executeUpdate();
	//out.println(inResult);
	
%>