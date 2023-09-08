package qa;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/qa/qaanswer.do")
public class QaanswerController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//DB연결
		QaDAO dao = new QaDAO();
		String answer = req.getParameter("answer");
		String idx = req.getParameter("idx");
		int result = dao.updateQA(idx, answer);
		if(result == 1) {
			resp.sendRedirect("./qaview.do?idx="+idx);
		}
		else {
			resp.sendRedirect("./qacheck.jsp?idx="+idx);
		}
	}
	
}
