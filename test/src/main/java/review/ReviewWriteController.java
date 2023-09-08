package review;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import book.BookDAO;
import book.BookDTO;
import fileupload.FileUtil;

@WebServlet("/reviewWrite.do")
public class ReviewWriteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		BookDAO dao = new BookDAO();
		BookDTO dto = dao.selectView(idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("./ReviewWrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		
		String saveDirectory = req.getServletContext().getRealPath("/uploads");
		int maxPostSize = 1024*1000;
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		if(mr == null) {
			//파일 업로드 실패 
			return;
		}
		//파일 업로드의 처리 
		BookDTO bdto = new BookDTO();
		ReviewDTO dto = new ReviewDTO();
		String idx = mr.getParameter("idx");
		bdto.setIdx(idx);
		dto.setName(mr.getParameter("name"));
		dto.setContent(mr.getParameter("content"));
		dto.setScore(mr.getParameter("score"));
		dto.setBookNumber(mr.getParameter("bookNumber"));
		

		ReviewDAO dao = new ReviewDAO();
		int result = dao.ReviewinsertWrite(dto);
		dao.close();
		if(result == 1) {
			PrintWriter write = resp.getWriter();
			String script ="<script>"
					+ "alert('게시글이 등록 되었습니다.'); location.href='/book/list.do '"
					+ "</script>";
			write.print(script);
			//resp.sendRedirect("view.do");
			write.close();
			
			//location.href='/book/view.do
		}else {
			PrintWriter write = resp.getWriter();
			String script ="<script>"
					+ "alert('게시글 등록 실패'); location.href='/book/reviewWrite.do'"
					+ "</script>";
			write.print(script);
			write.close();
			//resp.sendRedirect("Write.do");
		}

	}
}


