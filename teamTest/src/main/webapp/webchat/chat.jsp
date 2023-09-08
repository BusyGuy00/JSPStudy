<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../javascript/script.js"></script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
	<div id="chat">
	아이디 : 
		<input type="text" id="chatId" value="${sessionScope.UserId}" readonly />
		<div id="chatWindow"></div>
		<div>
			<input type="text" id="chatMessage" onkeyup="enterKey()" />
			<button id="sendBtn" type="button" onclick="sendMessage();">전송</button>
			<button id="closeBtn" type="button" onclick="disconnect();">채팅종료</button>
		</div>
	</div>
</body>
</html>