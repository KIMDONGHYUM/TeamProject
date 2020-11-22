<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DailyPicture</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

	<link rel="stylesheet" href="css/jquery.bxslider.css">

	<style>
		* {		
			max-width:100%;
			margin:0 auto;
			padding:0;
    	  }

     body {
            background-color:rgb(246, 250, 250);
          }                     
        
    #wrap {
        	margin: 0 auto;
        	padding-top: 300px;
        	width: 100%;
			height: 100%;
			position: fixed;			
          }
          
#overflow {
       		width: 100%;
			height: 100%;
			position: absolute;
			top: 0;
			background-image:url('images/camera.jpg');
			background-size:cover;
          }
        
       h1 {
        	text-align:center;
        	animation: fadein 2s;
          }
          
       h4 {
        	text-align:center;
        	animation: fadein 5s;
        }
        
        @-webkit-keyframes fadein { /* Safari and Chrome */
            from {
        opacity:0;
            }
            to {
        opacity:1;
             }
        }
        
 .content {
 			position: absolute;
 			top:40%;
 			left:70%;
 			transform: translate(-50%, -50%);                                                                   
 			font-size:5rem;
 			color: white;
 			z-index: 2;
 			text-align: center;
		  }
		  
#wrapper {
            width: 600px;
            margin: 0 auto;
            padding-top: 140%;
            padding-left: 55%;          
         }
         
#promotion {
         	position:absolute;
         	width:40%;
         	left: 10%;
         	right:60%;
           }
         
	</style>
	
	<link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
	
	<script type="text/javascript">
		var ovf, wrap;
			$(function(){
				ovf = this.getElementById("overflow");
				wrap = this.getElementById("wrap");
				winResize();
						$(window).bind({resize: winResize, scroll: winScroll});
			});
		
			function winResize(){
				ovf.style.top = wrap.offsetHeight + "px";
			}
		
			function winScroll(){
				var op = 1 - (window.pageYOffset / wrap.offsetHeight);
				wrap.style.opacity = op;
			}
	</script>
</head>
<body>
  	
    <div id=wrap>
    	<div id="intro">
    		<h1 style="font-family: 'Yellowtail', cursive;">DailyPicture</h1>
    	</div>
	    	<br><br>	    		
	    		<h4>데일리 픽쳐에 오신 여러분을 환영합니다.</h4>
	    		<h4>데일리 픽쳐는 온라인에서 일상사진, 여행 사진, 동영상 등을 공유할 수 있는 소셜 네트워크 서비스입니다.</h4> 
	    		<h4>데일리 픽쳐 이용자들은 데일리 픽쳐를 통해 소중한 가족이나 친구들에게 자신만의 특별하고 소소한 일상 사진을 공유할 수 있습니다.</h4>	    		
	    	<br><br>   	
    </div>
    
    <div id="overflow">
    	 <div class="content">
            <h3>데일리픽쳐 </h3>
            <h6>일상을 공유해보세요.</h6>
        </div>
	</div>
		
		<div id="wrapper">
			<div id="promotion">
				<h1>데일리픽쳐는 다양한 서비스를 제공합니다.</h1>
				<h1>지금 바로 데일리픽쳐의 기능을 사용해보세요.</h1>
				
			</div>
	        <div class="bxslider">
	            <div>
	                <img src="images/cafe.jpg" title="슬라이더1">
	            </div>
	            <div>
	                <img src="images/laundry.jpg" title="슬라이더2">
	            </div>
	            <div>
	                <img src="images/sunset.jpg" title="슬라이더3">
	            </div>
	            
	        </div>    
	    </div>
    

    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/jquery.bxslider.js"></script>

    <script>
        $(function(){
            $('.bxslider').bxSlider({
                slideWidth: 600,
                captions: false,        //주석, 이미지이름
                auto: true,             //자동재생
                autoControls: true,     //Start/Stop 버튼 사용
                stopAutoOnClick: true,  //클릭하면 멈추는가
                mode: "fade",     		//1. horizontal, 2. vertical, 3. fade 전환효과
                speed: 700,             //슬라이딩 속도(miliseconds)
                adaptiveHeight: true,  //이미지 높이에 따라 슬라이드 높이 결정
                touchEnabled: true,     //터치 스와이프 사용 결정
                controls: true,         //Prev/Next 버튼 사용 여부
                prevText: "Prev",       //이전버튼 문구
                nextText: "Next",       //다음버튼 문구
                autoHover: false        //마우스 올리면 일시 정지
            });
        });
    </script>
</body>
</html>