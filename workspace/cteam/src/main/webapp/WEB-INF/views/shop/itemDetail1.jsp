<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
<style type="text/css">
 img.imgpath{ height: 500px; width: 400px; }
 #all{ margin: 70px auto; text-align: center; box-sizing: border-box; }
 div.name-div{ font-size: 17px; font-weight: bold; text-align:left;}
 div.content-div{ font-size: 13px; margin-top:40px; text-align:left; color: #333333;}
 div.price-div, div.order-div, div.option-div, div.ship-div, div.list-div {text-align:left; margin-top:20px; font-size: 15px;}
 div.desc-div{ margin-left: 20px; float:left; width: 300px;}
 div.buy-div {float:left; width:300px; margin-top: 20px;}
 div.center-div{margin: 0 auto; width:800px;}
 div.modify-div{float:left; width:300px; margin-top: 20px;}
 span { font-size: 13px; color:#333333; }
 span.color-span, span.price-span {color:#000000;}
 strong.price-strong{color:#000000;}
 
 a.buy-btn, a.cart-btn{ float:left; padding: 5px; width: 100px; display: block; color:white;}
 a.buy-btn {background-color: black; margin-right: 10px;}
 a.cart-btn {background-color: #EAEAEA; color: #747474;}
 a.modify-btn, a.delete-btn {padding:5px;}
 a.modify-btn{background-color: #EAEAEA; color: #747474;}
 a.delete-btn{background-color: black; color: white;}
 input[type=number] {width:25px; height: 15px; background-color: #F2F2F2; border: none; font-size: 15px; outline: none; }
 
</style> 
</head>
<body>
	<div id="all" style="overflow: hidden; ">
		<div class='center-div'>	
		
		<c:set var="option" value=""/>
		
		
		<c:forEach items="${list }" var="vo" varStatus="status">
	
			
			<c:if test="${  status.index == ( fn:length( list ) ) - 1 }">
			
			
				<div class="img-div">
					<img class="imgpath" src="${vo.item_imgpath }" style="float:left;">
				</div>
				
		
					
					<div class="desc-div name-div" style="float:left; width:300px;">
						${vo.item_name}
					</div>
					
					<div class="desc-div content-div" style="width:300px;">
						${vo.item_content}
					</div>
					<%-- <c:if test="${!vo.option }">
						<select></select>
					</c:if> --%>
					
					
		 </c:if>
		</c:forEach>	
		
		<div class="desc-div option-div">	
		
		
		<c:set var="option_name" value="" />
		
		<select id="select">
		<option value="" selected disabled hidden>옵션선택</option>
		<c:forEach items="${list }" var="vo" varStatus="status">
				
				<c:if test="${!empty vo.option_name }">
					
					<option value="${vo.option_name }">${vo.option_name }</option>
				</c:if>		
			</c:forEach>	
		</select>	
		</div>
			
		<c:forEach items="${list }" var="vo" varStatus="status">
	
			
			<c:if test="${  status.index == ( fn:length( list ) ) - 1 }">
								
					<span class="y"></span>
				<%-- 	<div class="desc-div list-div invisible" style="border-bottom: 1px solid #ddd; padding-bottom: 10px;">
			
					
						
							<span class="option-span">option:</span>

							<span class="option_name-sapn" style="padding-right: 100px;">${option_name }</span>
						
							<a class="option_plus"> + </a>
							
							
							<input class="item_su" name="item_su" type="number" readonly="readonly" value="1" style="text-align: center;"/>
							
							
							
							<a class="option_minus"> - </a>
							
							<span>${vo.item_price } 원</span>
							<a class="list-delete" width="12px" height="13px"><i class="fas fa-times"></i></a>
					</div>	 --%>
						
					<div class="desc-div ship-div" style="float:left; width:300px;">
						<span class="ship">배송비:</span>	
						<c:choose>
						<c:when test="${vo.item_price gt 30000 }"><span>무료</span></c:when>
						<c:otherwise><span>2500원</span></c:otherwise>
						</c:choose>
					</div>
					
					<div class="desc-div price-div" style="float:left; width:300px; color: #333333;" >
						<span class="price">총 상품금액:</span>	
						<Strong class="price-strong">${vo.item_price }</Strong>
						<span class="won">원</span>
					</div>
					
					<div class='desc-div buy-div'>
						<a class="buy-btn" onclick="">buy it now</a>
						<a class="cart-btn" onclick="">go cart</a>
					</div>
					
					
					<c:if test="${login_info.member_id == 'admin' }">
						<div class="desc-div modify-div">
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
					
			
			
				</c:if>
			</c:forEach>
				
		</div>
		
	
	</div>
	<div class="contentImg-div">
		
		<img src="${vo.item_content_imgpath }" width="800px">
	
	</div>
	
	<script type="text/javascript">	

	var state;
	
		$('#select').change(function() {
			state = $('#select option:selected').val();
			if ( state ) {
			/* 	$('.invisible').show();
 */
			var addDiv = 
			
			
					'<div class="desc-div list-div invisible" style="border-bottom: 1px solid #ddd; padding-bottom: 10px;">'+
				
				
				
					'<span class="option-span">'+state +':</span>'+

					'<span class="option_name-sapn" style="padding-right: 100px;">${option_name }</span>' +
			
					'<a class="option_plus" onclick="plus();"> + </a>'+
				
				
					'<input class="item_su" name="item_su" type="number" readonly="readonly" value="1" style="text-align: center;"/>'+
					'<a class="option_minus" onclick="minus()"> - </a>'+
				
					'<span>${vo.item_price } ${vo.price }원</span>'+
					'<a class="list-delete" width="12px" height="13px" onclick="wrap(this);"><i class="fas fa-times"></i></a>'+
					'</div>'			
				
					var divHtml = $('.y');
					divHtml.after(addDiv);

					
				

			}
		});

		function plus(){
			
		};

		function wrap(o){
			/* $(this).parent().css( 'display', 'none' ); */
		/* 	$(this).remove() */
			$(o).parent().remove();
			
			state=null;
				
		}
	</script>
</body>
</html>