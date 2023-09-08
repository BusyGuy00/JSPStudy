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
		HttpSession session = req.getSession();
		String address = "";
		String userid = session.getAttribute("UserId").toString();
		if(session.getAttribute("noaddress") == null) {
			address = null;
		}
		else {
			address = session.getAttribute("noaddress").toString();
		};
		String idx = req.getParameter("idx");
		BookDAO dao = new BookDAO();
		BookDTO dto = dao.selectView(idx);
		req.setAttribute("dto", dto);
		if(address == null) {
		MeberDAO mdao = new MeberDAO();
		HttpSession session2 = req.getSession();
		String id = session2.getAttribute("UserId").toString();
		MeberDTO mdto = mdao.buymember(id);
		req.setAttribute("user", mdto);
		dao.close();
		mdao.close();
		req.getRequestDispatcher("/book/buy.jsp").forward(req, resp);
		}
		else {
			String nomemberid = "비회원";
			MeberDTO mdto = new MeberDTO();
			mdto.setAddress(address);
			mdto.setName(userid);
			mdto.setId(nomemberid);
			req.setAttribute("user", mdto);
			dao.close();
			req.getRequestDispatcher("/book/buy.jsp").forward(req, resp);
		}
	}
	
}
