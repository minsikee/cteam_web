<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글 / 댓글</title>
</head>
<body>
<h2>내가 쓴 글 / 댓글 보기</h2>
<c:forEach items="${writelist }" var="vo">
<table>
	<tr>
		<td>${vo.board_num }</td>
	</tr>
</table>
</c:forEach>

<c:forEach items="${vo.comment}" var="list">
<table>
<tr>
	<td>${list.board_num }</td>
</tr>

</table>
</c:forEach>

</body>
</html>