package qa;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/qa/qadelete.do")
public class QadeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QaDAO dao = new QaDAO();
		String idx = req.getParameter("idx");
		dao.deleteQA(idx);
		dao.close();
		resp.sendRedirect("./qa.do");
	}
	
}
