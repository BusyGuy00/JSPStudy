package board;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;

public class BoardDAO extends JDBCConnect {
	
	public int insertBoard(BoardDTO bdto) {
		int result = 0;
		String sql = "insert into board values(seq_board_num.nextval,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, bdto.getNum());
			psmt.setString(2, bdto.getTitle());
			psmt.setString(3, bdto.getContent());
			psmt.setString(4, bdto.getId());
			psmt.setString(5, bdto.getPostdate());
			psmt.setString(6, bdto.getVisitcount());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//검색 조건에 맞는 게시글의 개수 반환 하기 
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		//게시글 수를 얻어오는 쿼리 작성
		String sql = "select count(*) from board";
		//검색요청이 있을경우 where절 추가하기 
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") 
			+ " like '%" + map.get("searchWord") 
			+ "%'";	
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalCount;
	}

	public List<BoardDTO> getboardlist(Map<String,Object> map){
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>(); 
		String sql = "select * from("
				+ "select tb.*, rownum rnum from("
				+ "select * from board ";
//		String sql = "select * from board";
		//sql = sql + " where title like '%제목1%'";
		//map에 검색어가 있으면
		//"select * from board where title like '%검색어%'"
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}
		//게시판 내림차순으로 설정 
		sql += " order by num desc) Tb"
				//10개만 보여 달라고 설정
				//?로 값을 받아 오게 한다.
				+ ") where rnum between ? and ?";
				//+ ") where rnum between 1 and 10";
		System.out.println(sql);
		try {
			//stmt = con.createStatement();
			//rs = stmt.executeQuery(sql);
			//psmt = con.prepareStatement(sql);
			//값을 받아와서 게시글 페이지를 설정 하기 위해 이렇게 바뀐다.
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				bdto.setNum(rs.getString("num"));
				bdto.setTitle(rs.getString("title"));
				bdto.setContent(rs.getString("content"));
				bdto.setId(rs.getString("id"));
				bdto.setPostdate(rs.getString("postdate"));
				bdto.setVisitcount(rs.getString("visitcount"));
				boardlist.add(bdto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardlist;
	}
	
	

	//게시글등록하기 
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		String query = "insert into board(num, title, content, id, postdate, visitcount)"
		 + " values(seq_board_num.nextval,?,?,?,sysdate,0) ";
		//동적 쿼리 작성
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	//게시글 하나만 조회하기
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		String query = "select * from board where num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	//지정한 게시글조회수 업데이트 하기 
	public void updateVisitcount(String num) {
		String query = "update board set visitcount=visitcount+1" 
						+" where num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//게시글 업데이트 하기 
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		String query = "update board set title=?, content=? where num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  result;
	}
	//게시글 삭제 하기 
	public int deletePost(String num) {
		int result = 0;
		String query = "delete from board where num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
