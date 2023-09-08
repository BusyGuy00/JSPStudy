package book;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import review.ReviewDTO;

//@WebServlet("/bookorder.do")
public class OrderController extends HttpServlet {
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		////뷰 idx 불러오기 
		BookDAO dao = new BookDAO();
		String idx = req.getParameter("idx");
		//게시글 조회하기
		BookDTO dto = dao.selectView(idx);
		//조회후 연결 끊기 
		dao.close();
		req.setAttribute("dto", dto);
		
		
		Map<String, Object> map = new HashMap<>();
		OrderBookDAO dao2 = new OrderBookDAO();
		List<OrderBookDTO> reviewlists = dao2.orderListPage(map);
		dao2.close();
		req.setAttribute("reviewlists", reviewlists);
		//map이라는 변수에 위에 변수를 전부 담는다. 
		req.setAttribute("map", map);
		System.out.println(reviewlists);
		req.getRequestDispatcher("./Bookorder.jsp").forward(req, resp);
}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
