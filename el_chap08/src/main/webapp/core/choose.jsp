<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 변수 선언 -->
<c:set var="number" value="100"/>
<h2>choose태그로 홀수 짝수 판단하기</h2>
<c:choose>
	<c:when test="${number mod 2 eq 0 }">
		${number}는 짝수 입니다.
	</c:when>
<c:otherwise>
	${number}는 홀수 입니다.
</c:otherwise>
</c:choose>
<h2>국,영,수 점수를 입력하면 평균을 내어 학점을 출력</h2>
<form>
	<p>국어 : <input type="text" name="kor"></p>
	<p>영어 : <input type="text" name="eng"></p>
	<p>수학 : <input type="text" name="math"></p>
	<input type="submit" value="학점구하기"/>
</form>
<!-- 모든 과목의 점수가 입력되었는지 확인 -->
<!-- 하나라도 비어 있으면 false로 리턴 해라 -->
<c:if test="${ not (empty param.kor or empty param.eng or param.math)}">
	<!-- 평균 계산 -->
	<c:set var="avg" value="${(param.kor+param.eng+param.math)/3 }"/>
	<!--평균 점수는 ${avg}이다.-->
</c:if>
<c:choose>
	<c:when test="${avg ge 90}">
		평균 점수는 ${avg}점으로 A학점 입니다.
	</c:when>
	<c:when test="${avg ge 80}">
		평균 점수는 ${avg}점으로 B학점 입니다.
	</c:when>
	<c:when test="${avg ge 70}">
		평균 점수는 ${avg}점으로 C학점 입니다.
	</c:when>
	<c:when test="${avg ge 60}">
		평균 점수는 ${avg}점으로 D학점 입니다.
	</c:when>
	<c:otherwise>
		평균 점수는 ${avg}점으로 F학점 입니다.
	</c:otherwise>
</c:choose>


</body>
</html>













