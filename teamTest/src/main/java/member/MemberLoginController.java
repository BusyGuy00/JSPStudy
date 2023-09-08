package member;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
@WebServlet("/member/memberlogin.do")
public class MemberLoginController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");	
		String pass = req.getParameter("pass");
		MeberDAO dao = new MeberDAO();
		int result = dao.loginMember(id, pass);
		if(result == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("UserId", id);
			session.setAttribute("UserIn", result);
			session.setMaxInactiveInterval(3600);
			resp.sendRedirect("/book/book/list.do");
		}
		else {
			resp.sendRedirect("./memberloginch.jsp");
		}
	}
	
}
