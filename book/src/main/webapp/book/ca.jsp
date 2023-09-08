<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="caBar">
		<ul class="caMenu">
			<li>
				<a href="/book/book/list.do?ca=소설">소설</a>
				<ul class="caSubMenu">
					<li><a href="/book/book/list.do?ca=한국소설">한국소설</a></li>
					<li><a href="/book/book/list.do?ca=영미소설">영미소설</a></li>
					<li><a href="/book/book/list.do?ca=청소년소설">청소년소설</a></li>
					<li><a href="/book/book/list.do?ca=고전소설">고전소설</a></li>
				</ul>
			</li>
			<li>
				<a href="/book/book/list.do?ca=b">건강</a>
				<ul class="caSubMenu">
					<li><a href="/book/book/list.do?ca=뇌건강">뇌건강</a></li>
					<li><a href="/book/book/list.do?ca=한방치료">한방치료</a></li>
					<li><a href="/book/book/list.do?ca=자연건강">자연건강</a></li>
					<li><a href="/book/book/list.do?ca=질병치료">질병치료</a></li>
				</ul>
			</li>
			<li>
				<a href="/book/book/list.do?ca=a">기술/공학</a>
				<ul class="caSubMenu">
					<li><a href="/book/book/list.do?ca=전기">전기/전자</a></li>
					<li><a href="/book/book/list.do?ca=자동차">자동차/운전</a></li>
					<li><a href="/book/book/list.do?ca=금속">금속/재료</a></li>
					<li><a href="/book/book/list.do?ca=대학교제">대학교제</a></li>
				</ul>
			</li>
			<li>
			<a href="/book/book/list.do?ca=어">외국어</a>
				<ul class="caSubMenu">
					<li><a href="/book/book/list.do?ca=영어">영어</a></li>
					<li><a href="/book/book/list.do?ca=일본어">일본어</a></li>
					<li><a href="/book/book/list.do?ca=중국어">중국어</a></li>
					<li><a href="/book/book/list.do?ca=독일어">독일어</a></li>
				</ul>
			</li>
			<li>
				<a href="/book/book/list.do?re=1">최다 리뷰</a>
			</li>
			<li>
				<a href="/book/qa/qa.do">qa</a>
			</li>
		</ul>
		<jsp:include page="../webchat/chat.jsp">
		<jsp:param name="chat" value="${sessionScope.admin}"/>
		</jsp:include>
	</div>
</body>
</html>