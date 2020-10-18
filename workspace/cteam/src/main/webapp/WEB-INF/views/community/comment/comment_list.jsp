<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>

<style type="text/css">

#comment_writer {
	display: block;
	width: 10%;
	height: 30px;
	line-height: 30px;
	vertical-align: middle;
	float: left;
	font-weight: bold;
	font-size: 15px;
	color: #111111;
	overflow:hidden;
}

#comment_content {
	display: block;
	width: 70%;
	height: 30px;
	line-height: 30px;
	vertical-align: middle;
	float: left;
	text-align: left;
	color: #111111;
	overflow:hidden;
}

.comment_space {
	display: block;
	width: 5%;
	height: 30px;
	float: left;
}

.comment_space_1 {
	display: block;
	width: 1%;
	height: 30px;
	float: left;
}

.comment_space_2 {
	display: block;
	width: 3%;
	height: 30px;
	float: left;
}

.comment_button {
	display: block;
	width: 4%;
	height: 30px;
	line-height: 30px;
	float: left;
	font-weight: bold;
	font-size: 13px;
	color: #333333;
	vertical-align: middle;
	overflow:hidden;
}

#comment_date {
	display: block;
	width: 10%;
	height: 30px;
	line-height: 30px;
	vertical-align: middle;
	float: right;
	font-size: 13px;
	color: #111111;
	overflow:hidden;
}

</style>

</head>
<body>

<c:forEach items="${list}" var="vo">
	<div style='width:100%; height:30px; margin-top:10px;'>
		<div style='width:90%; height:100%; margin:0 auto; background-color:#FFB4BE50'>
		
			<div id='comment_writer'>${vo.member_id}</div>
			
			<div id='comment_content'> &nbsp; ${fn:replace(fn:replace( vo.content, lf, '<br>' ), crlf, '<br>')}</div>
			<div id='comment_content_modify' style='display:none; margin-top:6px;'></div>
			
			<c:choose>
				<c:when test='${login_info.member_id eq vo.member_id}'>
					<span class='comment_space_1'></span>
					<a class='comment_button comment_save'>수정</a>
					<a class='comment_button comment_delete'>삭제</a>
					<span class='comment_space_1'></span>
				</c:when>
				<c:otherwise>
					<span class='comment_space'></span>
					<span class='comment_space'></span>
				</c:otherwise>
			</c:choose>
			
			<div id='comment_date'>${vo.writedate}</div>
			
		</div>
	</div>
</c:forEach>

<script type="text/javascript">
function display(div, mode){
	//수정상채 : 저장/취소버튼, 원글안보이게, 수정글보이게
	//보기상태 : 수정/삭제버튼, 원글보이게, 수정글 안보이게
	div.find('.comment_save').text(mode == 'm' ? '저장' : '수정' );
	div.find('.comment_delete').text(mode == 'm' ? '취소' : '삭제');
	div.children('.comment_content').css('display', mode=='m' ? 'none' : 'block' );
	div.children('.comment_content_modify').css('display', mode=='m' ? 'block' : 'none' );
}
</script>

</body>
</html>