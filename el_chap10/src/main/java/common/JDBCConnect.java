package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCConnect {
	public Connection con; // 데이터베이스 연결 
	public Statement stmt; // 정적 쿼리 
	public PreparedStatement psmt; // 동적 쿼리문 작성 
	public ResultSet rs; // select쿼리문 결과를 저장하는 타입 
	
	//기본생성자 
	public JDBCConnect() {
		//JDBC드라이버로드
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "green";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);	
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			System.out.println("JDBC연결 해제");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
	
}
