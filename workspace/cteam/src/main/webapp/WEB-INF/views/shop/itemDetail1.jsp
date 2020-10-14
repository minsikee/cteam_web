<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
<style type="text/css">
 img.imgpath{ height: 500px; width: 400px; }
 #all{ margin: 70px auto; text-align: center; box-sizing: border-box; }
 div.name-div{ font-size: 17px; font-weight: bold; text-align:left;}
 div.content-div{ font-size: 13px; margin-top:40px; text-align:left; }
 div.price-div{text-align:left; margin-top:20px; font-size: 15px;}
 div.desc-div{ margin-left: 20px; float:left; width: 300px;}
 div.buy-div {float:left; width:300px; margin-top: 20px;}
 div.center-div{margin: 0 auto; width:800px;}
 div.modify-div{float:left; width:300px; margin-top: 20px;}
 span { font-size: 10px; }
 a.buy-btn, a.cart-btn{ float:left; padding: 5px; width: 100px; display: block; color:white;}
 a.buy-btn {background-color: black; margin-right: 10px;}
 a.cart-btn {background-color: #EAEAEA; color: #747474;}
 a.modify-btn, a.delete-btn {padding:5px;}
 a.modify-btn{background-color: #EAEAEA; color: #747474;}
 a.delete-btn{background-color: black; color: white;}
 
</style> 
</head>
<body>
	<div id="all" style="overflow: hidden; ">
		<div class='center-div'>	
	
		
			<div class="img-div">
				<img class="imgpath" src="${vo.item_imgpath }" style="float:left;">
			</div>
			
			<div class="desc-div">
				
				<div class="name-div" style="float:left; width:300px;">
					${vo.item_name}
				</div>
				
				<div class="content-div" style="width:300px;">
					${vo.item_content}
				</div>
				<%-- <c:if test="${!vo.option }">
					<select></select>
				</c:if> --%>
				
				<div class="price-div" style="float:left; width:300px;">
					<span class="price">상품금액:</span>	
					<Strong>${vo.item_price }</Strong>
					<span class="won">원</span>
				</div>
				<div class='list'>
					
				</div>
				<div class="buy-div">
					<a class="buy-btn" href="" >buy it now</a>
					<a class="cart-btn" href="">add cart</a>
				</div>
				
				
				<c:if test="${login_info.member_id == 'admin' }">
					<div class="modify-div">
						<a class='modify-btn' onclick="$('form').attr('action','modify.sh'); $('form').submit()">수정</a>
						<a class='delete-btn' onclick="if(confirm('정말 삭제하시겠습니까?') ){$('form').attr('action','delete.sh'); $('form').submit() }">삭제</a>
					</div>
				</c:if>
				
				<form method="post" action="list.sh">
					<input type="hidden" name="item_num" value="${vo.item_num }">
					<input type="hidden" name="curPage" value="${page.curPage }">
					<input type="hidden" name="search" value="${page.search }">
					<input type="hidden" name="keyword" value="${page.keyword }">
					<input type="hidden" name="pageList" value="${page.pageList }">
					<input type="hidden" name="view_Type" value="${page.viewType }">
				
				</form>
				
			</div>	
		</div>
		
	
	</div>
	<div class="contentImg-div">
		
		<img src="${vo.item_content_imgpath }" width="800px">
	
	</div>
	

</body>
</html>