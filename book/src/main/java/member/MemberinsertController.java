package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/member/memberinsert.do")
public class MemberinsertController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String address = req.getParameter("address");
		String address2 = req.getParameter("address2");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String job = req.getParameter("job");
		MeberDAO dao = new MeberDAO();
		MeberDTO dto = new MeberDTO();
		dto.setId(id);
		dto.setPass(pass);
		dto.setName(name);
		dto.setAddress(address+" "+address2);
		dto.setGender(gender);
		dto.setAge(age);
		dto.setJob(job);
		int result = dao.selectMember(id);
		if(result == 1) {
			resp.sendRedirect("/book/member/membercheck.jsp?result="+result);
		}
		else {
			dao.insertMember(dto);
			resp.sendRedirect("/book/member/membercheck.jsp?result="+result);
		}
		dao.close();
	}
	
}
