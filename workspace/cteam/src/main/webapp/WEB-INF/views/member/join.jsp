<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
<style type="text/css">
	table tr td input{ width:300px; height: 50px; }
	table tr td input[name=tel], table tr td input[name=post]{width:150px; text-align: center;}
	table tr th, table tr td{ text-align: left; }
	
	
</style>
</head>

<body>
	<p style="margin: 0 auto; padding-bottom:5px; font-size:13px;" >*은 필수입력입니다</p>
	<form action="join" method="post">
		<table class="w-px160">
			<tr><th class="w-px160">* 성명</th></tr>
				<td><input type="text" name="member_name" required="required"></td>
			</tr>
				<tr><th class="w-px160">* 아이디</th></tr>
				<td><input type="text" name="member_id" required="required"></td>
			</tr>
				</tr>
				<tr><th class="w-px160">* 비밀번호</th></tr>
				<td><input type="text" name="member_pw" required="required"></td>
			</tr>
			</tr>
				<tr><th class="w-px160">* 비밀번호 확인</th></tr>
				<td><input type="text" name="member_pw_ck" required="required"></td>
			</tr>
			</tr>
				<tr><th class="w-px160">* 이메일</th></tr>
				<td><input type="text" name="member_email" required="required"></td>
			</tr>
			</tr>
				<tr><th class="w-px160">* 전화번호</th></tr>
				<td><input type="text" name="member_phonenum" maxlength="3">
				-<input type="text" name="member_phonenum" maxlength="4">
				-<input type="text" name="member_phonenum" maxlength="4"></td>
			</tr>
			<tr>
				<tr><th class="w-px160">주소</th></tr>
				<td><a class="btn-fill-s" onclick="daum_post()">우편번호찾기</a> 
					<input type="text" name="post" maxlength="5" readonly><br/>
					<input type="text" name="post" readonly/>
					<input type="text" name="member_address"/>
				</td>	
			</tr>
				
		</table>
	</form>
	<div class="btnSet">
		<a class="btn-fill" onclick="go_join()">회원가입</a>
		<a class="btn-empty" onclick="history.go(-1)">취소</a>
	</div>

	
	<script type="text/javascript">
		function go_join(){
			if()
		}
	</script>

</body>
</html>