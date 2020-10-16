<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#item_imgpath {
		width: 80px;
		height: 80px;
	}
	
	div {
		80%;
	}
	
	table {
	 width: 60%;
	 border-collapse: collapse;
	 margin-bottom: 50px;
	 margin-top: 10px;
	 text-align: center;
	 border: 3px solid #FFB4BE;
	}
	
	table td {
	 border-bottom: 1px solid #FFB4BE;
	}
	
	table th {
	 padding: 10px;
	 background-color: #D7567F;
	 color: white;
	}
	
	#go_add{
		margin-bottom: 30px;
		margin-left: 50%;
	}
</style>
</head>
<body>
<h2>상품 관리</h3>
	<a id="go_add" class="btn-fill-s" href="itemNew.ad">제품등록하기</a>
<div align="center">
	<table>
		<tr>
			<th>상품 사진</th>
			<th>상품 코드</th>
			<th>상품 이름</th>
			<th>상품 가격</th>
		</tr>
	<c:forEach items="${list }" var="list"> 
		<tr>
			<td><img id="item_imgpath" src="<c:url value='/' />${list.item_imgpath }"/></td>
			<td>${list.item_code }</td>
			<td>${list.item_name }</td>
			<td>${list.item_price } 원</td>
		</tr>
	</c:forEach>
	</table>

</div>
</body>
</html>