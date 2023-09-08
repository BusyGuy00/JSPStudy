<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<select id="컬럼명" name="컬럼명" class="form-control">
  <option value="">년</option>
  <c:forEach var="i" begin="2010" end="2030">
    <option value="${i}">${i}</option>
  </c:forEach>
</select>
  
<select id="컬럼명" name="컬럼명" class="form-control">
  <option value="">월</option>
  <c:forEach var="i" begin="1" end="12">
  <c:choose>
      <c:when test="${i lt 10 }">
          <option value="0${i}">0${i}</option>
      </c:when>
      <c:otherwise>
          <option value="${i}">${i}</option>
      </c:otherwise>
  </c:choose>
  </c:forEach>
</select>
  
<select id="컬럼명" name="컬럼명" class="form-control">
  <option value="">일</option>
  <c:forEach var="i" begin="1" end="31">
  <c:choose>
      <c:when test="${i lt 10 }">
          <option value="0${i}">0${i}</option>
      </c:when>
      <c:otherwise>
          <option value="${i}">${i}</option>
      </c:otherwise>
  </c:choose>
  </c:forEach>
</select>
</body>
</html>