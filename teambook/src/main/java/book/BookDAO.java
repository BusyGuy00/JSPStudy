package book;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;



public class BookDAO extends JDBCConnect {
	// 검색 조건에 맞는 게시물의 개수를 반환 
	public int selectCount(Map<String,Object> map) {
		int totalCount = 0;
		String query = "select count(*) from 책";
		//검색조건이 있으면 where절을 추가 하면 된다. 
		//검색 인풋에 selectWord을 사용 할 것이다.
		if(map.get("selectWord") != null) {
			//검색조건이 있으면 추가 해줘 
			query += " where " + map.get("searchField")+ " "
					+ " like '%"+map.get("searchWord")+"%'";
		}
		try {
			// 쿼리문 생성
			stmt = con.createStatement(); 
			//쿼리문 실행
			rs = stmt.executeQuery(query);
			//다음 칸으로 커서를 옮긴 상태가 된다.
			rs.next();
			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		//게시물수를 반환
		return totalCount;
	}
	//검색 조건에 맞는 게시물 목록을 반환 
		public List<BookDTO> selectListPage(Map<String,Object> map){
			
			List<BookDTO> board = new ArrayList<>();
			String query = "select * from ( select Tb.*, rownum rNum from ("
					+ "select * from 책";

			if(map.get("searchWord") != null) {
				query += " where " + map.get("searchField")
				+" like '%"+map.get("searchWord")+"%'";
			}
			query += " order by 번호 desc"
					+ " ) Tb"
					+ " ) "
					+ "where rNum between ? and ?";
			//System.out.println(query); 신텍스 에러가 날때에는(try안에) query를 출력해보면 알 수 있다.
			try {
				
				psmt =con.prepareStatement(query);
				psmt.setString(1, map.get("start").toString());
				psmt.setString(2, map.get("end").toString());
				rs = psmt.executeQuery();
				//게시글 목록을 list 컬렉션에 추가 
				while(rs.next()) {
					BookDTO dto = new BookDTO();
					dto.set번호(rs.getString(1));
					dto.set이름(rs.getString(2));
					dto.set저자(rs.getString(3));
					dto.set출판사(rs.getString(4));
					dto.set삽입이미지(rs.getString(5));
					dto.set출력이미지(rs.getString(6));
					dto.set카테고리(rs.getString(7));
					dto.set금액(rs.getString(8));
					dto.set수량(rs.getString(9));
					dto.set판매량(rs.getString(10));
					dto.set리뷰수(rs.getString(11));
					dto.set발매일(rs.getDate(12));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return board;
		}
		//게시글 추가 하기 
		public int insertWrite(BookDTO dto) {
			int result = 0;
			String query = "insert into 책(번호, 이름, 저자, 출판사. 삽입이미지, 출력이미지, 카테고리, 금액, 수량, 판매량,리뷰수,발매일)"
					+ "values(책번호.nextval, ?,?,?,?,?,?,?,?,?,0,sysdate )";
				try {
					psmt = con.prepareStatement(query);
					psmt.setString(1, dto.get이름());
					psmt.setString(2, dto.get저자());
					psmt.setString(3, dto.get출판사());
					psmt.setString(4, dto.get삽입이미지());
					psmt.setString(5, dto.get출력이미지());
					psmt.setString(6, dto.get카테고리());
					psmt.setString(7, dto.get금액());
					psmt.setString(8, dto.get수량());
					psmt.setString(9, dto.get판매량());
					psmt.setString(10, dto.get리뷰수());
					psmt.setDate(11, (Date) dto.get발매일());
					result = psmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			return result;
		}
		
	
}
