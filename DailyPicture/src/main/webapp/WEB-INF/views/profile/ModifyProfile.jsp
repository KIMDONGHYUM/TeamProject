<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="com.study.springboot.dto.MemberDto" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 편집</title>
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    	<link rel="stylesheet" type="text/css" href="css/modifypopup.css">
    	<% MemberDto member = (MemberDto)session.getAttribute("memberInfo"); %>  
    
    <script type="text/javascript">
		
		function CheckValue(){
			
			if(!document.ModifyProfile.name.value){ 
				alert("이름을 입력하세요.");
				return false;	
			}else if(!document.ModifyProfile.email.value){
				alert("이메일을 입력하세요.");
				return false;	
			}else if(!document.ModifyProfile.phone.value){
				alert("전화번호를 입력하세요.");
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
     		  
      #header {
	            background-color: white;
	            vertical-align: top;
	            margin-top: -5px;
	            margin-left: -5px;
	            margin-right: -10px;
	            padding-top: 40px;    
	            text-align: center;                    
        	  }
        
     .profile {
			    width: 100%;
			    height: 100%;
			    object-fit: cover;
			  }
        
         .own {
	            width:2000px;
	            color:gray; 
	            border: thin solid rgb(240, 231, 231);
        	  }
        	  
        	a {
	            text-decoration: none;
	            color: black;
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
            
   #profileid {text-align: center;}
           
        #wrap {
	            padding-top: 100px;
	            padding-left: 70px;
	            display: flex;
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
        	  
           td {
	        	text-align:end;
	            padding-top: 40px;
       	 	  }
               		
 #modifyimage {         
	            width: 30px;
	            height: 30px; 
	            border-radius: 70%;
	            position:absolute;
	            top:38%;
	            left:52%;
        	  }
                   
         .own {
	            width:2000px;
	            color:gray; 
	            border: thin solid rgb(240, 231, 231);
       	      }
        
      .content {text-align:center;}
        	       
input[type=file] {
	        	text-align:center;
	        	width:100%;
	        	height: 50px;
	        	}
        
input[type=submit] {
	        	width:100%;
	        	height: 50px;
        		}
        		
       #savebtn {
	        	width: 20%;
	        	height: 40px;
        		}
    </style>
</head>
<body>
     <div id="header">
       		<jsp:include page="Header.jsp" /> 
    	</div>       
       	
    <div id="profile">
        <div class="box" style="background: #BDBDBD;">       
          <img class="profile" src= "user/<%=session.getAttribute("sessionID") %>/<%=member.getPicture()%>"  onerror="this.src='img/profile.jpg'" />          
    	</div>
		 
        <!-- 프로필 변경 팝업 -->
        <input type="checkbox" id="popup">
        <label for="popup"><p class="p"><img id="modifyimage" src="img/modifybutton.jpg"></p></label>
        <div>
        	<div>       	
	        	<label for="popup"></label>
	        	
	        	<!-- 컨텐츠 영역 -->
	        	 <div class="content">
	        	 <form action="ChangePicture" method="POST" enctype="multipart/form-data">
	            		<h2 style="text-align:center;">프로필 사진 바꾸기</h2>
	            		<hr class ="own">
				    
	            		<p><small>사진선택</small></p>
	            		<input type="file" class="btn btn-info"  name="filename" >
	            		
	            		<input type="submit" class="btn btn-success"  value="사진 업로드">
	        	</form>
	       		 	<form action="DeletePicture" method="POST" enctype="multipart/form-data">
	       		 		<input type="hidden" name="picture" value=<%=member.getPicture()%>>
	            		<input type="submit" class="btn btn-danger" class="form-control" value="현재 프로필 사진 삭제">
	        		</form>
	        	</div>
        			
        	</div>
        	<label for="popup"></label>
        </div>
       </div> 
       
            
    

    
    <div id="profileid">
        <h4><strong><%=session.getAttribute("sessionID") %></strong></h4>
    </div>
       
      
       

<div id="wrap">

    <table id="list">
        <tr>
            <td><h3><a href="ModifyProfile"><strong>프로필 편집</strong></a></h3></td>
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
            <td><a href="DeleteMember">회원 탈퇴</a></td>
        </tr>
    </table>
 

	<form name="ModifyProfile" action="ModifyProfileAction" method="post" onsubmit="return CheckValue()">
	    <table id="info">
	    <tr><td><b>이름</b><input type="text" name="name"> </td> </tr>
	    
	    <tr><td><b>이메일</b> <input type="text" name="email"></td></tr>
	    <!-- <tr><td><button type="button" class="btn btn-primary" onclick="changeView2(1)">이메일 확인</button></td></tr> -->
	    <tr><td><b>전화번호</b> <input type="text" name="phone"></td></tr>
	    <tr><td><input id="savebtn" type="submit" class="btn btn-primary" value="저장"></td></tr>
	    </table>
	</form>
</div>

</body>
</html>