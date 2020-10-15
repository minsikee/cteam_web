<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티<</title>

<style type="text/css">
table {
	margin: 0 auto;
	border: 1px solid #000000;
}

table th, table td {
	margin: 0 auto;
	height: 25px;
	border: 1px solid #333333;
	color: #111111;
}

table th {
	background-color: #FFB4BE;
}

.modify, .delete {
	width: 75px;
	height: 30px;
}
</style>

</head>
<body>

<form method="post" action="list.bo">
<input type="hidden" name="board_num" value="${vo.board_num}">
<input type="hidden" name="curPage" value="${page.curPage }">
<input type="hidden" name="search" value="${page.search }">
<input type="hidden" name="keyword" value="${page.keyword }">
<input type="hidden" name="pageList" value="${page.pageList }">

	<!-- 상단 메뉴 -->
	<div style='width:100%; float:left; margin:10px 0;' >
		<div style='width:90%; margin:0 auto;'>
			<!-- 작성자가 아닐 경우 : 수정, 삭제 버튼 나타나지 않음 -->
			<c:if test='${login_info.member_id ne vo.member_id && login_info.member_id ne "admin"}'>
				<span style='display:block; background-color:#FFB4BE; height:35px;'>
				</span>
			</c:if>
			<!-- 관리자 : 삭제 가능 -->
			<c:if test='${login_info.member_id eq "admin"}'>
				<span style='display:block; background-color:#FFFFFF; height:35px;'>
					<span style='float:right; margin-top:2.5px; margin-right:2px;'>
					<button class='delete'>
						<a style='color:#111111; font-size:15px;' 
						   onclick='if(confirm("정말 삭제하시겠습니까?")){$("form").attr("action", "delete.bo"); $("form").submit()}'>삭제</a>
					</button>
					</span>
				</span>
			</c:if>
			<!-- 글 작성자 : 수정, 삭제 가능 -->
			<c:if test='${login_info.member_id eq vo.member_id}'>
				<span style='display:block; background-color:#FFFFFF; height:35px;'>
					<span style='float:right; margin-top:2.5px; margin-right:2px;'>
					<button class='modify' style='margin-right:5px;'>
						<a style='color:#111111; font-size:15px;'>수정</a>
					</button>
					<button class='delete'>
						<a style='color:#111111; font-size:15px;' 
						   onclick='if(confirm("정말 삭제하시겠습니까?")){$("form").attr("action", "delete.bo"); $("form").submit()}'>삭제</a>
					</button>
					</span>
				</span>
			</c:if>
		</div>
	</div>

	<!-- 게시글 상세보기 -->
	<div style='width:100%; float:left;' >
		<table style='width:90%;'>
			<tr>
				<th class='w-px100'>제목</th>
				<td colspan='7'>
					<span style='float:left; margin-left:10px'>${vo.board_title}</span>
				</td>
			</tr>
			<tr>
				<th class='w-px100'>작성자</th>
				<td class='w-px150'>
					<span style='float:left; margin-left:10px'>${vo.member_id}</span>
				</td>
				<th class='w-px100'>작성일자</th>
				<td class='w-px200'>${vo.board_date}</td>
				<th class='w-px100'>게시판</th>
				<td class='w-px100'>${vo.board_subject}</td>
				<th class='w-px100'>지역</th>
				<td class='w-px200'>${vo.board_city} ${vo.board_region}</td>
			</tr>
			<tr>
				<th class='w-px100' style='height:428px;'>내용</th>
				<td colspan='5'>
					<span style='float:left; margin:10px'>${vo.board_content}</span>
				</td>
				<th class='w-px100'>첨부사진</th>
				<c:set var='imgpath' value='<img src="${vo.board_imagepath}" width="100%"/>' />
				<td>${empty vo.board_imagepath ? '' : imgpath}</td>
			</tr>
		</table>
	</div>
	
	<!-- 버튼 -->
	<div style='width:100%; float:left; margin:10px 0;' >
		<div style='width:90%; height:30px; margin:0 auto; background-color: #FFB4BE;'>
			<span style='display:block; background-color:#FFFFFF; width:200px; height:35px; margin:0 auto;'>
			<button style='height:30px; width:100px; font-size:15px;'><a onclick='$("form").submit()'>목록으로</a></button>
			</span>
		</div>
	</div>

</form>

</body>
</html>