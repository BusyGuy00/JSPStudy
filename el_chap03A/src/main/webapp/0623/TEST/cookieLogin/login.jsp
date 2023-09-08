<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<jsp:include page="header.jsp" flush="false"/>
		
	<div>
		<form method="post" action="login_process.jsp" >
			<table>
				<tr>
					<td>아이디 </td>	
					<td>
						<input type="text" name="mId"></input>
					</td>	
				</tr>
				<tr>
					<td>비밀번호 </td>	
					<td>
						<input type="text" name="mPas"></input>
					</td>	
				</tr>
				<tr>
					<td>
						<button type="submit" name="submit" > 전송 </button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>