package mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;


//서블릿 매핑
@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet{

	//do,get메소드도 가능 하고 service도 가능 하다고 한다 
	//service는 do,get을 호출 한다고 한다. 
	
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		////게시물 불러오기 
		MVCboardDAO dao = new MVCboardDAO();
		//밑에 두 메소드다 idx가 필요한 메소드여서 idx 를 getparameter를 받는 메소드 생성 
		String idx = req.getParameter("idx");
		//게시글 불러 올때 조회수 업데이트 하기 
		dao.upadateVisitcount(idx);
		//게시글 조회하기
		MVCboardDTO dto = dao.selectView(idx);
		//조회후 연결 끊기 
		dao.close();
		req.setAttribute("dto", dto);
		//뷰 포워드
		req.getRequestDispatcher("/View.jsp").forward(req, resp);
	}


	



}
