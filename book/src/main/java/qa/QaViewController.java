package qa;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/qa/qaview.do")
public class QaViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//DB연결
		String idx = req.getParameter("idx");
		String id = "admin";
		QaDAO dao = new QaDAO();
		QaDTO dto = dao.selectQAN(idx);
		dao.close();
		HttpSession session = req.getSession();
		String admin = (String) session.getAttribute("admin");
		req.setAttribute("dto", dto);
		req.setAttribute("id", id);
		req.setAttribute("check", admin);
		req.getRequestDispatcher("./Qaview.jsp").forward(req, resp);
	}
	
}
