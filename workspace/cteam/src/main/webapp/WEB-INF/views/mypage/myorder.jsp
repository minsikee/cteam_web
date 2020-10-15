
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
<h2>주문정보 조회</h2>
<c:forEach items="${orderlist }" var="vo"> 
<table>
	<tr id="title">
		<th colspan="6" id="ordernum"> <label>주문날짜 ${vo.order_date }</label> 주문번호 》 <a style="color: white;" href="orderdetail.my?order_num=${vo.order_num }" >${vo.order_num }</a></th>
	<tr>
	<tr style="text-align: center;">
		<th>상품</th>
		<th>상품명/옵션</th>
		<th>상품금액/수량</th>
		<th>주문상태</th>
		<th>금액</th>
		<th>리뷰</th>
	</tr>
	
	<c:forEach items="${vo.order_item}" var="item"> 
	<tr style="text-align: center;">
		<td><img id="item_content_imgpath" src="<c:url value='/' />${item.item_imgpath }"/></td>
		<td>${item.item_name }</td>
		<td>${item.item_price  }￦ / ${item.item_su }개</td>
		<td>${vo.order_state }</td>
		<td class="price">${item.item_price * item.item_su }</td>
		<td><button value="리뷰작성">리뷰작성</button></td>
	</tr>
	</c:forEach>
		<c:set var = "total" value = "0" />
	<c:forEach var="item" items="${vo.order_item}" varStatus="status">     
		<c:set var= "total" value="${total + item.item_price * item.item_su}"/>
	</c:forEach>
	
	<tr align="right" id="last">
		<td colspan="5">총액</td><td><c:out value="${total}"/>￦</td>
	</tr>
	
	</table>
	</c:forEach>


</div>
	
<script type="text/javascript">

</script>
</body>
</html>