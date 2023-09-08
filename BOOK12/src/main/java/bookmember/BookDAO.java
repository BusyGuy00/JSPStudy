package bookmember;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;



public class BookDAO extends JDBCConnect {
	public BookDAO(String drv, String url, String id, String pwd) {
		//부모 요소 에게 상속
		super(drv, url, id, pwd);
	}
	//사용자가 입력한 아이디/패스워드와 일치하는 회원정보를 반환
	public List<BookDTO> selectList (){
		List<BookDTO> booklist = new ArrayList<>();
		String query = "select * from BOOK";
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		try {
			while(rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setDeptno(rs.getString("deptno"));
				dto.setPrice(rs.getString("price"));
				dto.setPublisher(rs.getString("publisher"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setPublication(rs.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	} 
	
//		public BookDTO getBookDTO(String bid, String bpass) {
//			BookDTO dto = new BookDTO();
//			//인파라미터를 가진 쿼리문 
//			String query = "select * from member where id=? and pass=?";
//			try {
//				psmt = con.prepareStatement(query);
//				psmt.setString(1, bid);
//				psmt.setString(2, bpass);
//				rs = psmt.executeQuery();
//				//결과 처리 
//				if(rs.next()) {
//					//getString(컬럼명 또는 인덱스(1~...)) 은 레코드의 값들을 가지고 온다.
//					dto.setDeptno(rs.getString("deptno"));
//					dto.setPrice(rs.getString("price"));
//					dto.setPublisher(rs.getString("publisher"));
//					dto.setTitle(rs.getString("title"));
//					dto.setWriter(rs.getString("writer"));
//					dto.setPublication(rs.getString(6));
//					
//				}
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			return dto;
//		}
		
	

		
	
	
}
