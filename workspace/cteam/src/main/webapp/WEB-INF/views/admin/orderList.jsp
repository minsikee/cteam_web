<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록</title>
<style type="text/css">
table {
	border-collapse: collapse;
	margin-bottom: 50px;
	border: 1px solid #969696
	;
}
table td {
	padding: 5px;
}
table th {
 border-bottom: 1px solid #FFB4BE;	
 width: 300px;
 padding: 5px;
}
#ordernum {
	border-bottom: 1px solid #FFB4BE;
	text-align: left;
}
label {
	margin-right: 100px;
	margin-left: 10px;
}
#last {
	 background-color: #FFB4BE;
}
#title {
	background-color: #D7567F;
	color: white;
	height: 30px;
	}

#item_content_imgpath {
	width: 80px;
	height: 80px;
}
</style>
</head>
<body>
<div align="center">
<h1>주문목록</h1>
<c:forEach items="${orderlist }" var="vo"> 
<table style="width: 80%">
	<tr id="title">
		<th colspan="5" id="ordernum"> <label>주문날짜 ${vo.order_date }</label> 주문번호 》 <a style="color: white;" href="orderdetail.my?order_num=${vo.order_num }" >${vo.order_num }</a></th>
	<tr>
	<tr style="text-align: center;">
		<th>상품</th>
		<th>상품명/옵션</th>
		<th>상품금액/수량</th>
		<th>금액</th>
		<th>주문상태</th>
	</tr>
	
	<c:forEach items="${vo.order_item}" var="item"> 
	<tr style="text-align: center;">
		<td><img id="item_content_imgpath" src="<c:url value='/' />${item.item_imgpath }"/></td>
		<td>${item.item_name }</td>
		<td>${item.item_price  }￦ / ${item.item_su }개</td>
		<td class="price">${item.item_price * item.item_su }</td>
		<td><select>
			<option ${vo.order_state eq '상품준비중' ? 'selected' : ''}>상품준비중</option>
			<option ${vo.order_state eq '배송중' ? 'selected' : ''}>배송중</option>
			<option ${vo.order_state eq '배송완료' ? 'selected' : ''}>배송완료</option>
		</select><a style="margin-left: 5px;"  class="btn-fill-s">확인</a></td>
	</tr>
	</c:forEach>
		<c:set var = "total" value = "0" />
	<c:forEach var="item" items="${vo.order_item}" varStatus="status">     
		<c:set var= "total" value="${total + item.item_price * item.item_su}"/>
	</c:forEach>
	
	<c:if test="${total lt 50000 }">
	<tr align="right"  style="border-top: 1px solid #FFB4BE;">
		<td colspan="4">(5만원 이상 무료배송) 배송비</td><td>＋ 2500￦</td>
	</tr>
	<tr align="right" id="last">
		<td colspan="4">총액</td><td><c:out value="${total + 2500}"/>￦</td>
	</tr>
	</c:if>
	
	<c:if test="${total gt 50000 }">
	<tr align="right" style="border-top: 1px solid #FFB4BE;">
		<td colspan="4">(5만원 이상 무료배송) 배송비</td><td>＋ 0￦</td>
	</tr>
	<tr align="right" id="last">
		<td colspan="4">총액</td><td><c:out value="${total}"/>￦</td>
	</tr>
	</c:if>
	
	</table>
	</c:forEach>


</div>
</body>
</html>