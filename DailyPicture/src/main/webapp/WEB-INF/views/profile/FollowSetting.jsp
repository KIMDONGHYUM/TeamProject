<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.study.springboot.dto.DpFollowDto" %>
<%@ page import="com.study.springboot.dto.MemberDto" %>
<%@ page import="com.study.springboot.dto.FollowMemberDto" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<html lang="en">
<head>
	<% ArrayList<DpFollowDto> unfollowlist= (ArrayList<DpFollowDto>)session.getAttribute("unfollowlist"); %>
   	<% ArrayList<DpFollowDto> followerlist = (ArrayList<DpFollowDto>)session.getAttribute("followerlist"); %>
   	<% ArrayList<FollowMemberDto> fmlist = (ArrayList<FollowMemberDto>)session.getAttribute("fmlist"); %>
   	<% ArrayList<FollowMemberDto> ufmlist = (ArrayList<FollowMemberDto>)session.getAttribute("ufmlist"); %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>친구 관리</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    
    
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
	       	    
	      .own {
	            width:2000px;
	            color:gray; 
	            border: thin solid rgb(240, 231, 231);
	        	}
	        	
	         a {
	            text-decoration: none;
	            color: black;
	       	   }  	       	                                	                               
        
         #wrap {  
            	padding-top: 100px;
            	padding-left: 50px;
            	display: flex;            
        	   }
        	  
         #list {
            	width: 500px;
            	height: 300px;
            	text-align: end;
       		   }
                        	  
        	td {
	        	text-align:end;
        	   }              
        	     	                       
       #follow {
	        	border:1px solid rgb(215, 214, 214);        	
	        	border-spacing: 30px;
	            border-collapse: separate;
	            display: inline-block;
	            width: 15%;
	            height: 400px;
	            overflow: auto;           
        	    }
        
     #unfollow {
	        	border:1px solid rgb(215, 214, 214);         	
	        	border-spacing: 30px;
	            border-collapse: separate;
	            display: inline-block;
	            width: 15%;
	            height: 400px;
	            overflow: auto;            
        		}
        		
::-webkit-scrollbar {width: 6px;}
  										
	   .profile {
			width: 33px;
    		height: 32px; 
    		border-radius: 70%;
			border:solid rgb(153, 243, 18) 2px;
			float:left;
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
	    	<tr><td style="text-align:center;"><h4><b>나를 팔로우한 친구</b></h4></td></tr>	    	
	    				<c:forEach var="fdto" items="${ followerlist }" varStatus="status">  
					     	<tr>
						     	<td>
							     	<form action="FollowAction" method="post">
							     		<input type="hidden" name="following" value="${fdto.follower}">
							     		<img class="profile" src="user/${fdto.follower}/${fmlist[status.index].picture }"  onerror="this.src='img/profile.jpg'" ></a>
							     		
							     		<b>${fdto.follower}</b> 
							     		<input type="submit" value="팔로우" class="btn btn-primary">
							     	</form>
						     	</td>						     	
					     	</tr>   			               					              	  
					    </c:forEach> 
			</table>
		
		<table id="unfollow">
	    	<tr><td><h4><b>내가 팔로우한 친구</b></h4></td></tr>	    	
	    			<c:forEach var="udto" items="${ unfollowlist }" varStatus="status">  
					     <tr>					  
			               <td>
				               <form action="UnFollowAction" method="post">	
				               	    <input type="hidden" name="following" value="${udto.following}">		 
				                  	<img class="profile" src="user/${udto.following}/${ufmlist[status.index].picture }"  onerror="this.src='img/profile.jpg'" ></a>	
				                	<b>${udto.following}</b>  
				                	<input type="submit" value="언팔로우" class="btn">			             	
				             	</form>
			               </td>          			             			              			              
					     </tr> 				     
				    </c:forEach> 
		</table>   
</div>
</body>
</html>