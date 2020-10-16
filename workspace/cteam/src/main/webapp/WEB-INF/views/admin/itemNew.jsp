<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<style type="text/css">
	
	table {
	 border-collapse: collapse;
	 margin-bottom: 50px;
	 margin-top: 10px;
	 text-align: center;
	 border: 3px solid #FFB4BE;
	 width: 40%;
	}
	
	table td {
	 border-bottom: 1px solid #FFB4BE;
	 text-align: left;
	 height: 45px;
	}
	
	table th {
	 padding: 10px;
	 background-color: #FFD9E4;
	 color: #282828;
	 width: 200px;
	}
	
	input {
		border: none;
		width: 75%;
		background: #EEEEEE;
		margin-bottom: 5px;
		margin-top :5px;
		margin-left: 5px;
	}
	#go_add{
		margin-bottom: 30px;
		margin-left: 50%;
	}
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

#preview{
	height: 250px;
	text-align: center;
}
.small {
	float: left;
	width: 40px;
	height: 35px;
}
.add {
	margin-top:5px;
	width: 10%;
	float:right;
}

textarea {
 border: 2px solid #FFB4BE;
}

#option_name, #item_code {
	width:75%;
	float: left;
}

table th:not(:last-child) {
	border-bottom: 1px dashed white;
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
							<input type="file" name="file1" id="attach-file" /> 
							<img src="img/photo.png" class="small"/>
						</label> 
						<span id="file-name"></span> 
						<!-- <span id="preview"></span> -->
						<span id="delete-file" style="float: right;">
							<img src="img/delete.png" class="small"/>
						</span>
					</td>
				</tr>
				<tr>
					<th>상품 이름</th>
					<td><input type="text" id="item_name" name="item_name" /></td>
				</tr>
				<tr>
					<th>상품 코드</th>
					<td>
					<input width="70%;" type="text" id="item_code" name="item_code" />
					<button class="add" style="width: 20%; margin-right: 5px;">중복확인</button>
					</td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td><input type="text" id="item_price" name="item_price" /></td>
				</tr>
				<tr>
					<th>옵션</th>
					<td>
						<a type="button" value="삭제" onclick="deleteInput();">
							<img style="width: 35px; height: 35px; float: right; margin-right: 10px;" src="img/minus.png">
						</a>
						<a type="button" value="추가" onclick="addInput();">
							<img style="width: 35px; height: 35px; float: right; margin-right: 10px;" src="img/plus.png">
						</a>
						<div id="parah">
						
					</div></td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td style="padding: 5px 8px 0px 5px;"><textarea id="item_content" name="item_content"></textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td class="left">
						<label> 
							<input type="file" name="file2" id="content-file" /> 
							<img src="img/photo.png" class="small"/>
						</label> 
						<span id="content-file-name"></span> 
						<span id="content-delete-file">
							<img src="img/delete.png" class="small" style="float: right;"/>
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