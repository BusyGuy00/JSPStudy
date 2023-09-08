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

@WebServlet("/book/buyview.do")
public class BuyViewController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userid = session.getAttribute("UserId").toString();
		String address = "";
		if(session.getAttribute("noaddress") == null) {
			address = null;
		}
		else {
			address = session.getAttribute("noaddress").toString();
		};
		String idx = req.getParameter("idx");
		String id = req.getParameter("id");
		BookDAO dao = new BookDAO();
		BookDTO dto = dao.selectView(idx);
		req.setAttribute("dto", dto);
		int result = dao.buybook(idx);
		req.setAttribute("result", result);
		if(address == null) {
		MeberDAO mdao = new MeberDAO();
		MeberDTO mdto = mdao.buymember(id);
		req.setAttribute("user", mdto);
		dao.close();
		mdao.close();
		req.getRequestDispatcher("/book/buyView.jsp").forward(req, resp);
		}
		else {
			String nomemberid = "비회원";
			MeberDTO mdto = new MeberDTO();
			mdto.setAddress(address);
			mdto.setName(userid);
			mdto.setId(nomemberid);
			req.setAttribute("user", mdto);
			dao.close();
			req.getRequestDispatcher("/book/buyView.jsp").forward(req, resp);
		}
	}
	
}
