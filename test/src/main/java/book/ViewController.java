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

import review.ReviewDAO;
import review.ReviewDTO;
import utils.BoardPaging;

@WebServlet("/view.do")
public class ViewController extends HttpServlet{ 
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		////게시물 불러오기 
		BookDAO dao = new BookDAO();
		//밑에 두 메소드다 idx가 필요한 메소드여서 idx 를 getparameter를 받는 메소드 생성 
		String idx = req.getParameter("idx");
		//게시글 불러 올때 조회수 업데이트 하기 
		//dao.upadateVisitcount(idx);
		//게시글 조회하기
		BookDTO dto = dao.selectView(idx);
		//조회후 연결 끊기 
		dao.close();
		req.setAttribute("dto", dto);
		
		//
		//DAO 생성 
		ReviewDAO dao2 = new ReviewDAO();
		//뷰에 전달할 매개변수 저장용 Map생성
		Map<String, Object> map = new HashMap<>();
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		//게시물 수 전달 받기 
		int totalCount = dao2.selectCount(map);
		// 보이는 게시글 수 
		int pageSize = 10;
		int blockPage = 5;
		
		//현재 페이지 확인 
		//처음 시작 페이지
		int pageNum = 1;
		//요청(다른 페이지)받으면 수정 하겠다
		String pageTemp = req.getParameter("pageNum");
		if(pageTemp != null && ! pageTemp.equals("")) {
			//요청 받은 페이지로 수정 
			pageNum = Integer.parseInt(pageTemp);
		}
		//목록에 출력할 게시물 범위 계산 
		//1페이지 1 2페이지 11이 되기 위한 설정 
		int start = (pageNum-1)*pageSize + 1; //첫 게시물 번호 
		int end = pageNum * pageSize; // 마지막 게시물 번호
		map.put("start", start);
		map.put("end", end);
		
		//페이징 처리 end 
		//게시물 목록 받기 
		List<ReviewDTO> orderlists = dao2.selectListPage(map,idx);
		dao2.close();
		
		//뷰에 전달할 매개변수 추가 " pageTemp 자리에 ./mvcboar/lost.do"를 대체해준다.
		String pagingStr = BoardPaging.pagingStr(totalCount, pageSize, blockPage, pageNum, "view.do");
		map.put("pagingStr", pagingStr);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		//조회한 항목들은 reviewlists에 담는다. 
		req.setAttribute("orderlists", orderlists);
		//map이라는 변수에 위에 변수를 전부 담는다. 
		req.setAttribute("map", map);
		System.out.println(orderlists);
		
		//뷰 포워드
		req.getRequestDispatcher("/View.jsp").forward(req, resp);
	}
}
