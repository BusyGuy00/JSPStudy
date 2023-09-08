package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/member/nomemberlogin.do")
public class NomemberloginController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name");	
		String address = req.getParameter("address");
		String address2 = req.getParameter("address2");
		HttpSession session = req.getSession();
		session.setAttribute("UserId", name);
		session.setAttribute("noaddress", address+" "+address2);
		session.setMaxInactiveInterval(3600);
		Date date = new Date();
		SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss",Locale.KOREA);
		String in = newFormat.format(date);
		req.setAttribute("intime",in);
		req.getRequestDispatcher("/book/list.do").forward(req, resp);
//		resp.sendRedirect("/book/book/list.do");
	}
}
	

