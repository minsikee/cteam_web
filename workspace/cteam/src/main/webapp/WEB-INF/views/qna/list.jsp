<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

ul{list-style: none;}
.accordion-box{
  width: 80%;
  margin:  0 auto;
  border: 2px solid #FF7E9D;
}
p.title{
  width: 100%;  
  line-height: 60px; 
  background: white; 
  color: black;
  box-sizing: border-box;
  padding: 0 10px;
  margin: 0;
  text-align: left;
  border-bottom: 1px solid #FF7E9D;
  border-top: 1px solid #FF7E9D;
  }
.con{
  padding: 20px; 
  display:none;
  background-color: #FFF5EE;
  }
footer {
  	bottom:0;
	left:0;
	right:0;
}
.list{
	padding: 0px 10px 0px 10px;
	margin: 20px 0px 20px 0px;
}
</style>
</head>
<body>
<h1>자주 묻는 질문</h2>
<div class="accordion-box">
   <ul class="list">
     <li>
      <p class="title">교환은 어떻게 하나요?</p>
      <div class="con"> 교환은 저희쪽으로 연락주시면 감사하겠습니다.<br/>연락처는 062-951-1785 입니다.</div>
    </li>
    <li>
      <p class="title">직접 가서 보고 살 수 있나요?</p>
	  <div class="con">오프라인 매장 주소는 광주광역시 광산구 경열로 3 입니다.<br/>영업시간은 아침 9시부터 저녁 9시까지 입니다.</div>    
	</li>
    <li>
      <p class="title">품절된 상품은 언제 재입고 되나요?</p>
      <div class="con">품절된 상품의 재입고는 거의 되지 않습니다.<br/>비슷한 상품이나 똑같은 상품이 다시 들어올때도 간혹있으나
		그 시기가 정확치 않아 미리 재입고 된다고 예정할수 없는점 양해 부탁드립니다
	</div>
	</li>
    <li>
      <p class="title">환불 방법에는 어떤것이 있나요?</p>
      <div class="con">상품 환불에는 카드취소, 젠틀빅사이트에 예치/적립, 계좌환불, 휴대폰결제취소 있습니다. <br/>신용카드로 구매하신경우에는 카드취소로만 환불됩니다.(예치금으로 적립후에 환불하실경우도 카드취소로만 가능합니다.)
 		<br/>적립금으로 적립하신경우 계좌환불 불가능합니다.</div>
	</li>
    </ul>
</div>
<script type="text/javascript">
$("p.title").on('click',function(){
	  $(this).next(".con").slideToggle(100);
	});
</script>
</body>
</html>