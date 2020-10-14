<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style type="text/css">
input {
	border: none;
	width: 97%;
}
table {
	padding : 50px;
	border: 1px solid gray;"
}

table tr {
	height: 50px;
}
table th {
	text-align: left;
}
table td, #member_address {
	border-bottom: 2px solid gray;
}
.btn1{
	background-color: navy;	
	color:white;
}

.btn2{
	background-color: white;	
	color:navy;
}
.btn1, .btn2{
	padding: 10px 30px;
	width:200px;
	border-radius: 5px;
	font-size: 20px;
	box-shadow: 2px 2px 3px #022d72;
}

#post {
	padding: 5px 10px;
	width:100px;
	border-radius: 3px;
	font-size: 10px;
	box-shadow: 2px 2px 3px #022d72;
	background-color: navy;	
	color:white;
	height: 30px;
}

#member_post {
	width: 100px;
	border: 1px solid gray;
	height: 28px;
	margin-right: 10px;
	padding: 0px;
}


</style>
</head>
<body>
<h2>마이페이지</h2>
<div align="center">
<form action="update.no" method="post">
<input type="hidden" name="member_id" value="${login_info.member_id }" />
<input type="hidden" name="member_name" value="${login_info.member_name }" />
<table style="width: 60%; margin-top: 50px;">
	<tr>
		<th id="member_id">아이디</th>
		<td>${login_info.member_id }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td id="member_name">${login_info.member_name }</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" id="member_pw" placeholder="8~10자 영문대소문자, 특수문자 포함"></td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" id="member_pw_confirm" placeholder="비밀번호확인"></td>
	</tr>
	<tr>
		<th>핸드폰번호</th>
		<td><input type="text" value="${login_info.member_phonenum }" name="member_phonenum" ></td>
	</tr>
	<tr>
		<th>비밀번호 찾기 질문</th>
		<td><select name="member_question">
			<option ${login_info.member_question eq '당신이 가장 존경하는 사람은?' ? 'selected' : ''}>당신이 가장 존경하는 사람은?</option>
			<option ${login_info.member_question eq '당신의 반려동물의 이름은?' ? 'selected' : ''}>당신의 반려동물의 이름은?</option>
			<option ${login_info.member_question eq '당신의 반려동물을 입양한 날짜는?' ? 'selected' : ''}>당신의 반려동물을 입양한 날짜는?</option>
			<option ${login_info.member_question eq '당신의 보물 1호는?' ? 'selected' : ''}>당신의 보물 1호는?</option>
			<option ${login_info.member_question eq '당신이 가장 인상깊게 본 영화의 제목은?' ? 'selected' : ''}>당신이 가장 인상깊게 본 영화의 제목은?</option>
		</select></td>
	</tr>
	<tr>
		<th>비밀번호 찾기 답변</th>
		<td><input type="text" value="${login_info.member_answer }" name="member_answer" ></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" value="${login_info.member_email }" name="member_email" ></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" value="${login_info.member_post }" id="member_post" name="member_post" readonly="readonly"><button id="post">우편번호찾기</button><br/>
			<input type="text" value="${login_info.member_address }" id="member_address" name="member_address" readonly="readonly">
			<input type="text" value="" name="member_address2" placeholder="상세주소" ></td>
	</tr>
	</table>
</form>

<div class="btnSet" style="margin-bottom: 100px;">
<script type="text/javascript" src="js/need_check.js"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
<script type="text/javascript" src="js/image_preview.js"></script>
<a class="btn1" onclick="if($('form').submit();}">저장</a>
<a class="btn2" href="javascript:history.go(-1)">취소</a>
</div>

</div>
</body>
</html>