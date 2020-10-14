<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>

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

.cancel, .submit {
	width: 75px;
	height: 30px;
}
</style>

</head>
<body>

	<!-- 상단 메뉴 -->
	<div style='width:100%; float:left; margin:10px 0;'>
		<div style='width:90%; margin:0 auto;'>
			<span style='display:block; background-color:#FFB4BE; height:35px;'>
			</span>
		</div>
	</div>

	<!-- 게시글 작성 -->
	<form method="post" action="insert.bo">
	<div style='width:100%; float:left;' >
		<table style='width:90%;'>
			<tr>
				<th class='w-px100'>제목</th>
				<td class='w-px400'>
					<input class='need' type='text' name='title' title='제목' 
					style='height:25px; width:100%; margin:0 auto; padding:0px 10px; 
					vertical-align:middel; border:0px; box-sizing:border-box;'/>
				</td>
				<th class='w-px100'>게시판</th>
				<td class='w-px100'>
					<select name='search' style='width:90%; height:25px; border:none;'>
						<option selected='selected' disabled='disabled'>-- 카테고리 --</option>
						<option value='walk' ${page.search eq 'walk' ? 'selected' : ''}>산책</option>
						<option value='sharing' ${page.search eq 'sharing' ? 'selected' : ''}>나눔</option>
					</select>
				</td>
				<th class='w-px100'>지역</th>
				<td class='w-px250'>
					<!-- 지역 선택 -->
					<select class='need' name='search2' style='width:40%; height:25px; border:none;' >
						<option selected='selected' disabled='disabled'>-- 전체 지역 --</option>
						<option value='seoul' ${search2 eq 'seoul' ? 'selected' : ''}>서울특별시</option>
						<option value='busan' ${search2 eq 'busan' ? 'selected' : ''}>부산광역시</option>
						<option value='daegu' ${search2 eq 'daegu' ? 'selected' : ''}>대구광역시</option>
						<option value='incheon' ${search2 eq 'incheon' ? 'selected' : ''}>인천광역시</option>
						<option value='gwangju' ${search2 eq 'gwangju' ? 'selected' : ''}>광주광역시</option>
						<option value='daejeon' ${search2 eq 'daejeon' ? 'selected' : ''}>대전광역시</option>
						<option value='ulsan' ${search2 eq 'ulsan' ? 'selected' : ''}>울산광역시</option>
						<option value='sejong' ${search2 eq 'sejong' ? 'selected' : ''}>세종특별자치시</option>
						<option value='gyeonggi' ${search2 eq 'gyeonggi' ? 'selected' : ''}>경기도</option>
						<option value='gangwon' ${search2 eq 'gangwon' ? 'selected' : ''}>강원도</option>
						<option value='chungbuk' ${search2 eq 'chungbuk' ? 'selected' : ''}>충청북도</option>
						<option value='chungnam' ${search2 eq 'chungnam' ? 'selected' : ''}>충청남도</option>
						<option value='jeonbuk' ${search2 eq 'jeonbuk' ? 'selected' : ''}>전라북도</option>
						<option value='jeonnam' ${search2 eq 'jeonnam' ? 'selected' : ''}>전라남도</option>
						<option value='gyeongbuk'> ${search2 eq 'gyeongbuk' ? 'selected' : ''}경상북도</option>
						<option value='gyeongnam' ${search2 eq 'gyeongnam' ? 'selected' : ''}>경상남도</option>
						<option value='jeju' ${search2 eq 'jeju' ? 'selected' : ''}>제주특별자치도</option>
					</select>
