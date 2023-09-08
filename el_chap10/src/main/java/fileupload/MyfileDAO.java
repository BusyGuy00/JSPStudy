package fileupload;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import common.JDBCConnect;

public class MyfileDAO extends JDBCConnect {
	//게시글 입력 insert메소드 
	public int insertFile(MyfileDTO dto) {
		int result = 0;
		String query = "insert into myfile("
				+ "idx,name,title,cate,ofile,sfile) values("
				+ "seq_myfile_num.nextval, ?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	//게시글 목록 가져오기
	public List<MyfileDTO> myfilelist(){
		List<MyfileDTO> filelist = new ArrayList<>();
		String query = "select * from myfile";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				MyfileDTO dto = new MyfileDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
				filelist.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return filelist;
	}
//	public List<MyfileDTO> getboardlist(Map<String,Object> map){
//		 List<MyfileDTO> boardlist = new ArrayList<MyfileDTO>();
//		 String sql= "select * from("
//					+ "select tb.*, rownum rnum from("
//					+ "select * from board ";
//		 sql += " order by num desc) Tb"
//				 + ") where rnum between ? and ?";
//		 System.out.println(sql);
//		 try {
//			psmt = con.prepareStatement(sql);
//			psmt.setString(1, map.get("start").toString());
//			psmt.setString(2, map.get("end").toString());
//			rs = psmt.executeQuery();
//			
//			while(rs.next()) {
//				MyfileDTO dto = new MyfileDTO();
//				dto.setIdx(rs.getString("idx"));
//				dto.setCate(rs.getString("cate"));
//				dto.setName(rs.getString("name"));
//				dto.setOfile(rs.getString("ofile"));
//				dto.setPostdate(rs.getString("postdate"));
//				dto.setSfile(rs.getString("sfile"));
//				dto.setTitle(rs.getString("title"));
//
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		 return boardlist;
//		 
//	}
	//게시글 상세 보기
	public MyfileDTO selectView(String idx) {
		MyfileDTO dto = new MyfileDTO();
		String query =  "select * from myfile where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			//rs를 통해 dto에 값을 넘겨 준다.
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setIdx(rs.getString("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	//게시글 업데이트 하기
//	public int updateEdit(MyfileDTO dto) {
//		int result = 0;
//		String query = "update myfile set title=?, content=? where idx=?";
//		try {
//			psmt = con.prepareStatement(query);
//			psmt.setString(1, dto.getTitle());
//			psmt.setString(2, dto.getSfile());
//			psmt.setString(3, dto.getCate());
//			psmt.setString(4, dto.getIdx());
//			
//			result = psmt.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return  result;
//	}
	//게시글 삭제 하기 
		public int deletePost(String idx) {
			int result = 0;
			String query = "delete from myfile where idx=?";
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
	//게시글 수정하기
		public int myfileedit(MyfileDTO dto) {
			int result = 0;
			//변경 시킬 것에 대한 설정 
			String query = "update myfile set title=?,"
					+ "name=?, cate=?, sfile=? where idx=?";
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getTitle());
				psmt.setString(2, dto.getName());
				psmt.setString(3, dto.getCate());
				psmt.setString(4, dto.getSfile());
				psmt.setString(5, dto.getIdx());
				result = psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				return result;
		}
	
}
























