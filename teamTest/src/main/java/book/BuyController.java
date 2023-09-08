package book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MeberDAO;
import member.MeberDTO;

@WebServlet("/book/buy.do")
public class BuyController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookDAO dao = new BookDAO();
		String idx = req.getParameter("idx");
		BookDTO dto = dao.selectView(idx);
		req.setAttribute("dto", dto);
		MeberDAO mdao = new MeberDAO();
		HttpSession session = req.getSession();
		String id = session.getAttribute("UserId").toString();
		MeberDTO mdto = mdao.buymember(id);
		req.setAttribute("user", mdto);
		dao.close();
		mdao.close();
		req.getRequestDispatcher("/book/buy.jsp").forward(req, resp);
	}
	
}
