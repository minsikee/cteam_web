<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
	<header style="padding: 15px 0; text-align: left;" >
		<div style="margin-left:100px" class='category' >
			<ul>
				<li><a href='<c:url value="/" />'><img src='img/catbody.png'></li>
				<li><a href="list.co">회사소개</a></li>
				<li><a href="list.no">공지사항</a></li>
				<li><a href="list.sh" ${category eq 'sh' ? 'class="active"' : '' } >상품페이지</a></li>
				<li><a href="list.bo">커뮤니티</a></li>
				<li><a href="list.qn">QNA</a></li>		
				<li><a href="">반려동물정보</a></li>		
				<li><a href="">내 펫 정보</a></li>	
						
			</ul>
		</div>

	<div style="position:absolute; right:0; top:25px; margin-right:100px;">		
	<c:if test="${!empty login_info }">
		<ul>
			<li>${login_info.member_name }님 [${login_info.member_id }] 환영합니다</li>
			<li><a href="list.my"  ${category eq 'my' ? 'class="active"' : '' }>마이페이지</a></li>
			<li><a onclick="go_logout()">로그아웃</a></li>
		</ul>
	</c:if>
	<c:if test="${empty login_info}">
		<ul>	
			<li><a href="loginPage">로그인</a></li>
			<li><a href="member">회원가입</a></li>
		</ul>

	</c:if>	
	</div>
	
	</header>
	
	
	
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script>
		function go_logout(){

				$.ajax({
				url:'logout',
				success:function(){
					alert("로그아웃되었습니다");
					location.reload();},
				error:function(req,text){
					alert(text+":"+req.status);
				}
				
			});
	
			
		}
		
	</script>
	
	<script type="text/javascript">
        var naver_id_login = new naver_id_login("5KDJ2AowQdWU418eNmvz", "http://localhost:8089/cteam/callback"); // 역시 마찬가지로 'localhost'가 포함된 CallBack URL
        
        // 접근 토큰 값 출력
        alert(naver_id_login.oauthParams.access_token);
        
        // 네이버 사용자 프로필 조회
        naver_id_login.get_naver_userprofile("naverSignInCallback()");
        
        // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
        function naverSignInCallback() {
            alert(naver_id_login.getProfileData('email'));
            alert(naver_id_login.getProfileData('age'));
        }
    </script>
	
	
	<style type="text/css">
		header ul, header ul li { margin: 0;   padding: 0; display:inline; }
		header div.category{font-size:18px;}
		header div.category li:not(:first-child) {padding-left:30px;}
		header div.category li a:hover, header div.category li a.active{ font-weight:bold; color:pink; } 
	
		
		header li input{ display:block; }
		#userid, #userpwd{width:100px; height: 20px;}

	</style>
