package book;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import common.JDBCConnect;



public class BookDAO extends JDBCConnect {
	// 검색 조건에 맞는 게시물의 개수를 반환 
		public int selectCount(Map<String,Object> map,String ca,String re) {
			int totalCount = 0;
			String query = "select count(*) from 책";
			//검색조건이 있으면 where절을 추가 하면 된다. 
			//검색 인풋에 selectWord을 사용 할 것이다.
			if(map.get("selectWord") != null) {
				//검색조건이 있으면 추가 해줘 
				query += " where " + map.get("searchField")+ " "
						+ " like '%"+map.get("searchWord")+"%'";
			}
			if(ca != null) {
				query += " where 카테고리 like '%"+ca+"%'";
			}
			if(re != null) {
				query += " where 리뷰수 = (select max(리뷰수) from 책)";
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
			public List<BookDTO> selectListPage(Map<String,Object> map,String ca,String re){
				
				List<BookDTO> board = new ArrayList<>();
				String query = "select * from ( select Tb.*, rownum rNum from ("
						+ "select * from 책";

				if(map.get("searchWord") != null) {
					query += " where " + map.get("searchField")
					+" like '%"+map.get("searchWord")+"%'";
				}
				if(ca != null) {
					query += " where 카테고리 like '%"+ca+"%'";
				}
				if(re != null) {
					query += " where 리뷰수 = (select max(리뷰수) from 책)";
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
						dto.setIdx(rs.getString(1));
						dto.setName(rs.getString(2));
						dto.setWriter(rs.getString(3));
						dto.setPublisher(rs.getString(4));
						dto.setOfile(rs.getString(5));
						dto.setSfile(rs.getString(6));
						dto.setCate(rs.getString(7));
						dto.setPrice(rs.getString(8));
						dto.setEach(rs.getString(9));
						dto.setCount(rs.getString(10));
						dto.setReview(rs.getString(11));
						dto.setPostdate(rs.getDate(12));
						board.add(dto);
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
				String query = "insert into 책(번호,이름,저자,출판사,삽입이미지,출력이미지,카테고리,금액,수량,판매량,리뷰수,발매일)"
						+ "values(책번호.nextval,?,?,?,?,?,?,?,?,?,?,sysdate)";
					try {
						psmt = con.prepareStatement(query);
						psmt.setString(1, dto.getName());
						psmt.setString(2, dto.getWriter());
						psmt.setString(3, dto.getPublisher());
						psmt.setString(4, dto.getSfile());
						psmt.setString(5, dto.getOfile());
						psmt.setString(6, dto.getCate());
						psmt.setString(7, dto.getPrice());
						psmt.setString(8, dto.getEach());
						psmt.setString(9, dto.getCount());
						psmt.setString(10, dto.getReview());
						result = psmt.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				return result;
			}
			//해당하는 게시글 DTO에 담아서 반환
			public BookDTO selectView(String name) {
				BookDTO dto = new BookDTO();
				String query = "select * from 책 where 번호 = ?";
				try {
					psmt = con.prepareStatement(query);
					psmt.setString(1, name);
					rs = psmt.executeQuery();
					
					if(rs.next()) {
						//조회된 레코드 값을 dto 객체의 필드값으로 지정 
						dto.setIdx(rs.getString(1));
						dto.setName(rs.getString(2));
						dto.setWriter(rs.getString(3));
						dto.setPublisher(rs.getString(4));
						dto.setOfile(rs.getString(5));
						dto.setSfile(rs.getString(6));
						dto.setCate(rs.getString(7));
						dto.setPrice(rs.getString(8));
						dto.setEach(rs.getString(9));
						dto.setCount(rs.getString(10));
						dto.setReview(rs.getString(11));
						dto.setPostdate(rs.getDate(12));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return dto;
			}
			//게시물 삭제하기 
			public int deletePost(String idx) {
				int result = 0;
				String query = "delete from 책 where 번호 = ?";
				
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, idx);
				result = psmt.executeUpdate();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
				return result;
			}
			//게시글 업데이트 하기  번호,이름,저자,출판사,삽입이미지,출력이미지,카테고리,금액,수량,판매량,리뷰수,발매일
			public int updatePost(BookDTO dto) {
				int result = 0;
				String query = "update 책 set name=?, writer=?, publisher=? "
						+ ",ofile=?, sfile=?, cate=?, price=?, each=?, count=? review=? where idx =? ";
				//쿼리문 준비
			
				try {
					
					psmt = con.prepareStatement(query);
					psmt.setString(1, dto.getName());
					psmt.setString(2, dto.getWriter());
					psmt.setString(3, dto.getPublisher());
					psmt.setString(4, dto.getSfile());
					psmt.setString(5, dto.getOfile());
					psmt.setString(6, dto.getCate());
					psmt.setString(7, dto.getPrice());
					psmt.setString(8, dto.getEach());
					psmt.setString(9, dto.getCount());
					psmt.setString(10, dto.getReview());
					psmt.setString(11, dto.getIdx());
					result = psmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return result;
			}

	}