<!-- 					
						<option selected='seleted'>지역을 선택하세요</option>
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
 -->
 					<!-- 지역 상세 -->
					<select name='search3' style='width:30%; height:25px; margin-left:10%; border:none;'>
						<option value='allregion' ${search3 eq 'allregion' ? 'selected' : ''}>-- 전체 --</option>
						<c:if test='${search2 eq "seoul"}'>
						<option value='seoul1' ${search3 eq 'seoul1' ? 'selected' : ''}>강남구</option>
						<option value='seoul2' ${search3 eq 'seoul2' ? 'selected' : ''}>강동구</option>
						<option value='seoul3' ${search3 eq 'seoul3' ? 'selected' : ''}>강북구</option>
						<option value='seoul4' ${search3 eq 'seoul4' ? 'selected' : ''}>강서구</option>
						<option value='seoul5' ${search3 eq 'seoul5' ? 'selected' : ''}>관악구</option>
						<option value='seoul6' ${search3 eq 'seoul6' ? 'selected' : ''}>광진구</option>
						<option value='seoul7' ${search3 eq 'seoul7' ? 'selected' : ''}>구로구</option>
						<option value='seoul8' ${search3 eq 'seoul8' ? 'selected' : ''}>금천구</option>
						<option value='seoul9' ${search3 eq 'seoul9' ? 'selected' : ''}>노원구</option>
						<option value='seoul10' ${search3 eq 'seoul10' ? 'selected' : ''}>도봉구</option>
						<option value='seoul11' ${search3 eq 'seoul11' ? 'selected' : ''}>동대문구</option>
						<option value='seoul12' ${search3 eq 'seoul12' ? 'selected' : ''}>동작구</option>
						<option value='seoul13' ${search3 eq 'seoul13' ? 'selected' : ''}>마포구</option>
						<option value='seoul14' ${search3 eq 'seoul14' ? 'selected' : ''}>서대문구</option>
						<option value='seoul15' ${search3 eq 'seoul15' ? 'selected' : ''}>서초구</option>
						<option value='seoul16' ${search3 eq 'seoul16' ? 'selected' : ''}>성동구</option>
						<option value='seoul17' ${search3 eq 'seoul17' ? 'selected' : ''}>성북구</option>
						<option value='seoul18' ${search3 eq 'seoul18' ? 'selected' : ''}>송파구</option>
						<option value='seoul19' ${search3 eq 'seoul19' ? 'selected' : ''}>양천구</option>
						<option value='seoul20' ${search3 eq 'seoul20' ? 'selected' : ''}>영등포구</option>
						<option value='seoul21' ${search3 eq 'seoul21' ? 'selected' : ''}>용산구</option>
						<option value='seoul22' ${search3 eq 'seoul22' ? 'selected' : ''}>은평구</option>
						<option value='seoul23' ${search3 eq 'seoul23' ? 'selected' : ''}>종로구</option>
						<option value='seoul24' ${search3 eq 'seoul24' ? 'selected' : ''}>중구</option>
						<option value='seoul25' ${search3 eq 'seoul25' ? 'selected' : ''}>중랑구</option>
						</c:if>
					<c:if test='${search2 eq "busan"}'>
						<option value='busan1' ${search3 eq 'busan1' ? 'selected' : ''}>강서구</option>
						<option value='busan2' ${search3 eq 'busan2' ? 'selected' : ''}>금정구</option>
						<option value='busan3' ${search3 eq 'busan3' ? 'selected' : ''}>기장군</option>
						<option value='busan4' ${search3 eq 'busan4' ? 'selected' : ''}>남구</option>
						<option value='busan5' ${search3 eq 'busan5' ? 'selected' : ''}>동구</option>
						<option value='busan6' ${search3 eq 'busan6' ? 'selected' : ''}>동래구</option>
						<option value='busan7' ${search3 eq 'busan7' ? 'selected' : ''}>부산진구</option>
						<option value='busan8' ${search3 eq 'busan8' ? 'selected' : ''}>북구</option>
						<option value='busan9' ${search3 eq 'busan9' ? 'selected' : ''}>사상구</option>
						<option value='busan10' ${search3 eq 'busan10' ? 'selected' : ''}>사하구</option>
						<option value='busan11' ${search3 eq 'busan11' ? 'selected' : ''}>서구</option>
						<option value='busan12' ${search3 eq 'busan12' ? 'selected' : ''}>수영구</option>
						<option value='busan13' ${search3 eq 'busan13' ? 'selected' : ''}>연제구</option>
						<option value='busan14' ${search3 eq 'busan14' ? 'selected' : ''}>영도구</option>
						<option value='busan15' ${search3 eq 'busan15' ? 'selected' : ''}>중구</option>
						<option value='busan16' ${search3 eq 'busan16' ? 'selected' : ''}>해운대구</option>
					</c:if>
					<c:if test='${search2 eq "daegu"}'>
						<option value='daegu1' ${search3 eq 'daegu1' ? 'selected' : ''}>중구</option>
						<option value='daegu2' ${search3 eq 'daegu2' ? 'selected' : ''}>동구</option>
						<option value='daegu3' ${search3 eq 'daegu3' ? 'selected' : ''}>서구</option>
						<option value='daegu4' ${search3 eq 'daegu4' ? 'selected' : ''}>남구</option>
						<option value='daegu5' ${search3 eq 'daegu5' ? 'selected' : ''}>북구</option>
						<option value='daegu6' ${search3 eq 'daegu6' ? 'selected' : ''}>수성구</option>
						<option value='daegu7' ${search3 eq 'daegu7' ? 'selected' : ''}>달서구</option>
						<option value='daegu8' ${search3 eq 'daegu8' ? 'selected' : ''}>달성군</option>
					</c:if>
					<c:if test='${search2 eq "incheon"}'>
						<option value='incheon1' ${search3 eq 'incheon1' ? 'selected' : ''}>강화군</option>
						<option value='incheon2' ${search3 eq 'incheon2' ? 'selected' : ''}>계양구</option>
						<option value='incheon3' ${search3 eq 'incheon3' ? 'selected' : ''}>남구</option>
						<option value='incheon4' ${search3 eq 'incheon4' ? 'selected' : ''}>남동구</option>
						<option value='incheon5' ${search3 eq 'incheon5' ? 'selected' : ''}>동구</option>
						<option value='incheon6' ${search3 eq 'incheon6' ? 'selected' : ''}>부평구</option>
						<option value='incheon7' ${search3 eq 'incheon7' ? 'selected' : ''}>서구</option>
						<option value='incheon8' ${search3 eq 'incheon8' ? 'selected' : ''}>연수구</option>
						<option value='incheon9' ${search3 eq 'incheon9' ? 'selected' : ''}>옹진군</option>
						<option value='incheon10' ${search3 eq 'incheon10' ? 'selected' : ''}>중구</option>
					</c:if>
					<c:if test='${search2 eq "gwangju"}'>
						<option value='gwangju1' ${search3 eq 'gwangju1' ? 'selected' : ''}>동구</option>
						<option value='gwangju2' ${search3 eq 'gwangju2' ? 'selected' : ''}>서구</option>
						<option value='gwangju3' ${search3 eq 'gwangju3' ? 'selected' : ''}>남구</option>
						<option value='gwangju4' ${search3 eq 'gwangju4' ? 'selected' : ''}>북구</option>
						<option value='gwangju5' ${search3 eq 'gwangju5' ? 'selected' : ''}>광산구</option>
					</c:if>
					<c:if test='${search2 eq "daejeon"}'>
						<option value='daejeon1' ${search3 eq 'daejeon1' ? 'selected' : ''}>대덕구</option>
						<option value='daejeon2' ${search3 eq 'daejeon2' ? 'selected' : ''}>동구</option>
						<option value='daejeon3' ${search3 eq 'daejeon3' ? 'selected' : ''}>서구</option>
						<option value='daejeon4' ${search3 eq 'daejeon4' ? 'selected' : ''}>유성구</option>
						<option value='daejeon5' ${search3 eq 'daejeon5' ? 'selected' : ''}>중구</option>
					</c:if>
					<c:if test='${search2 eq "ulsan"}'>
						<option value='ulsan1' ${search3 eq 'ulsan1' ? 'selected' : ''}>동구</option>
						<option value='ulsan2' ${search3 eq 'ulsan2' ? 'selected' : ''}>남구</option>
						<option value='ulsan3' ${search3 eq 'ulsan3' ? 'selected' : ''}>북구</option>
						<option value='ulsan4' ${search3 eq 'ulsan4' ? 'selected' : ''}>울주군</option>
						<option value='ulsan5' ${search3 eq 'ulsan5' ? 'selected' : ''}>중구</option>
					</c:if>
					<c:if test='${search2 eq "gyeonggi"}'>
						<option value='gyeonggi1' ${search3 eq 'gyeonggi1' ? 'selected' : ''}>가평군</option>
						<option value='gyeonggi2' ${search3 eq 'gyeonggi2' ? 'selected' : ''}>고양시</option>
						<option value='gyeonggi3' ${search3 eq 'gyeonggi3' ? 'selected' : ''}>과천시</option>
						<option value='gyeonggi4' ${search3 eq 'gyeonggi4' ? 'selected' : ''}>광명시</option>
						<option value='gyeonggi5' ${search3 eq 'gyeonggi5' ? 'selected' : ''}>광주시</option>
						<option value='gyeonggi6' ${search3 eq 'gyeonggi6' ? 'selected' : ''}>구리시</option>
						<option value='gyeonggi7' ${search3 eq 'gyeonggi7' ? 'selected' : ''}>군포시</option>
						<option value='gyeonggi8' ${search3 eq 'gyeonggi8' ? 'selected' : ''}>김포시</option>
						<option value='gyeonggi9' ${search3 eq 'gyeonggi9' ? 'selected' : ''}>남양주시</option>
						<option value='gyeonggi10' ${search3 eq 'gyeonggi10' ? 'selected' : ''}>동두천시</option>
						<option value='gyeonggi11' ${search3 eq 'gyeonggi11' ? 'selected' : ''}>부천시</option>
						<option value='gyeonggi12' ${search3 eq 'gyeonggi12' ? 'selected' : ''}>성남시</option>
						<option value='gyeonggi13' ${search3 eq 'gyeonggi13' ? 'selected' : ''}>수원시</option>
						<option value='gyeonggi14' ${search3 eq 'gyeonggi14' ? 'selected' : ''}>시흥시</option>
						<option value='gyeonggi15' ${search3 eq 'gyeonggi15' ? 'selected' : ''}>안산시</option>
						<option value='gyeonggi16' ${search3 eq 'gyeonggi16' ? 'selected' : ''}>안성시</option>
						<option value='gyeonggi17' ${search3 eq 'gyeonggi17' ? 'selected' : ''}>안양시</option>
						<option value='gyeonggi18' ${search3 eq 'gyeonggi18' ? 'selected' : ''}>양주시</option>
						<option value='gyeonggi19' ${search3 eq 'gyeonggi19' ? 'selected' : ''}>양평군</option>
						<option value='gyeonggi20' ${search3 eq 'gyeonggi20' ? 'selected' : ''}>여주시</option>
						<option value='gyeonggi21' ${search3 eq 'gyeonggi21' ? 'selected' : ''}>연천군</option>
						<option value='gyeonggi22' ${search3 eq 'gyeonggi22' ? 'selected' : ''}>오산시</option>
						<option value='gyeonggi23' ${search3 eq 'gyeonggi23' ? 'selected' : ''}>용인시</option>
						<option value='gyeonggi24' ${search3 eq 'gyeonggi24' ? 'selected' : ''}>의왕시</option>
						<option value='gyeonggi25' ${search3 eq 'gyeonggi25' ? 'selected' : ''}>의정부시</option>
						<option value='gyeonggi26' ${search3 eq 'gyeonggi26' ? 'selected' : ''}>이천시</option>
						<option value='gyeonggi27' ${search3 eq 'gyeonggi27' ? 'selected' : ''}>파주시</option>
						<option value='gyeonggi28' ${search3 eq 'gyeonggi28' ? 'selected' : ''}>평택시</option>
						<option value='gyeonggi29' ${search3 eq 'gyeonggi29' ? 'selected' : ''}>포천시</option>
						<option value='gyeonggi30' ${search3 eq 'gyeonggi30' ? 'selected' : ''}>하남시</option>
						<option value='gyeonggi31' ${search3 eq 'gyeonggi31' ? 'selected' : ''}>화성시</option>
					</c:if>
					<c:if test='${search2 eq "gangwon"}'>
						<option value='gangwon1' ${search3 eq 'gangwon1' ? 'selected' : ''}>강릉시</option>
						<option value='gangwon2' ${search3 eq 'gangwon2' ? 'selected' : ''}>고성군</option>
						<option value='gangwon3' ${search3 eq 'gangwon3' ? 'selected' : ''}>동해시</option>
						<option value='gangwon4' ${search3 eq 'gangwon4' ? 'selected' : ''}>삼척시</option>
						<option value='gangwon5' ${search3 eq 'gangwon5' ? 'selected' : ''}>속초시</option>
						<option value='gangwon6' ${search3 eq 'gangwon6' ? 'selected' : ''}>양구군</option>
						<option value='gangwon7' ${search3 eq 'gangwon7' ? 'selected' : ''}>양양군</option>
						<option value='gangwon8' ${search3 eq 'gangwon8' ? 'selected' : ''}>영월군</option>
						<option value='gangwon9' ${search3 eq 'gangwon9' ? 'selected' : ''}>원주시</option>
						<option value='gangwon10' ${search3 eq 'gangwon10' ? 'selected' : ''}>인제군</option>
						<option value='gangwon11' ${search3 eq 'gangwon11' ? 'selected' : ''}>정선군</option>
						<option value='gangwon12' ${search3 eq 'gangwon12' ? 'selected' : ''}>철원군</option>
						<option value='gangwon13' ${search3 eq 'gangwon13' ? 'selected' : ''}>춘천시</option>
						<option value='gangwon14' ${search3 eq 'gangwon14' ? 'selected' : ''}>태백시</option>
						<option value='gangwon15' ${search3 eq 'gangwon15' ? 'selected' : ''}>평창군</option>
						<option value='gangwon16' ${search3 eq 'gangwon16' ? 'selected' : ''}>홍천군</option>
						<option value='gangwon17' ${search3 eq 'gangwon17' ? 'selected' : ''}>화천군</option>
						<option value='gangwon18' ${search3 eq 'gangwon18' ? 'selected' : ''}>횡성군</option>
					</c:if>
					<c:if test='${search2 eq "chungbuk"}'>
						<option value='chungbuk1' ${search3 eq 'chungbuk1' ? 'selected' : ''}>괴산군</option>
						<option value='chungbuk2' ${search3 eq 'chungbuk2' ? 'selected' : ''}>단양군</option>
						<option value='chungbuk3' ${search3 eq 'chungbuk3' ? 'selected' : ''}>보은군</option>
						<option value='chungbuk4' ${search3 eq 'chungbuk4' ? 'selected' : ''}>영동군</option>
						<option value='chungbuk5' ${search3 eq 'chungbuk5' ? 'selected' : ''}>옥천군</option>
						<option value='chungbuk6' ${search3 eq 'chungbuk6' ? 'selected' : ''}>음성군</option>
						<option value='chungbuk7' ${search3 eq 'chungbuk7' ? 'selected' : ''}>제천시</option>
						<option value='chungbuk8' ${search3 eq 'chungbuk8' ? 'selected' : ''}>증평군</option>
						<option value='chungbuk9' ${search3 eq 'chungbuk9' ? 'selected' : ''}>진천군</option>
						<option value='chungbuk10' ${search3 eq 'chungbuk10' ? 'selected' : ''}>청주시</option>
						<option value='chungbuk11' ${search3 eq 'chungbuk11' ? 'selected' : ''}>충주시</option>
					</c:if>
					<c:if test='${search2 eq "chungnam"}'>
						<option value='chungnam1' ${search3 eq 'chungnam1' ? 'selected' : ''}>계룡시</option>
						<option value='chungnam2' ${search3 eq 'chungnam2' ? 'selected' : ''}>공주시</option>
						<option value='chungnam3' ${search3 eq 'chungnam3' ? 'selected' : ''}>금산군</option>
						<option value='chungnam4' ${search3 eq 'chungnam4' ? 'selected' : ''}>논산시</option>
						<option value='chungnam5' ${search3 eq 'chungnam5' ? 'selected' : ''}>당진시</option>
						<option value='chungnam6' ${search3 eq 'chungnam6' ? 'selected' : ''}>보령시</option>
						<option value='chungnam7' ${search3 eq 'chungnam7' ? 'selected' : ''}>부여군</option>
						<option value='chungnam8' ${search3 eq 'chungnam8' ? 'selected' : ''}>서산시</option>
						<option value='chungnam9' ${search3 eq 'chungnam9' ? 'selected' : ''}>서천군</option>
						<option value='chungnam10' ${search3 eq 'chungnam10' ? 'selected' : ''}>아산시</option>
						<option value='chungnam11' ${search3 eq 'chungnam11' ? 'selected' : ''}>예산군</option>
						<option value='chungnam12' ${search3 eq 'chungnam12' ? 'selected' : ''}>천안시</option>
						<option value='chungnam13' ${search3 eq 'chungnam13' ? 'selected' : ''}>청양군</option>
						<option value='chungnam14' ${search3 eq 'chungnam14' ? 'selected' : ''}>태안군</option>
						<option value='chungnam15' ${search3 eq 'chungnam15' ? 'selected' : ''}>홍성군</option>
					</c:if>
					<c:if test='${search2 eq "jeonbuk"}'>
						<option value='jeonbuk1' ${search3 eq 'jeonbuk1' ? 'selected' : ''}>고창군</option>
						<option value='jeonbuk2' ${search3 eq 'jeonbuk2' ? 'selected' : ''}>군산시</option>
						<option value='jeonbuk3' ${search3 eq 'jeonbuk3' ? 'selected' : ''}>김제시</option>
						<option value='jeonbuk4' ${search3 eq 'jeonbuk4' ? 'selected' : ''}>남원시</option>
						<option value='jeonbuk5' ${search3 eq 'jeonbuk5' ? 'selected' : ''}>무주군</option>
						<option value='jeonbuk6' ${search3 eq 'jeonbuk6' ? 'selected' : ''}>부안군</option>
						<option value='jeonbuk7' ${search3 eq 'jeonbuk7' ? 'selected' : ''}>순창군</option>
						<option value='jeonbuk8' ${search3 eq 'jeonbuk8' ? 'selected' : ''}>완주군</option>
						<option value='jeonbuk9' ${search3 eq 'jeonbuk9' ? 'selected' : ''}>익산시</option>
						<option value='jeonbuk10' ${search3 eq 'jeonbuk10' ? 'selected' : ''}>임실군</option>
						<option value='jeonbuk11' ${search3 eq 'jeonbuk11' ? 'selected' : ''}>장수군</option>
						<option value='jeonbuk12' ${search3 eq 'jeonbuk12' ? 'selected' : ''}>전주시</option>
						<option value='jeonbuk13' ${search3 eq 'jeonbuk13' ? 'selected' : ''}>정읍시</option>
						<option value='jeonbuk14' ${search3 eq 'jeonbuk14' ? 'selected' : ''}>진안군</option>
					</c:if>
					<c:if test='${search2 eq "jeonnam"}'>
						<option value='jeonnam1' ${search3 eq 'jeonnam1' ? 'selected' : ''}>강진군</option>
						<option value='jeonnam2' ${search3 eq 'jeonnam2' ? 'selected' : ''}>고흥군</option>
						<option value='jeonnam3' ${search3 eq 'jeonnam3' ? 'selected' : ''}>곡성군</option>
						<option value='jeonnam4' ${search3 eq 'jeonnam4' ? 'selected' : ''}>광양시</option>
						<option value='jeonnam5' ${search3 eq 'jeonnam5' ? 'selected' : ''}>구례군</option>
						<option value='jeonnam6' ${search3 eq 'jeonnam6' ? 'selected' : ''}>나주시</option>
						<option value='jeonnam7' ${search3 eq 'jeonnam7' ? 'selected' : ''}>담양군</option>
						<option value='jeonnam8' ${search3 eq 'jeonnam8' ? 'selected' : ''}>목포시</option>
						<option value='jeonnam9' ${search3 eq 'jeonnam9' ? 'selected' : ''}>무안군</option>
						<option value='jeonnam10' ${search3 eq 'jeonnam10' ? 'selected' : ''}>보성군</option>
						<option value='jeonnam11' ${search3 eq 'jeonnam11' ? 'selected' : ''}>순천시</option>
						<option value='jeonnam12' ${search3 eq 'jeonnam12' ? 'selected' : ''}>신안군</option>
						<option value='jeonnam13' ${search3 eq 'jeonnam13' ? 'selected' : ''}>여수시</option>
						<option value='jeonnam14' ${search3 eq 'jeonnam14' ? 'selected' : ''}>영광군</option>
						<option value='jeonnam15' ${search3 eq 'jeonnam15' ? 'selected' : ''}>영암군</option>
						<option value='jeonnam16' ${search3 eq 'jeonnam16' ? 'selected' : ''}>완도군</option>
						<option value='jeonnam17' ${search3 eq 'jeonnam17' ? 'selected' : ''}>장성군</option>
						<option value='jeonnam18' ${search3 eq 'jeonnam18' ? 'selected' : ''}>장흥군</option>
						<option value='jeonnam19' ${search3 eq 'jeonnam19' ? 'selected' : ''}>진도군</option>
						<option value='jeonnam20' ${search3 eq 'jeonnam20' ? 'selected' : ''}>함평군</option>
						<option value='jeonnam21' ${search3 eq 'jeonnam21' ? 'selected' : ''}>해남군</option>
						<option value='jeonnam22' ${search3 eq 'jeonnam22' ? 'selected' : ''}>화순군</option>
					</c:if>
					<c:if test='${search2 eq "gyeongbuk"}'>
						<option value='gyeongbuk1' ${search3 eq 'gyeongbuk1' ? 'selected' : ''}>경산시</option>
						<option value='gyeongbuk2' ${search3 eq 'gyeongbuk2' ? 'selected' : ''}>경주시</option>
						<option value='gyeongbuk3' ${search3 eq 'gyeongbuk3' ? 'selected' : ''}>고령군</option>
						<option value='gyeongbuk4' ${search3 eq 'gyeongbuk4' ? 'selected' : ''}>구미시</option>
						<option value='gyeongbuk5' ${search3 eq 'gyeongbuk5' ? 'selected' : ''}>군위군</option>
						<option value='gyeongbuk6' ${search3 eq 'gyeongbuk6' ? 'selected' : ''}>김천시</option>
						<option value='gyeongbuk7' ${search3 eq 'gyeongbuk7' ? 'selected' : ''}>문경시</option>
						<option value='gyeongbuk8' ${search3 eq 'gyeongbuk8' ? 'selected' : ''}>봉화군</option>
						<option value='gyeongbuk9' ${search3 eq 'gyeongbuk9' ? 'selected' : ''}>상주시</option>
						<option value='gyeongbuk10' ${search3 eq 'gyeongbuk10' ? 'selected' : ''}>성주군</option>
						<option value='gyeongbuk11' ${search3 eq 'gyeongbuk11' ? 'selected' : ''}>안동시</option>
						<option value='gyeongbuk12' ${search3 eq 'gyeongbuk12' ? 'selected' : ''}>영덕군</option>
						<option value='gyeongbuk13' ${search3 eq 'gyeongbuk13' ? 'selected' : ''}>영양군</option>
						<option value='gyeongbuk14' ${search3 eq 'gyeongbuk14' ? 'selected' : ''}>영주시</option>
						<option value='gyeongbuk15' ${search3 eq 'gyeongbuk15' ? 'selected' : ''}>영천시</option>
						<option value='gyeongbuk16' ${search3 eq 'gyeongbuk16' ? 'selected' : ''}>예천군</option>
						<option value='gyeongbuk17' ${search3 eq 'gyeongbuk17' ? 'selected' : ''}>울릉군</option>
						<option value='gyeongbuk18' ${search3 eq 'gyeongbuk18' ? 'selected' : ''}>울진군</option>
						<option value='gyeongbuk19' ${search3 eq 'gyeongbuk19' ? 'selected' : ''}>의성군</option>
						<option value='gyeongbuk20' ${search3 eq 'gyeongbuk20' ? 'selected' : ''}>청도군</option>
						<option value='gyeongbuk21' ${search3 eq 'gyeongbuk21' ? 'selected' : ''}>청송군</option>
						<option value='gyeongbuk22' ${search3 eq 'gyeongbuk22' ? 'selected' : ''}>칠곡군</option>
						<option value='gyeongbuk23' ${search3 eq 'gyeongbuk23' ? 'selected' : ''}>포항시</option>
					</c:if>
					<c:if test='${search2 eq "gyeongnam"}'>
						<option value='gyeongnam1' ${search3 eq 'gyeongnam1' ? 'selected' : ''}>거제시</option>
						<option value='gyeongnam2' ${search3 eq 'gyeongnam2' ? 'selected' : ''}>거창군</option>
						<option value='gyeongnam3' ${search3 eq 'gyeongnam3' ? 'selected' : ''}>고성군</option>
						<option value='gyeongnam4' ${search3 eq 'gyeongnam4' ? 'selected' : ''}>김해시</option>
						<option value='gyeongnam5' ${search3 eq 'gyeongnam5' ? 'selected' : ''}>남해군</option>
						<option value='gyeongnam6' ${search3 eq 'gyeongnam6' ? 'selected' : ''}>밀양시</option>
						<option value='gyeongnam7' ${search3 eq 'gyeongnam7' ? 'selected' : ''}>사천시</option>
						<option value='gyeongnam8' ${search3 eq 'gyeongnam8' ? 'selected' : ''}>산청군</option>
						<option value='gyeongnam9' ${search3 eq 'gyeongnam9' ? 'selected' : ''}>양산시</option>
						<option value='gyeongnam10' ${search3 eq 'gyeongnam10' ? 'selected' : ''}>의령군</option>
						<option value='gyeongnam11' ${search3 eq 'gyeongnam11' ? 'selected' : ''}>진주시</option>
						<option value='gyeongnam12' ${search3 eq 'gyeongnam12' ? 'selected' : ''}>청녕군</option>
						<option value='gyeongnam13' ${search3 eq 'gyeongnam13' ? 'selected' : ''}>창원시</option>
						<option value='gyeongnam14' ${search3 eq 'gyeongnam14' ? 'selected' : ''}>통영시</option>
						<option value='gyeongnam15' ${search3 eq 'gyeongnam15' ? 'selected' : ''}>하동군</option>
						<option value='gyeongnam16' ${search3 eq 'gyeongnam16' ? 'selected' : ''}>함안군</option>
						<option value='gyeongnam17' ${search3 eq 'gyeongnam17' ? 'selected' : ''}>함양군</option>
						<option value='gyeongnam18' ${search3 eq 'gyeongnam18' ? 'selected' : ''}>합천군</option>
					</c:if>
					<c:if test='${search2 eq "jeju"}'>
						<option value='jeju1' ${search3 eq 'jeju1' ? 'selected' : ''}>서귀포시</option>
						<option value='jeju2' ${search3 eq 'jeju2' ? 'selected' : ''}>제주시</option>
					</c:if>
