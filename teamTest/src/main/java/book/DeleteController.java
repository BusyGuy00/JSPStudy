package book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/book/delete.do")
public class DeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookDAO dao = new BookDAO();
		String idx = req.getParameter("idx");
		dao.deletePost(idx);
		dao.close();
		resp.sendRedirect("./list.do");
	}

//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		//mode매개변수값을 request영역에 저장한 다음 
//		//Pass.jsp로 포워드
//		req.setAttribute("mode", req.getAttribute("mode"));
//		req.setAttribute("idx", req.getAttribute("idx"));
//		
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		resp.setContentType("text/html;charset=UTF-8");
//		//매개변수 저장 
//		String idx = req.getParameter("idx");
//		String mode = req.getParameter("mode");
//		
//		BookDAO dao = new BookDAO();
//		dao.close();
//		
//		if(mode.equals("delete")) {
//			dao = new BookDAO();
//			int result = dao.deletePost(idx);
//			if(result ==1) {
//				PrintWriter write = resp.getWriter();
//				String script ="<script>"
//						+ "alert('게시글이 삭제 되었습니다.'); location.href='/book/book/list.do'"
//						+ "</script>";
//				write.print(script);
//				write.close();
//			}else {
//				PrintWriter write = resp.getWriter();
//				String script ="<script>alert('삭제되지 않았습니다.')"
//						+ "location.href='/book/book/list.do'</script>";
//				write.print(script);
//				write.close();
//			}
//		}
//	}
	
		
}

	
	


















