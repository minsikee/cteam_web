<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
<style type="text/css">
	table tr td input{ width:300px; height: 40px; }
	table tr td input[name=member_post]{width:70px; text-align: center;}
	table tr td input[name=member_post],table tr td input[name=member_address]{margin-bottom: 10px;} 
	table tr th, table tr td{ text-align: left; }
	
	.valid{ color: green; font-size: 12px;}
	.invalid{ color: red; font-size: 12px; }
	
</style>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>

<body>
<div style="margin:30px auto; text-align: center">
	<h1 class="w-pct60" style=" margin:0 auto; padding-bottom:10px; font-size:20px; font-weight: bold;" >회원가입</h1>
	<br/>
	<p class="w-pct60" style="text-align:left; margin: 0 auto; padding-bottom:5px; font-size:13px;" >*은 필수입력입니다</p>
	
	<form action="join" method="post" >
		<table class="w-pct60" style="margin: 0 auto">
			<tr><th class="w-px160">* 성명</th>
				<td><input type="text" name="member_name" required="required"></td>
			</tr>
			<tr><th class="w-px160">* 아이디</th>
				<td><input type="text" name="member_id" class='chk' required="required"><a class="btn-fill-s" id="btn-id" style="margin-left:10px;">아이디 중복확인</a>
				<div class="valid">아이디를 입력하세요(영문 소문자, 숫자만 입력가능합니다.)</div>
				</td>
				
			</tr>
			<tr><th class="w-px160">* 비밀번호</th>
				<td><input type="password" name="member_pw" class='chk' required="required">
				<div class="valid">비밀번호를 입력하세요(영문, 숫자, 특수문자를 모두 포함 8-12자.)</div>
				
				</td>
			</tr>
			<tr>
				<th class="w-px160">* 비밀번호 확인</th>
				<td><input type="password" name="member_pw_ck" class='chk' required="required">
				<div class="valid">비밀번호를 다시 입력하세요</div>
				</td>
			</tr>
			<tr><th class="w-px160">* 이메일</th>
				<td><input type="text" name="member_email" class='chk' required="required">
					<div class="valid">이메일을 입력하세요</div>
				</td>
			</tr>
			<tr><th class="w-px160">* 전화번호</th>
				<td><input type="text" name="member_phonenum" maxlength="11" onKeyup="SetNum(this);"></td>
			</tr>
			
			<tr style="margin:10px 0;">
				<th class="w-px160">* 비밀번호 찾기 질문</th>
				<td>
					<select name="member_question"> 
						<option value="당신이 가장 존경하는 사람은?">당신이 가장 존경하는 사람은?</option> 
						<option value="당신의 반려동물의 이름은?">당신의 반려동물의 이름은?</option> 
						<option value="당신의 반려동물을 입양한 날짜는?">당신의 반려동물을 입양한 날짜는?</option> 
						<option value="당신의 보물 1호는?">당신의 보물 1호는?</option> 
						<option value="당신이 가장 인상깊게 본 영화의 제목은?">당신이 가장 인상깊게 본 영화의 제목은?</option> 
					</select>
				</td>
			</tr>
			<tr><th class="w-px160">* 비밀번호 찾기 답</th>
				<td><input type="text" name="member_answer" class='chk' required="required">
					<div class="valid">비밀번호 찾기 답을 입력하세요</div>
					
				</td>
				
			</tr>
			<tr>
				<th class="w-px160">주소</th>
				<td>
					<input type="text" name="member_post" maxlength="5" readonly>
					<a class="btn-fill-s" onclick="daum_post()" >우편번호찾기</a> <br/>
					<input type="text" name="member_address" readonly/>
					<input type="text" name="member_address2" value="상세주소를 입력하세요" onfocus="this.value=''"/>
				</td>	
			</tr>
				
		</table>
	</form>
	<div class="btnSet" >
		<a class="btn-fill" onclick="go_join()" style="display: inline-block; width:200px;">회원가입</a>
		<a class="btn-empty" onclick="history.go(-1)" style="display: inline-block; width:200px; ">취소</a>
	</div>
</div>	

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
		
	<script type="text/javascript">


		function SetNum(obj) {
		 
		 if ((event.keyCode <= 27) || (event.keyCode >= 33 && event.keyCode <= 46) || (event.keyCode >= 91 && event.keyCode <= 93) || (event.keyCode >= 112 && event.keyCode <= 145)) {
		  return false;
		 }
		 
		 val=obj.value;
		 re=/[^0-9]/gi;
		 obj.value=val.replace(re,"");
		 
		}
	
		function go_join(){
			if( $('[name=member_name]').val()==''){
				alert('성명을 입력하세요!');
				$('[name=member_name]').focus();
				return;
			}
			//invalid인경우, 회원가입x
				
			//아이디 조건이 다맞을때 중복확인. 
			if($('[name=member_id]').hasClass('checked') ){
				if( $('[name=member_id]').siblings('div').hasClass('invalid') ){
					alert('[회원가입불가\n]'+join.userid.unUsable.desc );
					$('[name=member_id]').focus();
					return;
				}
			}else{
				//중복확인 x
				if( !item_check ( $('[name=member_id]' )  ) ) return;
				else{
					alert('회원가입 불가 \n' +join.userid.valid.desc);
					$('[name=member_id]').focus();
					return;
				}	
			}

			if( !item_check ($('[name=member_pw]')) ) return;	//invaild이면 가입불가

			if( !item_check ($('[name=member_pw_ck]')) ) return;

			if( !item_check ($('[name=member_email]')) ) return;

			if( !item_check ($('[name=member_answer]')) ) return;

			$('form').submit();
		
			
			
		}


		function item_check( item ){

			var data = join.tag_status( item );	//pwd인지 id인지 구별한뒤 empty 인지 min인지 상태 return
			if( data. code =='invalid'){
				alert('회원가입 불가\n'+data.desc);
				item.focus();
				return false;

			}else 		return true;
		}


		$('#btn-id').on('click', function(){
			userid_check();
		});


		function userid_check(){

			//올바른아이디일 경우만
			var $userid = $('[name=member_id]');
			if($userid.hasClass('checked') ) return;

			var data = join.tag_status($userid);
			if( data.code != 'valid' ){
				alert("아이디 중복확인 불필요\n"+data.desc);
				$userid.focus();
				return;
			}

			$.ajax({
				url : 'id_check',
				data: { id:$userid.val() },
				success:function( data ){

					data= join.userid_usable(data);
					display_status($userid.siblings('div'), data);
					$userid.addClass('checked');
				},
				error:function(req,text){
					alert(text+":"+req.status);
				}
				
				
			});
				
		}

		$('.chk').on('keyup',function(){
			//아이디 입력데이터 변경시
			if($(this).attr('name')=='member_id'){
				if(event.keyCode==13) userid_check();
				else{
					$(this).removeClass('checked');
					validate($(this));
				}
				
			}else validate($(this));

			validate($(this));

		});

		function validate(tag){

			var data= join.tag_status(tag);
			display_status(tag.siblings('div'), data);
		}


		
		function display_status(div ,data){
			div.text(data.desc);
			div.removeClass();
			div.addClass(data.code);
			
		}


		function daum_post(){
			new daum.Postcode({
				oncomplete:function(data){
					$('[name=member_post]').val(data.zonecode);//우편번호
					var member_address 
						= data.userSelectedType =='J' ? data.jibunAddress:data.roadAddress;
					if(data.buildingName != '')
						member_address +='('+data.buildingName+')';
					$('[name=member_address]').eq(0).val(member_address);	

				}
			}).open();
			
			
		}


		
	</script>

</body>
</html>