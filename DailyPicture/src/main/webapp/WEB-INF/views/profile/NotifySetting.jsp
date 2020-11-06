<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알림 설정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <script type="text/javascript">
		
		function changeView5(value){
			
			if(value == "0") // 사진 수정 페이지 이동
			{
				location.href="ModifyPicture";
			}
			else if(value == "1") // 알림 설정 수정사항 저장
			{
				location.href="NotifySettingSave";
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
            border-spacing: 20px;
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
        #info td {
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
            <td><a href="ModifyEmail">이메일 및 SMS</a></td>
        </tr>
        <tr>
            <td><h3><a href="NotifySetting"><strong>알림</strong></a></h3></td>
        </tr>
        <tr>
            <td><a href="FollowSetting">친구 관리</a></td>
        </tr>
    </table>
 


    <table id="info">
    <tr><td><h3><b>좋아요</b></h3></td></tr>
    <tr><td><input type="radio" name="gender" value="해제">해제</td></tr>
    <tr><td><input type="radio" name="gender" value="내가 팔로우한 사람">내가 팔로우한 사람</td></tr>
    <tr><td><input type="radio" name="gender" value="전체">전체</td></tr>
    <tr><td><h3><b>댓글</b></h3></td></tr>
    <tr><td><input type="radio" name="gender" value="해제">해제</td></tr>
    <tr><td><input type="radio" name="gender" value="내가 팔로우한 사람">내가 팔로우한 사람</td></tr>
    <tr><td><input type="radio" name="gender" value="전체">전체</td></tr>
    <tr><td><h3><b>수락한 팔로우 요청</b></h3></td></tr>
    <tr><td><input type="radio" name="gender" value="해제">해제</td></tr>
    <tr><td><input type="radio" name="gender" value="내가 팔로우한 사람">내가 팔로우한 사람</td></tr>
    <tr><td><input type="radio" name="gender" value="전체">전체</td></tr>
    <tr><td><h3><b>알림</b></h3></td></tr>
    <tr><td><input type="radio" name="gender" value="해제">해제</td></tr>
    <tr><td><input type="radio" name="gender" value="내가 팔로우한 사람">내가 팔로우한 사람</td></tr>
    <tr><td><input type="radio" name="gender" value="전체">전체</td></tr>
    <tr><td><button type="button" class="btn btn-primary" onclick="changeView5(2)">저장</button></td></tr>
    </table>

</div>

</body>
</html>