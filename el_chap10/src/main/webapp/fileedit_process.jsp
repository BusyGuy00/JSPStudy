<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- uploadProcess에서 복붙 했다  -->
<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%
	//getgetRealPath() --> 물지적 경로를 리턴 한다
    String saveDirectory = application.getRealPath("/uploads");
	int maxPostSize = 1024*1000; //파일 크기
	String encoding = "UTF-8";
	
	try{
		//MultipartRequeset 객체 생성 리퀘스트 대신 여러 자료를 한꺼번에 받기 위함이다.  saveDirectory경로  maxPostSize파일의 최대크기 encoding 저장방식
		MultipartRequest mr = new MultipartRequest(request, saveDirectory,
					maxPostSize, encoding);
		//파일명 생성 
		//myphoto.set.png와 같이 여러 .이 있는 경우 lastIndexOf(".")를통해 
		//마지막 .을 찾고 ext에 넣어준다
		String fileName = mr.getFilesystemName("attachedFile"); // 현재 파일 이름을 받아온다
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String newFileName = now+ext; // 업로드 일시.확장자 
		//파일명 변경 
		//파일 객체 생성 
		File oldFile = new File(saveDirectory+File.separator + fileName);
		File newFile = new File(saveDirectory+File.separator + newFileName);
		oldFile.renameTo(newFile); // 파일이름 변경 
		//다론 폼값 처리 
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String idx = mr.getParameter("idx");
		String[] cateArray = mr.getParameterValues("cate");
		//Buffer 한번에 담아서 전송하기 위해 있는것??
		//StringBuffer는 문자열을 추가하거나 변경할때 주로 사용하는 자료형 이다.
		//append() 메소드로 문자열을 추가할 수 있다.
		//toString() String자료형으로 리턴 
		StringBuffer cateBuf = new StringBuffer();
		//cateArray (체크박스)는 선택 사항이여서 선택을 하지 않으면 선택 없음을 넣어 준다.
		if(cateArray == null) {
			cateBuf.append("선택 없음");
		}else{
			for(String s: cateArray){
				cateBuf.append(s+",");
			}
		}
		//DTO생성
		MyfileDTO dto = new MyfileDTO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setIdx(idx);
		//값을 문자열로 받을 수 있다
		dto.setCate(cateBuf.toString());
		dto.setOfile(fileName);
		dto.setSfile(newFileName);
		
		//DAO를 통해 데이터베이스 반영
		MyfileDAO dao = new MyfileDAO();
		//수정하기 위해 dao.myfileedit(dto);를 int result 로 받는다.
		int result = dao.myfileedit(dto);
		dao.close();
		
		//파일 목록 jsp로 리다이렉션
		response.sendRedirect("filelist.jsp");
		
	}
	catch(Exception e){
		e.printStackTrace();
		request.setAttribute("errorMessage", "파일 업로드 오류");
		request.getRequestDispatcher("./fileUpload.jsp")
		.forward(request, response);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>