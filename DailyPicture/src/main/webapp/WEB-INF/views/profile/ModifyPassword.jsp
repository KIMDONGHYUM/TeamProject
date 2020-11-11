<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    
    <script type="text/javascript">
      
		function CheckValue2(){
			
			if(!document.ModifyPassword.ex-password.value){
				alert("기존 비밀번호를 입력해주세요.");
				return false;
			}else if(!document.ModifyPassword.password.value){
				alert("새 비밀번호를 입력해주세요.");
				return false;
			}else if(!document.ModifyPassword.password-check.value){
				alert("새 비밀번호 확인을 입력해주세요.");
				return false;
			}
			
			
		}
	</script>
    <style>
         * {
				margin:0 auto;
				padding:0;
				max-width:100%;
				
     		 } 
       #header{
            background-color: white;
            vertical-align: top;
            margin-top: -5px;
            margin-left: -5px;
            margin-right: -10px;
            padding-top: 40px;
            
            
        }
        .own{
            width:2000px;
            color:gray; 
            border: thin solid rgb(240, 231, 231);
        }
        a {
            text-decoration: none;
            color: black;
        }

        .headerpicture{
            text-align: center;
            
        }
      
        .box {
            width: 150px;
            height: 150px; 
            border-radius: 70%;
            overflow: hidden;
	        display: block;
            margin: 0 auto;
            }

       
        #list {
            width: 500px;
            height: 300px;
            text-align: end;
            padding-top: 100px;
        }
        #info {
        	width: 700px;
            height: 500px;
            padding-right:200px;
            border-spacing: 30px;
            border-collapse: separate;
            display: inline-block;
        }
        #wrap {
            
            padding-top: 100px;
            padding-left: 70px;
            display: flex;
        }
        td {
        	text-align:end;
           /*  padding-top: 40px; */
        }
       
        
		#button {
            border: 0;
            outline: none;
            background-color: #ffffff;
            position:absolute;top:300px;left:800px;
            background: transparent;
            
        }
        #modifyimage {
            
            width: 30px;
            height: 30px; 
            border-radius: 70%;
        }
        h3 {
        color: black;
        }
        
       
    </style>
    
</head>
<body>
     <div id="header">
       		<jsp:include page="Header.jsp" /> 
    	</div>  
       
          

    
    
       
      
       

<div id="wrap">

    <table id="list">
        <tr>
            <td><a href="ModifyProfile">프로필 편집</a></td>
        </tr>
        <tr>
            <td><h3><a href="ModifyPassword"><strong>비밀번호 변경</strong></a></h3></td>
        </tr>
        <tr>
            <td><a href="ModifyEmail">이메일 및 SMS</a></td>
        </tr>
        <tr>
            <td><a href="NotifySetting">알림</a></td>
        </tr>
        <tr>
            <td><a href="FollowSetting">친구 관리</a></td>
        </tr>
        <tr>
            <td><a href="DeleteMember">회원 탈퇴</a></td>
        </tr>
    </table>
 

	<form name="ModifyPassword" action="ModifyPasswordAction" method="post" onsubmit="return CheckValue2()">
	    <table id="info">
	    <tr><td> <b>기존 비밀번호 입력</b> <input type="password" name="ex-password"></td></tr>
	    <tr><td> <b>새 비밀번호 입력</b> <input type="password" name="password"> </td> </tr>
	    <tr><td> <b>새 비밀번호 확인</b> <input type="password" name="password-check"></td> </tr>
	   
	    
	    <tr><td><input type="submit" class="btn btn-primary" value="비밀번호 변경"></td></tr>
	    </table>
	</form>
	
	
</div>

</body>
</html>