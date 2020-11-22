<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <% String id = (String)session.getAttribute("sessionID"); %>
      
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
        	width: 900px;
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
        #opni{
        	height:50px;
        }
        #pasw{
        	height:30px;
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
            <td><a href="ModifyPassword">비밀번호 변경</a></td>
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
            <td><h3><a href="DeleteMember"><strong>회원 탈퇴</strong></a></h3></td>
        </tr>
    </table>
 
 <form name="deleteform" method="post" action="DeleteMemberAction" >

    <table id="info">
  		<tr><td style="float:left; font-size:25px;"><b><%=id %></b>님 안녕하세요!<br> 
  		탈퇴를 결심하셨다니 아쉽습니다.<br>
  		언제든 다시 돌아오세요.
  		</td></tr>
  		
  		<tr><td>
  		<b>어떤점에서 탈퇴를 하시는지 말씀해주세요.</b>
  		<select name="deletereason">
  			<option>삭제하고픈 내용이 있음</option>
  			<option>너무 내용이 많아서 산만함</option>
  			<option>개인 정보 문제</option>
  			<option>다른 계정을 만들었습니다</option>
  			<option>팔로우할 사람이 없습니다</option>
  			<option>기타</option>
  		</select>
  		<br><br><b>기타 의견:</b> <input type="text" size="50px;" name="opinion" id="opni">
  		</td></tr>
  		
	    <tr><td> <b>계속하시려면 비밀번호를 입력해 주세요.</b> <input type="password" name="password" size="30px;" id="pasw"> </td> </tr>
	    
	    <tr><td><input type="submit" class="btn btn-primary" value="회원탈퇴"></td></tr>
	
    </table>
</form>
</div>

</body>
</html>