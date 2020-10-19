<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>

<style type="text/css">
#qna_body {
	width: 90%;
	margin: 0 auto;
}

#qna_title {
	width: 30%;
	height: 500px;
	float: left;
	overflow: auto;
	background-color: green;
}

#qna_content {
	width: 70%;
	height: 500px;
	float: left;
	overflow: auto;
	background-color: yellow;
}

.qna_title {
	border: 2px dashed #FFB4BE; 
	font-size: large;
	font-weight: bold;
	color: #666666;
	padding-top: 10px;
	padding-bottom: 10px;
}

.qna_content {
	border: 2px dashed #FFB4BE; 
	font-size: large;
	font-weight: bold;
	color: #666666;
	padding-top: 10px;
	padding-bottom: 10px;
	display: none;
}

</style>

</head>
<body>
<form method="post" action="list.qn">

	<!-- 상단 그냥 괜히 놔둔 바 -->
	<div style='width:100%; float:left; margin:10px 0;' >
		<div style='width:90%; margin:0 auto;'>
			<span style='display:block; background-color:#FFB4BE; height:35px;'>
			</span>
		</div>
	</div>
	
	<!-- 중간 바디 -->
	<div style='width:100%; height:500px; float:left;'>
		<div id='qna_body'>
			<div id='qna_title'>
				<c:forEach items="${list}" var="vo">
					<div class="qna_title title">${vo.qna_title}</div>
				</c:forEach>
				</div>
			<div id='qna_content'>
				<c:forEach items="${list}" var="vo">
					<div class="qna_content content">${vo.qna_content}</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	
	<!-- 하단 그냥 괜히 놔둔 바 -->
	<div style='width:100%; float:left; margin:10px 0;'>
		<div style='width:90%; margin:0 auto;'>
			<span style='display:block; background-color:#FFB4BE; height:30px;'>
			</span>
		</div>
	</div>
	
</form>

<script type="text/javascript">
$("div.title").on('click',function(){
	  $(this).next("content").slideToggle(100);
	});
</script>

</body>
</html>