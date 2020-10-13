<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>

<style type="text/css">
table { width: 60% }
table, table th, table td {
	margin: 0 auto;
	border: 1px solid black;
}
</style>

</head>
<body>

<div>

<form action='insert.bo' method='post' enctype='multipart/form-data'>
	<!-- 게시글 작성 -->
	<div style='width:100%; float:left; background-color:yellow;' >	
		<table>
			<tr>
				<th>카테고리</th>
				<td>
					<select>
						<option selected='seleted'>카테고리</option>
						<option value='walk'>산책</option>
						<option value='sharing'>나눔</option>
					</select>경기도
				</td>
				<th>지역</th>
				<td>
					<select>
					<option selected='seleted'>선택하세요</option>
						<option value='seoul'>서울특별시</option>
						<option value='busan'>부산광역시</option>
						<option value='daegu'>대구광역시</option>
						<option value='incheon'>인천광역시</option>
						<option value='gwangju'>광주광역시</option>
						<option value='daejeon'>대전광역시</option>
						<option value='ulsan'>울산광역시</option>
						<option value='sejong'>세종특별자치시</option>
						<option value='gyeonggi'>경기도</option>
						<option value='gangwon'>강원도</option>
						<option value='chungbuk'>충청북도</option>
						<option value='chungnam'>충청남도</option>
						<option value='jeonbuk'>전라북도</option>
						<option value='jeonnam'>전라남도</option>
						<option value='Gyeongbuk'>경상북도</option>
						<option value='Gyeongnam'>경상남도</option>
						<option value='jeju'>제주특별자치도</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan='3'><input type='text' name='title' title='제목'/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan=3'><textarea name='content' title='내용'></textarea></td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td colspan=3'></td>
			</tr>
		</table>
	</div>
</form>
	
	<!-- 버튼 -->
	<div style='width:100%; float:left; background-color:gray;' >
		<button><a href='list.bo'>취소</a></button>
		<button onclick='$("form").submit()'>글쓰기</button>
	</div>

</div>

</body>
</html>