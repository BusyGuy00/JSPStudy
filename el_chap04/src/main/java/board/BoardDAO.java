package board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import common.JDBCConnect;

public class BoardDAO extends JDBCConnect{
	public BoardDAO(ServletContext application) {
		super(application);
		
	}
	//게시글 목록 가져 오기(read)
	public List<BoardDTO> selectList(){
		List<BoardDTO> boardlist = new ArrayList<>();
		String query = "select * from board";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query); //실질적인 쿼리 값 받는것
			//레코드가 있으면 
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setPostdate(rs.getString("postdate"));
				boardlist.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardlist;
		
		}
	//게시글 데이터를 받아 DB에 추가 
			public int insertBoard(BoardDTO dto) {
				int result = 0;
			try {	
				String query = "insert into board(num,title, content, id, postdate,visitcount )"
						+"values("
						+"seq_board_num.nexrval,?,?,?,?,?)";
				psmt = con.prepareStatement(query);
				psmt.setString (1, dto.getTitle());
				psmt.setString(2, dto.getContent());
				psmt.setString(3, dto.getId());
				psmt.setString(5, dto.getPostdate());
				psmt.setString(6, dto.getVisitcount());
				result = psmt.executeUpdate(); //uqdate된 행의 개수를 리턴
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			return result;
	}
			
}
