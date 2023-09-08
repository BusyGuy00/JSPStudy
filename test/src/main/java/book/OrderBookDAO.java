package book;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;

public class OrderBookDAO extends JDBCConnect {
	public int orderInsert(OrderBookDTO dto) {
		int result = 0;
		String query = "insert into 주문(번호,이름,주문번호,책이미지,이미지,주문수량,상품금액,총상품금액)"
				+ "values(주문번호.nextval,?,?,?,?,?,?,?)";
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getBookName());
				psmt.setString(2, dto.getOrderNumber());
				psmt.setString(3, dto.getOfile());
				psmt.setString(4, dto.getSfile());
				psmt.setString(5, dto.getOrderCount());
				psmt.setString(6, dto.getPrice());
				psmt.setString(7, dto.getOrderPrice());
				result = psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return result;
	}
	public int updatePost(OrderBookDTO dto) {
		int result = 0;
		String query = "update 주문 set 상품번호=?, 상품이미지=?, 주문번호=? "
				+ ",주문수량=?,상품금액=?,총상품금액=? where idx =? ";
		//쿼리문 준비
	
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getIdx());
			psmt.setString(2, dto.getOfile());
			psmt.setString(3, dto.getOrderNumber());
			psmt.setString(4, dto.getOrderCount());
			psmt.setString(5, dto.getPrice());
			psmt.setString(6, dto.getOrderPrice());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public OrderBookDTO orderView(String idx) {
		OrderBookDTO dto = new OrderBookDTO();
		String query = "select * from 주문 where 번호 = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				//조회된 레코드 값을 dto 객체의 필드값으로 지정 
				dto.setIdx(rs.getString(1));
				dto.setOfile(rs.getString(2));
				dto.setOrderNumber(rs.getString(3));
				dto.setOrderCount(rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	public List<OrderBookDTO> orderListPage(Map<String,Object> map){
		
		List<OrderBookDTO> board = new ArrayList<>();
		String query = "select * from ( select Tb.*, rownum rNum from ("
				+ "select * from 주문";

		//System.out.println(query); 신텍스 에러가 날때에는(try안에) query를 출력해보면 알 수 있다.
		try {
			psmt =con.prepareStatement(query);
			rs = psmt.executeQuery();
			//게시글 목록을 list 컬렉션에 추가 
			while(rs.next()) {
				OrderBookDTO dto = new OrderBookDTO();
				dto.getIdx();
				dto.getOfile();
				dto.getOrderNumber();
				dto.getOrderCount();
				dto.getOrderPrice();
				dto.getPrice();
				board.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}
}
