<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<style type="text/css">
.list {
	float: right;
	width: 30%;
	height: 150px;
	border: 1 px solid pink;
}
#box {
	width: 60%;
	margin-bottom: 50px;
}
</style>
</head>
<body>
<h2 align="center">관리자 페이지</h2>
<div align="center" id="box">

<div class="list">
	<a href="list.ad">상품관리</a>
</div>
<div class="list">
	<a href="memberList.ad">회원관리</a>
</div>
<div class="list">
	<a href="">주문관리</a>
</div>
</div>
</body>
</html>