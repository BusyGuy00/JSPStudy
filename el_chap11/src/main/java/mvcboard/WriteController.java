package mvcboard;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;

public class WriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Write.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		//파일 업로드 처리 
		//업로드 폴더의 물리적 경로 
		String saveDirectory = req.getServletContext().getRealPath("/uploads");
		int maxPostSize = 1024*1000;
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		if(mr == null) {
			//파일 업로드 실패 
			return;
		}
		//파일 업로드의 처리 
		MVCboardDTO dto = new MVCboardDTO();
		dto.setName(mr.getParameter("name"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setPass(mr.getParameter("pass"));
		
		//원본 파일명과 저장된 파일 이름 설정 하기 
		String fileName = mr.getFilesystemName("ofile");
		if(fileName!=null) {
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFilename = now + ext;
			
			//파일명 변경 
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFilename);
			oldFile.renameTo(newFile);
			
			dto.setOfile(fileName);
			dto.setSfile(newFilename);
		}
		//DAO를 통해 DB게시 내용 저장 
		MVCboardDAO dao = new MVCboardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		if(result == 1) {
			PrintWriter write = resp.getWriter();
			String script ="<script>"
					+ "alert('게시글이 등록 되었습니다.'); location.href='./list.do'"
					+ "</script>";
			write.print(script);
			write.close();
			//resp.sendRedirect("list.do");
		}else {
			PrintWriter write = resp.getWriter();
			String script ="<script>"
					+ "alert('게시글 등록 실패'); location.href='./Write.do'"
					+ "</script>";
			write.print(script);
			write.close();
			//resp.sendRedirect("Write.do");
		}
	}
}











