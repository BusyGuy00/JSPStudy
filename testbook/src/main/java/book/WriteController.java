package book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bookwrite.do")
public class WriteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("bookWrite.jsp").forward(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//System.out.println("dddddddddddddddddd");
//		
		BookDTO dto = new BookDTO();
		BookDAO dao = new BookDAO();
		//dto.setNumber(req.getParameter("number"));
		dto.setTitle(req.getParameter("title"));
		dto.setWrite(req.getParameter("write"));
		dto.setPublisher(req.getParameter("publisher"));
		dto.setPrice(req.getParameter("price"));
		//dto.setPostdate(req.getParameter("postdate"));
		int result = dao.insertBook(dto);
		dao.close();
		if(result == 1) {
			resp.sendRedirect("/testbook/bookwrite.do");
		}
		else {
			resp.sendRedirect("/testbook/bookwrite.do");
		}
	}
	


//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		BookDTO dto = new BookDTO();
//		BookDAO dao = new BookDAO();
//		dto.setTitle(req.getParameter("title"));
//		dto.setWrite(req.getParameter("write"));
//		dto.setPublisher(req.getParameter("publisher"));
//		dto.setPrice(req.getParameter("price"));
//		int result = dao.insertBook(dto);
//		dao.close();
//		if(result == 1) {
//			resp.sendRedirect("./bookwrite.do");
//		}
//		else {
//			resp.sendRedirect("./boookwrite.do");
//		}
//	}
}

	

