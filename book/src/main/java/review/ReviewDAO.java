package review;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import book.BookDTO;
import common.JDBCConnect;

public class ReviewDAO extends JDBCConnect {

	// 검색 조건에 맞는 게시물의 개수를 반환 
			public int selectCount(Map<String,Object> map,String idx) {
				int totalCount = 0;
				String query = "select count(*) from 리뷰";
				//검색조건이 있으면 where절을 추가 하면 된다. 
				//검색 인풋에 selectWord을 사용 할 것이다.
				if(map.get("selectWord") != null) {
					//검색조건이 있으면 추가 해줘 
					query += " where " + map.get("searchField")+ " "
							+ " like '%"+map.get("searchWord")+"%'";
				}
				else {
					query += " where 책번호 ="+idx;
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
	public List<ReviewDTO> selectListPage(Map<String,Object> map,String idx){
		
		List<ReviewDTO> board = new ArrayList<>();
		String query = "select * from"
				+ " ( select Tb.*, rownum rNum from"
				+ " (select * from 리뷰 where 책번호 = ? order by 번호 desc)"
				+ " Tb)"
				+ " where rNum between ? and ?";
		
		//System.out.println(query); 신텍스 에러가 날때에는(try안에) query를 출력해보면 알 수 있다.
		try {
			psmt =con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.setString(2, map.get("start").toString());
			psmt.setString(3, map.get("end").toString());
			rs = psmt.executeQuery();
			//게시글 목록을 list 컬렉션에 추가 
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setScore(rs.getString(4));
				dto.setBookNumber(rs.getString(5));
				board.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}
	//댓글 추가 하기 
	public int ReviewinsertWrite(ReviewDTO dto ) {
		int result = 0;
		String query = "insert into 리뷰(번호,이름,내용,별점,책번호)"
				+ "values(책번호.nextval,?,?,?,?)";
			try {
				System.out.println(query+"인설트");
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getName());
				psmt.setString(2, dto.getContent());
				psmt.setString(3, dto.getScore());
				psmt.setString(4, dto.getBookNumber());
				result = psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return result;
	}
}
