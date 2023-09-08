<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {border-collapse: collapse;}
	table td{border : 1px solid #ccc;
			 padding : 10px;
			}
</style>
</head>
<body>
<%	
	request.setCharacterEncoding("utf-8");
%>
	<div>
	<jsp:include page="join_header.jsp" flush="false">
		<jsp:param value="title" name="그린 컴퓨터 아카데미"/>
	</jsp:include>
	</div>
	
	<form method="post" action="join_process.jsp" >
	<table >
	<tr>
		<td>
			이름 
		</td>	
		<td>
			<input  type="text" name="mname"></input>
		</td>	
	</tr>
	<tr>
		<td>
			아이디 
		</td>	
		<td>
			<input type="text" name="mid"></input>
		</td>	
	</tr>
	<tr>
		<td>
			비밀번호 
		</td>	
		<td>
			<input type="text" name="mpas"></input>
		</td>	
	</tr>
	<tr>
		<td>
			이메일
		</td>	
		<td>
			 <input type="text" name="memail"></input>
			 @ <select name="memail2">
				<option>선택</option>
				<option>naver.com</option>
				<option>daum.net</option>
				</select>
		</td>
	</tr>
	<tr>
		<td>
			생년월일
		</td>	
		<td>
			<select name="my">
				<option value="1988">1988</option>
				<option value="1989">1989</option>
				<option value="1990">1990</option>
				</select>
			<select name="mm">
					<option value="">월</option>
					<option value="1월">1월</option>
					<option value="2월">2월</option>
					</select>
			<select name="md">
					<option value="">일</option>
					<option value="1일">1일</option>
					<option value="2일">2일</option>
					</select>
		</td>	
	</tr>
	<tr>
		<td>
				휴대폰 번호
		</td>	
		<td>
			 <select name="mp">
				<option value="">선택</option>
				<option value="010">010</option>
				<option value="011">011</option>
				</select>
			- <input type="text" name="mname"></input>
			- <input type="text" name="mname"></input>
			<button type="button" >인증번호 발송</button>
			<button type="button" >인증번호 재발송</button>
		</td>	
	</tr>
	<tr>
		<td>
			인증번호입력
		</td>	
		<td>
			<input type="text" name="mcheck"></input>
				<button type="submit">확인</button>
		</td>	
	</tr>
		</table>
	</form>

</body>
</html>