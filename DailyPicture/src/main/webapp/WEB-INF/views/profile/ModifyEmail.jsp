<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이메일 및 SMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <script type="text/javascript">
		
		function changeView4(value){
			if(value == "0") // 사진 수정 페이지 이동
			{
				location.href="ModifyPicture";
			}
			if(value == "1") // 저장
			{
				location.href="ModifyEmailSave"; //컨트롤러에서 리다이렉트로 보내 알럿창 띄우기
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

         .profile {
            width: 100%;
            height: 100%;
            object-fit: cover;
            
            }
        #profileid {
            text-align: center;
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
            display: inline-block;
        }
        #wrap {
            
            padding-top: 100px;
            padding-left: 70px;
            display: flex;
        }
        td {
        	text-align:end;
            /* padding-top: 40px; */
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
        h6 {
         color: rgb(197, 195, 195);
        }
        .check {
       	text-align:start;
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
            <td><h3><a href="ModifyEmail"><strong>이메일 및 SMS</strong></a></h3></td>
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
 


    <table id="info">
    <tr><td class="check"><input type="checkbox" name="comment-email">  의견 이메일</td> </tr>
    <tr><td class="check"><h6>데일리에서 의견을 보내세요</h6></td></tr>
    <tr><td class="check"><input type="checkbox" name="notify-email">  알림 이메일</td> </tr>
    <tr><td class="check"><h6>확인하지 않은 알림을 받아보세요.</h6></td></tr>
    <tr><td class="check"><input type="checkbox" name="product-email">  제품 이메일</td> </tr>
    <tr><td class="check"><h6>도구에 관한 팁을 확인해보세요.</h6></td></tr>
    
    <tr><td><button type="button" class="btn btn-primary" onclick="ChangeView4(1)">저장</button></td></tr>
    </table>

</div>

</body>
</html>