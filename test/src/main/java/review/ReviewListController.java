package review;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import utils.BoardPaging;

@WebServlet("/rlist.do")
public class ReviewListController extends HttpServlet{

//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		//DAO 생성 
//				ReviewDAO dao = new ReviewDAO();
//				//뷰에 전달할 매개변수 저장용 Map생성
//				Map<String, Object> map = new HashMap<>();
//				String searchField = req.getParameter("searchField");
//				String searchWord = req.getParameter("searchWord");
//				System.out.println(searchField+"리스트 컨트롤러");
//				System.out.println(searchWord+"리스트 컨트롤러Word");
//				if(searchWord != null) {
//					map.put("searchField", searchField);
//					map.put("searchWord", searchWord);
//				}
//				//게시물 수 전달 받기 
//				int totalCount = dao.selectCount(map);
//				// 보이는 게시글 수 
//				int pageSize = 10;
//				int blockPage = 5;
//				
//				//현재 페이지 확인 
//				//처음 시작 페이지
//				int pageNum = 1;
//				//요청(다른 페이지)받으면 수정 하겠다
//				String pageTemp = req.getParameter("pageNum");
//				if(pageTemp != null && ! pageTemp.equals("")) {
//					//요청 받은 페이지로 수정 
//					pageNum = Integer.parseInt(pageTemp);
//				}
//				//목록에 출력할 게시물 범위 계산 
//				//1페이지 1 2페이지 11이 되기 위한 설정 
//				int start = (pageNum-1)*pageSize + 1; //첫 게시물 번호 
//				int end = pageNum * pageSize; // 마지막 게시물 번호
//				map.put("start", start);
//				map.put("end", end);
//				
//				//페이징 처리 end 
//				//게시물 목록 받기 
//				List<ReviewDTO> reviewlists = dao.reviewSelectListPage(map);
//				dao.close();
//				
//				//뷰에 전달할 매개변수 추가 " pageTemp 자리에 ./mvcboar/lost.do"를 대체해준다.
//				String pagingStr = BoardPaging.pagingStr(totalCount, pageSize, blockPage, pageNum, "List.do");
//				map.put("pagingStr", pagingStr);
//				map.put("totalCount", totalCount);
//				map.put("pageSize", pageSize);
//				map.put("pageNum", pageNum);
//				//조회한 항목들은 reviewlists에 담는다. 
//				req.setAttribute("reviewlists", reviewlists);
//				//map이라는 변수에 위에 변수를 전부 담는다. 
//				req.setAttribute("map", map);
//				//요청이 오면  담은 항목과 변수들을 "List.jsp"에 넘겨서 보여준다.
//				req.getRequestDispatcher("/ReviewList.jsp").forward(req, resp);
//				System.out.println(reviewlists);
//				
//		}
}
