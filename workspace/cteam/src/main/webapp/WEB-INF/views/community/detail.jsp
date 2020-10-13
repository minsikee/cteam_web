<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티<</title>

<style type="text/css">
</style>

</head>
<body>

<div>

	<!-- 상단 메뉴 -->
	<div style='width:100%; float:left; margin:10px 0;' >
		<div style='width:90%; margin:0 auto;'>
			<span style='display:block; background-color:#FFB4BE; height:35px;'>
				<span style='float:right; margin-top:2.5px; margin-right:2px;'>
				<button style='width:75px; height:30px; margin-right:5px;'>
					<a style='color:#111111; font-size:15px;'>수정</a>
				</button>
				<button style='width:75px; height:30px;'>
					<a style='color:#111111; font-size:15px;'>삭제</a>
				</button>
				</span>
			</span>
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
				<td>${empty vo.board_imagepath ? '' : '<img src="${vo.board_imagepath}" width="100%"/>'}</td>
			</tr>
		</table>
	</div>
	
	<!-- 버튼 -->
	<div style='width:100%; float:left; margin:10px 0;' >
		<div style='width:90%; height:30px; margin:0 auto; background-color: #FFB4BE;'>
			<span style='display:block; background-color:#FFFFFF; width:200px; height:35px; margin:0 auto;'>
			<button style='height:30px; width:100px; font-size:15px;'><a href='list.bo'>목록으로</a></button>
			</span>
		</div>
	</div>

</div>

</body>
</html>