package book;

import java.sql.SQLException;

import common.JDBCConnect;

public class BookDAO extends JDBCConnect {
	
	//게시글 추가 하기 
	public int insertBook(BookDTO dto) {
		
		int result = 0;
		String query =  "insert into book(번호,제목,글쓴이,출판사,가격,출판날짜)"
				+ "values(booknumber.nextval,?,?,?,?,sysdate)";
		try {
			System.out.println("왜"+query);
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getWrite());
			psmt.setString(3, dto.getPublisher());
			psmt.setString(4, dto.getPrice());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
