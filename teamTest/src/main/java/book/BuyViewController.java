package book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MeberDAO;
import member.MeberDTO;

@WebServlet("/book/buyview.do")
public class BuyViewController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String id = req.getParameter("id");
		BookDAO dao = new BookDAO();
		BookDTO dto = dao.selectView(idx);
		MeberDAO mdao = new MeberDAO();
		MeberDTO mdto = mdao.buymember(id);
		int result = dao.buybook(idx);
		req.setAttribute("dto", dto);
		req.setAttribute("user", mdto);
		req.setAttribute("result", result);
		dao.close();
		mdao.close();
		req.getRequestDispatcher("/book/buyView.jsp").forward(req, resp);
	}
	
}
