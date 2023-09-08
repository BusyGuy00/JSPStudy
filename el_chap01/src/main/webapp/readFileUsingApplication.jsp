<%@page import="java.net.URL"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본객체 사용하여 자원 읽기</title>
</head>
<body>
	<%
		String recourcePath = "/file/message1.txt";
	//경로를 recourcePath 담는다
	%>
	자원의 실제 경로 <%= application.getRealPath(recourcePath) %>
	<br/>
	<%
		char[] buff = new char[128];
		int len = -1;
		//recourcePath의 경로를 url에 담는다.
		URL url= application.getResource(recourcePath);
		try{
			//message1.txt로 부터 내욜을 읽어오는 스트림 생성  
			InputStreamReader fr = new InputStreamReader(
					url.openStream(),"utf-8"
				); 
			//fr은/message1.txt를 받아오지만 byte타입이라서 바로 사용은 안됀다.  
			// len=fr.read(buff) buff을 통해서 char타입을 읽을 수있다.
			//128개씩 읽어 int len에 리턴하고 더 이상 읽을게 없을때 그 후에 -1을 리턴 되어 while문이 종료 된다.. 
				while((len=fr.read(buff)) != -1){
					out.println(new String(buff,0,len));
				}
		}
		catch(IOException e){
			out.println("익셉션 발생 : " + e.getMessage());
		}
	//url.openStream()
	%>
</html>