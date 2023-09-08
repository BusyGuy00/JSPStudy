package qa;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/qa/qawrite.do")
public class QaWritercontroller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("Qawrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//DB연결
		QaDAO dao = new QaDAO();
		QaDTO dto = new QaDTO();
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		int result = dao.insertQA(dto);
		dao.close();
		if(result == 1) {
			resp.sendRedirect("./qa.do");
		}
		else {
			resp.sendRedirect("./qawrite.do");
		}
	}
	
	
}
