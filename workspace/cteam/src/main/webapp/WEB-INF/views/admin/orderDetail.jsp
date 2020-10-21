<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세</title>
<style type="text/css">
.detail {
	border-collapse: collapse;
	margin-bottom: 50px;
	border: 1px solid #969696;
}
.detail td {
	padding: 5px;
}
.detail th {
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
.ship {
	border-collapse: collapse;
	margin-bottom: 50px;
	border: 1px solid #969696;
}

.ship th {
 padding: 5px;
 width: 40%;
}
</style>
</head>
<body>
<div align="center">
<h1>주문번호 [${list.order_num }] 상세내역</h1>
		

<table class="detail" style="width: 80%">
	<tr id="title">
		<th colspan="3" id="ordernum"> <label>주문날짜 ${list.order_date }</label> 주문번호 》${list.order_num }</th>
		<th>${list.order_state}</th>
	<tr>
	<tr>
		<th>주문자</th>
		<td colspan="3" style="border-bottom: 1px solid #FFB4BE; font-weight: bold;">${list.member_id}</td>
	</tr>
	<tr style="text-align: center;">
		<th>상품</th>
		<th>상품명/옵션</th>
		<th>상품금액/수량</th>
		<th>금액</th>
	</tr>
	
	<c:forEach items="${list.order_item}" var="item"> 
	</c:forEach>
	<c:set var = "total" value = "0" />
 	<c:forEach items="${list.order_item}" var="item"> 
		<c:set var="options" value="${fn:split(item.option_info, '/')}" />
			<c:forEach begin="0" end="${fn:length(options)-1}" varStatus="optionsStatus">
			<c:set var="option" value="${options[optionsStatus.index]}" />
			<c:set var="detail" />
				<c:forEach begin="0" end="${fn:length(option)-1}" varStatus="optionStatus">
					<c:set var="detail" value="${fn:split(option, '@')}" />
				</c:forEach>
					
		<tr style="text-align: center;">
			<td><img id="item_content_imgpath" src="<c:url value='/' />${item.item_imgpath }"/></td>
			
			<td>${item.item_name } / ${detail[0]}</td>
			<td>${item.item_price  }￦ / ${detail[1]}개</td>
			<td class="price">${item.item_price * detail[1]} ￦</td>
		</tr>
		<c:set var= "total" value="${total + item.item_price * detail[1]}"/>
	
	</c:forEach>
	
	
	</c:forEach>			
			
		<c:if test="${total lt 50000 }">
		<tr align="right"  style="border-top: 1px solid #FFB4BE;">
			<td colspan="3">(5만원 이상 무료배송) 배송비</td><td>＋ 2500￦</td>
		</tr>
		<tr align="right" id="last">
			<td colspan="3">총액</td><td><c:out value="${total + 2500}"/>￦</td>
		</tr>
		</c:if>

			<c:if test="${total gt 50000 }">
		<tr align="right" style="border-top: 1px solid #FFB4BE;">
			<td colspan="3">(5만원 이상 무료배송) 배송비</td><td>＋ 0￦</td>
		</tr>
		<tr align="right" id="last">
			<td colspan="3">총액</td><td><c:out value="${total}"/>￦</td>
		</tr>
		</c:if> 
		</table>		
	<div  class="ship" >
	<table style="width: 80%; margin-bottom: 20px;">
		<tr><th colspan="2">주문자 정보</th><tr>
		<tr>
			<th>성함</th><td>${list.member_name }</td>
		</tr>	
		<tr>
			<th>전화번호</th><td>${list.member_phonenum }</td>
		</tr>
		<tr>	
			<th>이메일</th><td>${list.member_email }</td>
		</tr>			
	</table>
	
	<table style="width: 80%; margin-bottom: 50px;">
		<tr>
			<th colspan="2">배송 정보</th>
		</tr>
		<tr>
			<th>성명</th><td>${list.shipping_name }</td>
		</tr>
		<tr>
			<th>전화번호</th><td>${list.shipping_phonenum }</td>
		</tr>
		<tr>
			<th>배송 메세지</th><td>${list.shipping_message }</td>
		</tr>
		<tr>
			<th style="margin-bottom: 1px solid #969696;">배송지 주소</th><td>${list.shipping_address }<br/>${list.shipping_address2 }</td>
		</tr>
		<tr></tr>
	</table>
</div>
</div>
</html>