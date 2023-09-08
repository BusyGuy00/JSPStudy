<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //받아오는 것. 받아서 변수에 담는다.
   String idx = request.getParameter("idx");
   //선연결
   BookDAO dao = new BookDAO();
   int result = dao.deletePost(idx);
   dao.close();
   if(result == 1){
      %>
         <script>
               alert("게시글이 삭제 되었습니다.");
               location.replace("/book/list.do");
         </script>
      <% 
   }else{
         %>
         <script>
            alert("게시글이 삭제에 실패했습니다.");
            location.replace("/book/view.do");
         </script>
      <%
   }
%>