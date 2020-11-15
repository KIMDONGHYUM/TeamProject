<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.study.springboot.dto.DpFollowDto" %>
<%@ page import="com.study.springboot.dto.MemberDto" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<html lang="en">
<head>
	<% ArrayList<DpFollowDto> unfollowlist= (ArrayList<DpFollowDto>)session.getAttribute("unfollowlist"); %>
   	<% ArrayList<MemberDto> memberlist = (ArrayList<MemberDto>)session.getAttribute("memberlist"); %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>친구 관리</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <script type="text/javascript">
		
		function changeView6(value){
			
			if(value == "0") // 사진 수정 페이지 이동
 			{
				location.href="ModifyPicture";
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
        	/* border:1px solid red; */
        	width: 500px;
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
        #profile {
        	border-radius: 100%;
        	height:5%;
        }
        
        #follow {
        	 /* border:1px solid red;	  */
        	 border-spacing: 30px;
            border-collapse: separate;
            display: inline-block;
            height: 400px;
            overflow: auto;
        }
        #unfollow {
        	/* border:1px solid red; */
        	border-spacing: 30px;
            border-collapse: separate;
            display: inline-block;
            height: 400px;
            overflow: auto;
        }
        ::-webkit-scrollbar {
  			width: 6px;
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
            <td><h3><a href="FollowSetting"><strong>친구 관리</strong></a></h3></td>
        </tr>
        <tr>
            <td><a href="DeleteMember">회원 탈퇴</a></td>
        </tr>
    </table>
 


    <table id="follow">
    	<tr><td><h3><b>팔로우 맺기</b></h3></td></tr>
    	
    				<c:forEach var="mdto" items="${ memberlist }" >  
				     	<tr>
					     	<td>
					     	<form action="FollowAction" method="post">
					     		${mdto.picture}
					     		<input type="hidden" name="following" value=${mdto.name }>
					     		${mdto.name} 
					     		<input type="submit" value="팔로우" class="btn btn-primary">
					     	</form>
					     	</td>
					     	
				     	</tr>   
		               		
		              	  
				    </c:forEach> 
		</table>
		<table id="unfollow">
    	<tr><td><h3><b>팔로우 끊기</b></h3></td></tr>
    	
    			<c:forEach var="dto" items="${ unfollowlist }">  
				     <tr>
				  
		               <td>
		               <form action="UnFollowAction" method="post">
		       				 <input type="hidden" name="following" value=${dto.following }>
		                  		
		                ${dto.following}  <input type="submit" value="언팔로우" class="btn">
		             
		               </td>          
		             
		              </form>
		              
				     </tr> 
				     
				    </c:forEach> 
		</table>
    

</div>

</body>
</html>