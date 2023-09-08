package member;

import java.sql.SQLException;

import common.JDBCConnect;

public class MeberDAO extends JDBCConnect {
	//회원가입
	public int insertMember(MeberDTO dto) {
		int result = 0;
		String sql = "insert into 서점회원 "
				+ "values(서점회원번호.nextval,?,?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getGender());
			psmt.setString(6, dto.getAge());
			psmt.setString(7, dto.getJob());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	//중복 회원 찾기
	public int selectMember(String id) {
		int result = 0;
		String sql = "select * from 서점회원 where 아이디=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	//로그인 회원
	public int loginMember(String id,String pass) {
		int result = 0;
		String sql = "select * from 서점회원 where 아이디=? and 비밀번호=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	//회원 아이디 찾기
	public MeberDTO memberid(String name,String address,String address2) {
		MeberDTO dto = new MeberDTO();
		String sql = "select 아이디,비밀번호 from 서점회원 where 이름=? and 주소=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, address+" "+address2);
			rs = psmt.executeQuery();
			rs.next(); 
			dto.setId(rs.getString(1));
			dto.setPass(rs.getString(2));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	//회원 비밀번호 찾기
	public MeberDTO memberpass(String id,String address,String address2) {
		MeberDTO dto = new MeberDTO();
		String sql = "select 아이디,비밀번호 from 서점회원 where 아이디=? and 주소=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, address+" "+address2);
			rs = psmt.executeQuery();
			rs.next();
			dto.setId(rs.getString(1));
			dto.setPass(rs.getString(2));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	//구매 회원 찾기
	public MeberDTO buymember(String id) {
		MeberDTO dto = new MeberDTO();
		String sql = "select * from 서점회원 where 아이디=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			rs.next();
			dto.setId(rs.getString(2));
			dto.setName(rs.getString(4));
			dto.setAddress(rs.getString(5));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
}
