<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.study.springboot.dto.MemberDto" %>
<%@ page import="java.util.ArrayList"%>

<html>
<head>



	<link rel="stylesheet" href="css/bootstrap.min.css">
	
	<% MemberDto member = (MemberDto)session.getAttribute("memberInfo"); %>
	
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
				location.href="MyProfile","Header";
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
			
			
			#profilebtn{
			width: 33px;
    		height: 32px; 
    		border-radius: 70%;
    		overflow: hidden;
			border: solid rgb(153, 243, 18) 2px;
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
	<script>
			function onshow(){
					$('.searchname').toggle();
			}
	</script>
</head>
<body>	
	<div id="header">
       
      <div class="headerpicture">
		
      	<button id="logoutBtn" class="img0" onclick="changeView(0)"><img src="img/logo.jpg" alt="로고"></button>
      	 
      	<span>
      	<input class="searchname" type="search" placeholder="검색">
      	<button id="logoutBtn" class="img0" onclick="onshow()"><img src="img/search.jpg" alt="찾기"></button>
      	<button id="logoutBtn" class="img0" onclick="changeView(2)"><img src="img/home.jpg" alt="홈"></button>
      	<button id="logoutBtn" class="img0" onclick="changeView(3)"><img src="img/compass.jpg" alt="나침반"></button>
      	<button id="logoutBtn" class="img0" onclick="changeView(4)"><img src="img/alret.jpg" alt="알림"></button>
      	
      
      	
      	<button id="profilebtn" onclick="changeView(5)"><img src="user/<%=session.getAttribute("sessionID") %>/<%= member.getPicture()%>"  onerror="this.src='img/profile.jpg'"  class="img1" /></button>
      	</span>
		
       
       
        
        <p><%= session.getAttribute("sessionID") %>님으로 로그인되었습니다.</p>
        <hr class ="own">
        </div>
    </div>
        
    
			
			
	

	
	
	
</body>
</html>