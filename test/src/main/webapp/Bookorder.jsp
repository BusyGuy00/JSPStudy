<%@page import="book.OrderBookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <script type="text/javascript"> 
  function MiunsBtn(){
	   if(document.frm.order.value>1)
	      document.frm.order.value --;
	   else return;
	   cal();
	};
  function PlusBtn(){
     document.frm.order.value ++;
     cal();
 	};
  function cal(){
     document.frm.OrderPrice.value =
     document.frm.price.value * document.frm.order.value;
  	};


   </script> 
<h2>장바구니</h2>
<% OrderBookDTO odto = new OrderBookDTO(); %>
	<!--<table border="1">
		<tr>
			<td>번호</td>
			<td>${dto.idx}</td>
		</tr>
		<tr>
			<td>금액</td>
			<td>${dto.price}</td>
			<td>총금액</td>
			<td>${odto.OrderPrice}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="">${dto.name}</td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td>이미지</td>
			<td colspan="3"><img src="./uploads/${dto.ofile}" width="200px" height="200px"></td>
		</tr>
		</table>-->
		<!--  <table>
		<tr>
		<td>
			수량 : <input type="text" name="price" value="${dto.price}"/>
			<input type="text" name="amount" value="1" size="3" max="" />
			<input type="button" value=" + " name="add" />
			<input type="button" value=" - " name="minus" />
			금액 : <input type="text" name="sum" size="11" readonly />
		</td>
		</tr>
		</table>-->
<table> 
	<tr>
		<td><p>${dto.name}</p>
			<form method = "post" name="frm">
				<img src="./uploads/${dto.ofile}" width="200px" height="250px">
			    <fmt:formatNumber value="${dto.price}" pattern="#,###원" />
			    <input type="text" name="price" value="${dto.price}" />
			    <input type="text" name="order" value="1" maxlength="3" onkeyup="cal();"/>
			    <input type="button" value="-" name="minus" onclick="MiunsBtn();"/>
			    <input type="button" value="+" name="plus" onclick="PlusBtn();"/>
			    총 <input type="text" name="OrderPrice" size="5" readonly value="${odto.OrderPrice}"/>원
				<input type="submit" value="구매하기" />
			</form>
		</td>
	</tr>
</table>

</body>
</html>