<%-- 
						<option value='seoul1'>강남구</option>
						<option value='seoul2'>강동구</option>
						<option value='seoul3'>강북구</option>
						<option value='seoul4'>강서구</option>
						<option value='seoul5'>관악구</option>
						<option value='seoul6'>광진구</option>
						<option value='seoul7'>구로구</option>
						<option value='seoul8'>금천구</option>
						<option value='seoul9'>노원구</option>
						<option value='seoul10'>도봉구</option>
						<option value='seoul11'>동대문구</option>
						<option value='seoul12'>동작구</option>
						<option value='seoul13'>마포구</option>
						<option value='seoul14'>서대문구</option>
						<option value='seoul15'>서초구</option>
						<option value='seoul16'>성동구</option>
						<option value='seoul17'>성북구</option>
						<option value='seoul18'>송파구</option>
						<option value='seoul19'>양천구</option>
						<option value='seoul20'>영등포구</option>
						<option value='seoul21'>용산구</option>
						<option value='seoul22'>은평구</option>
						<option value='seoul23'>종로구</option>
						<option value='seoul24'>중구</option>
						<option value='seoul25'>중랑구</option>
					</c:if>
					<c:if test='${search2 eq "busan"}'>
						<option value='busan1'>강서구</option>
						<option value='busan2'>금정구</option>
						<option value='busan3'>기장군</option>
						<option value='busan4'>남구</option>
						<option value='busan5'>동구</option>
						<option value='busan6'>동래구</option>
						<option value='busan7'>부산진구</option>
						<option value='busan8'>북구</option>
						<option value='busan9'>사상구</option>
						<option value='busan10'>사하구</option>
						<option value='busan11'>서구</option>
						<option value='busan12'>수영구</option>
						<option value='busan13'>연제구</option>
						<option value='busan14'>영도구</option>
						<option value='busan15'>중구</option>
						<option value='busan16'>해운대구</option>
					</c:if>
					<c:if test='${search2 eq "daegu"}'>
						<option value='daegu1'>중구</option>
						<option value='daegu2'>동구</option>
						<option value='daegu3'>서구</option>
						<option value='daegu4'>남구</option>
						<option value='daegu5'>북구</option>
						<option value='daegu6'>수성구</option>
						<option value='daegu7'>달서구</option>
						<option value='daegu8'>달성군</option>
					</c:if>
					<c:if test='${search2 eq "incheon"}'>
						<option value='incheon1'>강화군</option>
						<option value='incheon2'>계양구</option>
						<option value='incheon3'>남구</option>
						<option value='incheon4'>남동구</option>
						<option value='incheon5'>동구</option>
						<option value='incheon6'>부평구</option>
						<option value='incheon7'>서구</option>
						<option value='incheon8'>연수구</option>
						<option value='incheon9'>옹진군</option>
						<option value='incheon10'>중구</option>
					</c:if>
					<c:if test='${search2 eq "gwangju"}'>
						<option value='gwangju1'>동구</option>
						<option value='gwangju2'>서구</option>
						<option value='gwangju3'>남구</option>
						<option value='gwangju4'>북구</option>
						<option value='gwangju5'>광산구</option>
					</c:if>
					<c:if test='${search2 eq "daejeon"}'>
						<option value='daejeon1'>대덕구</option>
						<option value='daejeon2'>동구</option>
						<option value='daejeon3'>서구</option>
						<option value='daejeon4'>유성구</option>
						<option value='daejeon5'>중구</option>
					</c:if>
					<c:if test='${search2 eq "ulsan"}'>
						<option value='ulsan1'>동구</option>
						<option value='ulsan2'>남구</option>
						<option value='ulsan3'>북구</option>
						<option value='ulsan4'>울주군</option>
						<option value='ulsan5'>중구</option>
					</c:if>
					<c:if test='${search2 eq "gyeonggi"}'>
						<option value='gyeonggi1'>가평군</option>
						<option value='gyeonggi2'>고양시</option>
						<option value='gyeonggi3'>과천시</option>
						<option value='gyeonggi4'>광명시</option>
						<option value='gyeonggi5'>광주시</option>
						<option value='gyeonggi6'>구리시</option>
						<option value='gyeonggi7'>군포시</option>
						<option value='gyeonggi8'>김포시</option>
						<option value='gyeonggi9'>남양주시</option>
						<option value='gyeonggi10'>동두천시</option>
						<option value='gyeonggi11'>부천시</option>
						<option value='gyeonggi12'>성남시</option>
						<option value='gyeonggi13'>수원시</option>
						<option value='gyeonggi14'>시흥시</option>
						<option value='gyeonggi15'>안산시</option>
						<option value='gyeonggi16'>안성시</option>
						<option value='gyeonggi17'>안양시</option>
						<option value='gyeonggi18'>양주시</option>
						<option value='gyeonggi19'>양평군</option>
						<option value='gyeonggi20'>여주시</option>
						<option value='gyeonggi21'>연천군</option>
						<option value='gyeonggi22'>오산시</option>
						<option value='gyeonggi23'>용인시</option>
						<option value='gyeonggi24'>의왕시</option>
						<option value='gyeonggi25'>의정부시</option>
						<option value='gyeonggi26'>이천시</option>
						<option value='gyeonggi27'>파주시</option>
						<option value='gyeonggi28'>평택시</option>
						<option value='gyeonggi29'>포천시</option>
						<option value='gyeonggi30'>하남시</option>
						<option value='gyeonggi31'>화성시</option>
					</c:if>
					<c:if test='${search2 eq "gangwon"}'>
						<option value='gangwon1'>강릉시</option>
						<option value='gangwon2'>고성군</option>
						<option value='gangwon3'>동해시</option>
						<option value='gangwon4'>삼척시</option>
						<option value='gangwon5'>속초시</option>
						<option value='gangwon6'>양구군</option>
						<option value='gangwon7'>양양군</option>
						<option value='gangwon8'>영월군</option>
						<option value='gangwon9'>원주시</option>
						<option value='gangwon10'>인제군</option>
						<option value='gangwon11'>정선군</option>
						<option value='gangwon12'>철원군</option>
						<option value='gangwon13'>춘천시</option>
						<option value='gangwon14'>태백시</option>
						<option value='gangwon15'>평창군</option>
						<option value='gangwon16'>홍천군</option>
						<option value='gangwon17'>화천군</option>
						<option value='gangwon18'>횡성군</option>
					</c:if>
					<c:if test='${search2 eq "chungbuk"}'>
						<option value='chungbuk1'>괴산군</option>
						<option value='chungbuk2'>단양군</option>
						<option value='chungbuk3'>보은군</option>
						<option value='chungbuk4'>영동군</option>
						<option value='chungbuk5'>옥천군</option>
						<option value='chungbuk6'>음성군</option>
						<option value='chungbuk7'>제천시</option>
						<option value='chungbuk8'>증평군</option>
						<option value='chungbuk9'>진천군</option>
						<option value='chungbuk10'>청주시</option>
						<option value='chungbuk11'>충주시</option>
					</c:if>
					<c:if test='${search2 eq "chungnam"}'>
						<option value='chungnam1'>계룡시</option>
						<option value='chungnam2'>공주시</option>
						<option value='chungnam3'>금산군</option>
						<option value='chungnam4'>논산시</option>
						<option value='chungnam5'>당진시</option>
						<option value='chungnam6'>보령시</option>
						<option value='chungnam7'>부여군</option>
						<option value='chungnam8'>서산시</option>
						<option value='chungnam9'>서천군</option>
						<option value='chungnam10'>아산시</option>
						<option value='chungnam11'>예산군</option>
						<option value='chungnam12'>천안시</option>
						<option value='chungnam13'>청양군</option>
						<option value='chungnam14'>태안군</option>
						<option value='chungnam15'>홍성군</option>
					</c:if>
					<c:if test='${search2 eq "jeonbuk"}'>
						<option value='jeonbuk1'>고창군</option>
						<option value='jeonbuk2'>군산시</option>
						<option value='jeonbuk3'>김제시</option>
						<option value='jeonbuk4'>남원시</option>
						<option value='jeonbuk5'>무주군</option>
						<option value='jeonbuk6'>부안군</option>
						<option value='jeonbuk7'>순창군</option>
						<option value='jeonbuk8'>완주군</option>
						<option value='jeonbuk9'>익산시</option>
						<option value='jeonbuk10'>임실군</option>
						<option value='jeonbuk11'>장수군</option>
						<option value='jeonbuk12'>전주시</option>
						<option value='jeonbuk13'>정읍시</option>
						<option value='jeonbuk14'>진안군</option>
					</c:if>
					<c:if test='${search2 eq "jeonnam"}'>
						<option value='jeonnam1'>강진군</option>
						<option value='jeonnam2'>고흥군</option>
						<option value='jeonnam3'>곡성군</option>
						<option value='jeonnam4'>광양시</option>
						<option value='jeonnam5'>구례군</option>
						<option value='jeonnam6'>나주시</option>
						<option value='jeonnam7'>담양군</option>
						<option value='jeonnam8'>목포시</option>
						<option value='jeonnam9'>무안군</option>
						<option value='jeonnam10'>보성군</option>
						<option value='jeonnam11'>순천시</option>
						<option value='jeonnam12'>신안군</option>
						<option value='jeonnam13'>여수시</option>
						<option value='jeonnam14'>영광군</option>
						<option value='jeonnam15'>영암군</option>
						<option value='jeonnam16'>완도군</option>
						<option value='jeonnam17'>장성군</option>
						<option value='jeonnam18'>장흥군</option>
						<option value='jeonnam19'>진도군</option>
						<option value='jeonnam20'>함평군</option>
						<option value='jeonnam21'>해남군</option>
						<option value='jeonnam22'>화순군</option>
					</c:if>
					<c:if test='${search2 eq "gyeongbuk"}'>
						<option value='gyeongbuk1'>경산시</option>
						<option value='gyeongbuk2'>경주시</option>
						<option value='gyeongbuk3'>고령군</option>
						<option value='gyeongbuk4'>구미시</option>
						<option value='gyeongbuk5'>군위군</option>
						<option value='gyeongbuk6'>김천시</option>
						<option value='gyeongbuk7'>문경시</option>
						<option value='gyeongbuk8'>봉화군</option>
						<option value='gyeongbuk9'>상주시</option>
						<option value='gyeongbuk10'>성주군</option>
						<option value='gyeongbuk11'>안동시</option>
						<option value='gyeongbuk12'>영덕군</option>
						<option value='gyeongbuk13'>영양군</option>
						<option value='gyeongbuk14'>영주시</option>
						<option value='gyeongbuk15'>영천시</option>
						<option value='gyeongbuk16'>예천군</option>
						<option value='gyeongbuk17'>울릉군</option>
						<option value='gyeongbuk18'>울진군</option>
						<option value='gyeongbuk19'>의성군</option>
						<option value='gyeongbuk20'>청도군</option>
						<option value='gyeongbuk21'>청송군</option>
						<option value='gyeongbuk22'>칠곡군</option>
						<option value='gyeongbuk23'>포항시</option>
					</c:if>
					<c:if test='${search2 eq "gyeongnam"}'>
						<option value='gyeongnam1'>거제시</option>
						<option value='gyeongnam2'>거창군</option>
						<option value='gyeongnam3'>고성군</option>
						<option value='gyeongnam4'>김해시</option>
						<option value='gyeongnam5'>남해군</option>
						<option value='gyeongnam6'>밀양시</option>
						<option value='gyeongnam7'>사천시</option>
						<option value='gyeongnam8'>산청군</option>
						<option value='gyeongnam9'>양산시</option>
						<option value='gyeongnam10'>의령군</option>
						<option value='gyeongnam11'>진주시</option>
						<option value='gyeongnam12'>청녕군</option>
						<option value='gyeongnam13'>창원시</option>
						<option value='gyeongnam14'>통영시</option>
						<option value='gyeongnam15'>하동군</option>
						<option value='gyeongnam16'>함안군</option>
						<option value='gyeongnam17'>함양군</option>
						<option value='gyeongnam18'>합천군</option>
					</c:if>
					<c:if test='${search2 eq "jeju"}'>
						<option value='jeju1'>서귀포시</option>
						<option value='jeju2'>제주시</option>
					</c:if>
 --%>
					</select>
				</td>
			</tr>
			<tr>
				<th class='w-px100' style='height:459px;'>내용</th>
				<td colspan='3''>
					<textarea name='content' title='내용' class='need' 
					style='width:100%; height:99%; margin:0; padding:10px; border:none; box-sizing:border-box; font-size:15px;'></textarea>
				</td>
				<th class='w-px100'>첨부사진</th>
				<td></td>
			</tr>
		</table>
	</div>
	
	<!-- 글쓰기 버튼 -->
	<div style='width:100%; float:left; margin:10px 0;' >
		<div style='width:90%; height:30px; margin:0 auto; background-color: #FFB4BE;'>
			<span style='display:block; background-color:#FFFFFF; width:200px; height:35px; margin:0 auto;'>
				<button class='cancel'><a href='list.bo' style='color:#111111; font-size:15px;' >취소</a></button>
				<button class='submit' onclick='if(necessary()){$("form").submit()}' style='color:#111111; font-size:15px;' >글쓰기</button>
			</span>
		</div>
	</div>
	</form>

<script type="text/javascript" src="js/need_check.js"></script>
<script type="text/javascript">
$(document).on('change', '[name=search2]', function(){
	var jy = $('[name=search2] option:selected').val();
	//session.setattribute("search2", jy);
	<%
		String jy = "";
		session.setAttribute("search2", jy);
	%>
});
</script>
</body>
</html>