<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	

	<table style="margin-bottom:150px; border-collapse: collapse;" width="300" height="300" align="center">
		<div style="margin-top:100px; text-align:center; color: black;">아이디 찾기</div> 
 
       
 
        
        <div style="text-align:center;">
            <tr>        
                <td>
                <center>
                    <form action="idFindDB" method="post">
                    
                    <center>
                        <br>
                        <div>
                            	<input style="outline-color:pink; width:250px; height: 40px; border: none;" maxlength="11"  type="text" name="member_name"
                                placeholder="이름을 입력하세요 ">
                        </div>    
                        <br/>
                        <div>
                            	<input style="outline-color:pink; width:250px; height: 40px; border: none;" maxlength="11"  type="number" name="member_phonenum"
                                placeholder="가입한 핸드폰번호를 입력하세요 ">
                        </div>         
                                                               
 
                        <br> <br>
                        
                        <button style="border: 1px solid #000000; background-color: #000000; width:300px; height: 30px; color: white;" type="submit" name="submit">아이디 찾기</button>
 
                        </div>
                    </td>
                </tr>
                    </center>
            </table>
        </form>
	</table>
	

</body>
</html>