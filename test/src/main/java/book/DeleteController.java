package book;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//mode매개변수값을 request영역에 저장한 다음 
		//Pass.jsp로 포워드
		req.setAttribute("mode", req.getAttribute("mode"));
		req.setAttribute("idx", req.getAttribute("idx"));
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		//매개변수 저장 
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		
		BookDAO dao = new BookDAO();
		dao.close();
		
		if(mode.equals("delete")) {
			dao = new BookDAO();
			int result = dao.deletePost(idx);
			if(result ==1) {
				PrintWriter write = resp.getWriter();
				String script ="<script>"
						+ "alert('게시글이 삭제 되었습니다.'); location.href='/book/list.do'"
						+ "</script>";
				write.print(script);
				write.close();
			}else {
				PrintWriter write = resp.getWriter();
				String script ="<script>alert('삭제되지 않았습니다.')"
						+ "location.href='/book/list.do'</script>";
				write.print(script);
				write.close();
			}
			resp.sendRedirect("/book/list.do");
		}
			//수정 페이지 
		else if (mode.equals("edit")) {
			
			//edit.do로 넘기고 idx를 같이 넘겨 준다.
			resp.sendRedirect("./edit.do?idx="+idx);
		}
		else {
			//자바스크립트 이전 페이지로 페이지 이동 
			//history.back();을 이용해서도 가능 하다.
			// "location.href='./list.do'</script>"에 대체 해서 넣어 줄 수 있다.
			PrintWriter write = resp.getWriter();
			String script ="<script>"
					+ "alert('비밀번호가 틀렸습니다.'); location.href='/book/list.do'"
					+ "</script>";
			write.print(script);
			write.close();
		}
	}
	
		
}

	
	


















