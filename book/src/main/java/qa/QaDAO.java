package qa;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;

public class QaDAO extends JDBCConnect {
	//게시물 조건 검색
	public List<QaDTO> selectQA(Map<String, Object> map){
		List<QaDTO> qlist = new ArrayList<>();
		String sql = "select * from "
				+ "( select tb.*,rownum rn from "
				+ "( select * from qa";
		if(map.get("searchWord") != null) {
			sql += " where "+map.get("searchField")
				+ " like '%"+map.get("searchWord")+"%'";
		}
		sql += " order by 번호 desc)"
				+ " tb)"
				+ " where rn between ? and ?";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				QaDTO dto = new QaDTO();
				dto.setIdx(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setPostdate(rs.getString(4));
				dto.setRecontent(rs.getString(5));
				qlist.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return qlist;
	}
	//게시물 갯수 조회
	public int selectCountqa(Map<String, Object> map) {
		int totalCount = 0;
		String sql = "select count(*) from qa";
		//검색 조건
		if(map.get("searchWord") != null) {
			sql += " where " +map.get("searchField")+" like"
					+ " '%"+map.get("searchWord")+"%'";
		}
		System.out.println(sql);
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
	//게시물 등록
	public int insertQA(QaDTO dto) {
		int result = 0;
		String sql = "insert into QA "
				+ "values(QA번호.nextval,?,?,sysdate,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getRecontent());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	//게시글 삭제
	public int deleteQA(String idx) {
		int result = 0;
		String sql = "delete from qa where 번호=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	//게시물 번호 조회
	public QaDTO selectQAN(String 번호) {
		QaDTO dto = new QaDTO();
		String sql = "select * from qa where 번호=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, 번호);
			rs = psmt.executeQuery();
			rs.next();
			dto.setIdx(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setContent(rs.getString(3));
			dto.setPostdate(rs.getString(4));
			dto.setRecontent(rs.getString(5));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	//게시글 답변 추가
	public int updateQA(String idx,String answer) {
		int result = 0;
		String sql = "update qa set 답변내용=? where 번호=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, answer);
			psmt.setString(2, idx);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
