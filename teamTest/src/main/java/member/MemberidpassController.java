package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/memberidpass.do")
public class MemberidpassController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MeberDAO dao = new MeberDAO();
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name");
		String address = req.getParameter("address");
		String address2 = req.getParameter("address2");
		String id = req.getParameter("id");
		if(id == null) {
			MeberDTO dto = dao.memberid(name, address, address2);
			HttpSession session = req.getSession();
			session.setAttribute("findId", dto.getId());
			dao.close();
			resp.sendRedirect("./find.jsp");
		}
		else {
			MeberDTO dto = dao.memberpass(id, address, address2);
			HttpSession session = req.getSession();
			session.setAttribute("findpass", dto.getPass());
			dao.close();
			resp.sendRedirect("./find.jsp");
		}
	}
	
}
