<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.study.springboot.dto.MemberDto" %>
<%@ page import="java.util.List"%>

<html>
<head>



	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/mpop.css">
	
	<% MemberDto member = (MemberDto)session.getAttribute("memberInfo"); %>
	
	<% List<MemberDto> mmlist = (List<MemberDto>)session.getAttribute("mmlist"); %>
	<script src="/js/jquery-3.1.1.js"></script>
	<script type="text/javascript">
		
		function changeView(value){
			
			if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동
			{
				location.href="MainPage";
			}
			else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
			{
				location.href="LoginForm";
			}
			else if(value == "2") // 회원가입 버튼 클릭시 회원가입 화면으로 이동
			{
				location.href="MainPage";
			}
			else if(value == "3") // 로그아웃 버튼 클릭시 로그아웃 처리
			{
				location.href="MemberLogoutAction";
			}
			else if(value == "4") // 내정보 버튼 클릭시 회원정보 보여주는 화면으로 이동
			{
				location.href="MemberInfoAction";
			}
			else if(value == "5") // 내 프로필 보기
			{
				location.href="MyProfile";
			}else if(value == "6") // 관리자 페이지
			{
				location.href="Admin";
			}	
		}
	</script>
	
	<style>
		span {
				margin-left: 200px;
			}
			.img0{
				outline:0;
				border:0;
			}
			
			.mbtn{
			   outline:0;
			   border:0;
			}
			
			
			#profilebtn{
				width: 33px;
	    		height: 32px; 
	    		border-radius: 70%;
	    		overflow: hidden;
				border: solid rgb(153, 243, 18) 2px;
			}
			
			.sprofileimg{
	        	border: solid rgb(153, 243, 18) 2px;
	        	width: 35px;
	    		height: 35px; 
	    		border-radius: 70%;
	    		overflow: hidden;
	        }	
	        
	          .profile2 {
			    width: 100%;
			    height: 100%;
			    object-fit: cover;
			   
			}	 
	        
	         #profilebox{
		         margin-top: 7%;
		         margin-bottom: 3%;
		         float: left;
		       
		        }
	        #user_popid{
	         width: 30px;
	        }
	        
			
			.img1{
			    width: 100%;
			    height: 100%;
			    object-fit: cover;
			 }
			 .searchname {
			 	 display:none;
			 }
			 
	</style>
	
	
</head>
<body>	

	<div id="header">  
      <div class="headerpicture">
      	<button id="logoutBtn" class="img0" onclick="changeView(0)"><img src="img/logo.jpg" alt="로고"></button>
      	 
      	<span>
      	<button id="logoutBtn" class="mbtn" onclick="onshow1()"><img src="img/search.jpg" alt="찾기"></button>
      	<button id="logoutBtn" class="img0" onclick="changeView(2)"><img src="img/home.jpg" alt="홈"></button>
      	<button id="logoutBtn" class="img0" onclick="changeView(3)"><img src="img/compass.jpg" alt="나침반"></button>
      	<button id="logoutBtn" class="img0" onclick="changeView(4)"><img src="img/alret.jpg" alt="알림"></button>
        <% if(session.getAttribute("sessionID").toString().equals("hong")){%>
        <button id="logoutBtn" class="img0" onclick="changeView(6)"><img src="img/admin.jpg" alt="관리자"></button>	
        <% } %>
        
      	
      	<button id="profilebtn" onclick="changeView(5)"><img src="user/<%=session.getAttribute("sessionID") %>/<%= member.getPicture()%>"  onerror="this.src='img/profile.jpg'"  class="img1" /></button>
      	</span>
      	
          <h1 class="mbtn"></h1>
		   <!-- 첫 번째 Modal -->
		   <div class="mdal">
		     <div class="mdal-content" style="display:block">
		       
		        <table>		         
				    <c:forEach var="mdto" items="${ mmlist }" >  
				   
				     <tr>
				       <td>	 
				       		<div class="sprofileimg" style="background: #BDBDBD;"> 
							   <a href="UserProfileView?id=${mdto.id}" ><img class="profile2" src="user/${mdto.id}/${mdto.picture}"  onerror="this.src='img/profile.jpg'" ></a>
							</div>
		                    <div id="user_popid">
		                      <a href="UserProfileView?id=${mdto.id}" ><small>${mdto.id}</small></a>
		                    </div>
		               </td>
		               
		               <td>
		                   <div>
		                  		<p>(${mdto.name})</p>
		                   </div>   
		                 
		               </td>          
		              
				     </tr> 
				     
				    </c:forEach>      
				</table>
				    
		     </div>
		   </div>
		  
         <hr class ="own">
        </div>
     </div>
     
     
     <script>
	 $(function(){
		$(".mbtn").click(function (){
			$('.mdal').toggle();
		});
	});	
	</script>    
    
       	
  </body>
</html>