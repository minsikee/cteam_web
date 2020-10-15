<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<style type="text/css">
#item_content {
	width: calc(100% - 6px);
	resize: none;
	height: 150px;
}

.file-pre {
	width: 200px;
	height: 200px;
}

#content-file, #content-delete-file {
	display: none;
}

</style>

</head>
<body>
	<div align="center">
		<h2>상품등록 페이지</h2>
		<form method="post" action="insert.ad" enctype="multipart/form-data">
			<table>
				<tr align="center">
					<td colspan="2"><div id="preview"></div></td>
				</tr>
				<tr>
					<th>대표 이미지등록</th>
					<td class="left">
						<label>
							<input type="file" name="file" id="attach-file" /> 
							<i class="far fa-image file-img"></i>
						</label> 
						<span id="file-name"></span> 
						<!-- <span id="preview"></span> -->
						<span id="delete-file" style="color: red;">
							<i class="fas fa-times font-img"></i>
						</span>
					</td>
				</tr>
				<tr>
					<th>상품 이름</th>
					<td><input type="text" id="item_name" name="item_name" /></td>
				</tr>
				<tr>
					<th>상품 번호</th>
					<td>
					<input type="text" id="item_code" name="item_code" />
					</td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td><input type="text" id="item_price" name="item_price" /></td>
				</tr>
				<tr>
					<th>옵션</th>
					<td>
						<input type="button" value="추가" onclick="addInput();" />
						<input type="button" value="삭제" onclick="deleteInput();"/>
						<div id="parah">
						<input type="text" id="option_name" name="option_name"></input>
					</div></td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td><textarea id="item_content" name="item_content"></textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td class="left">
						<label> 
							<input type="file" name="content-file" id="content-file" /> 
							<i class="far fa-image file-img"></i>
						</label> 
						<span id="content-file-name"></span> 
						<span id="content-delete-file" style="color: red;">
							<i class="fas fa-times font-img"></i>
						</span>
					</td>
				</tr>

			</table>
		</form>
		<div class="btnSet">
			<a class="btn-fill" onclick="if(necessary()){$('form').submit()}">저장</a>
			<a class="btn-empty" href="adminPage.ad">취소</a>
		</div>
	</div>

	<script type="text/javascript">
	
		$('#content-file').on('change', function() {
			if (this.files[0]) $('#content-file-name').text(this.files[0].name);
			$('#content-delete-file').css('display', 'inline');
		});
	
		$('#content-delete-file').on('click', function() {
			$('#content-file-name').text('');
			$('#content-file').val('');
			$('#content-delete-file').css('display', 'none');
		});

		var arrInput = new Array(0);
		  var arrInputValue = new Array(0);
		 
		function addInput() {
		  arrInput.push(arrInput.length);
		  arrInputValue.push("");
		  display();
		}
		 
		function display() {
		  document.getElementById('parah').innerHTML="";
		  for (intI=0;intI<arrInput.length;intI++) {
		    document.getElementById('parah').innerHTML+=createInput(arrInput[intI], arrInputValue[intI]);
		  }
		}
		 
		function saveValue(intId,strValue) {
		  arrInputValue[intId]=strValue;
		}  
		 
		function createInput(id,value) {
		  return "<input type='text' name='option_name' class='option_name' onChange='javascript:saveValue("+ id +",this.value)' value='"+ 
		 
		value +"'><br>";
		}
		 
		function deleteInput() {
		  if (arrInput.length > 0) { 
		     arrInput.pop(); 
		     arrInputValue.pop();
		  }
		  display(); 
		}
	</script>
	<script type="text/javascript" src="js/image_preview.js?v=<%=new java.util.Date().getTime()%>"></script>
	<script type="text/javascript" src="js/need_check.js"></script>
	<script type="text/javascript" src="js/file_attach.js"></script>
</body>
</html>