package qa;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utill.BoardPaging;
import utill.Paging;
@WebServlet("/qa/qa.do")
public class Qacontroller extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//DB연결
		QaDAO dao = new QaDAO();
		//매개변수 설정
		Map<String, Object> map = new HashMap<>();
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		//게시물 수
		int totalCount = dao.selectCountqa(map);
		int pageSize = 10;
		int blockPage = 5;
		
		//현재 페이지 확인
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}
		
		//게시물 목록 출력 제한
		int start = (pageNum-1)*pageSize +1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);
		
		//게시물 출력부 끝
		//게시물 목록 받기
		List<QaDTO> qalist = dao.selectQA(map);
		dao.close();
		
		//뷰에 전달할 매개변수
		String pagingStr = BoardPaging.pagingStr(totalCount, pageSize, blockPage, pageNum,"./qa.do");
		map.put("pagingStr", pagingStr);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		req.setAttribute("qalist", qalist);
		req.setAttribute("map", map);
		req.getRequestDispatcher("./Qalist.jsp").forward(req, resp);
	}
	
}
