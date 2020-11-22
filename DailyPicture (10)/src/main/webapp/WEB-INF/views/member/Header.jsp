<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	
	
	
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
			}
		}
	</script>
	
	
	
	<style>
		  #span1{
				margin-left: 200px;
			}
			.img0{
				outline:0;
				border:0;
			}
			.img1 {
			
			    width: 30px;
			    height: 30px; 
			    border-radius: 70%;
			    overflow: hidden;
				text-align:center;
         
				outline:0;
				border:1px solid red;
			}
	</style>
</head>
<body>	
	<div id="header">
       
      <div class="headerpicture">
		
      	<button id="logoutBtn" class="img0" onclick="changeView(0)"><img src="img/logo.jpg" alt="로고"></button>
      	
      	<spand id="span1">
      	<button id="logoutBtn" class="img0" onclick="changeView(1)"><img src="img/search.jpg" alt="찾기"></button>
      	<button id="logoutBtn" class="img0" onclick="changeView(2)"><img src="img/home.jpg" alt="홈"></button>
      	<button id="logoutBtn" class="img0" onclick="changeView(3)"><img src="img/compass.jpg" alt="나침반"></button>
      	<button id="logoutBtn" class="img0" onclick="changeView(4)"><img src="img/alret.jpg" alt="알림"></button>
      	<button id="logoutBtn" class="img1" onclick="changeView(5)"><img src="img/profile.jpg" alt="프로필사진"></button>
      	</span>
		
      
       
        <h1></h1>
        <hr class ="own">
        </div>
    </div>
        
    
			<h3><%= session.getAttribute("sessionID") %>님으로 로그인되었습니다.</h3>
			
	

			
		</p>
	</div>
</body>
</html>