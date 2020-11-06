<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위치</title>
<style>
	* {
	   max-width:100%;
	   margin:0 auto;
	   padding:0;
      }

   body{    
       background-color:rgb(246, 250, 250);
       }
       
   #header{
   
       background-color: white;
       vertical-align: top;
       margin-top: -5px;
       margin-left: -5px;
       margin-right: -10px;
       padding-top: 40px;
       }     
    .headerpicture{
        text-align: center; 
       }
   
  	 h1 {
    	padding-top:100px;
  		text-align:center;
   	   }
   	   
   #wrap {
   		padding-top:100px;
   		display:flex;
   }
   #ment {
   		padding-left:20%;
   		text-align: start;
   }
   #address {
   		padding-left:20%;
   		text-align: start;
   }
   #footer{
        text-align: center;
        margin-top: 200px;
        width:50%;
   }
</style>
</head>
<body>
	<div id="header">
       <jsp:include page="Header.jsp" /> 
    </div>
    <h1><b>
    	본사위치
    </b></h1>
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25274.645548273573!2d127.05178224405928!3d37.641428756153566!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357cb9154da5ebed%3A0x48e83c38e2553738!2z7ZmU656R67mM65Sp!5e0!3m2!1sko!2skr!4v1604624699687!5m2!1sko!2skr" width="100%" height="250" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
	
	<div id="wrap">
		<div id="address">
			<h2><b>주소</b></h2>
			<h3>노원 상계동 문화의거리</h3>
		</div>
		<div id="ment">
			<h2><b>찾아오는 길</b></h2>
			<h3>지하철 이용시 - 지하철 4호선 노원역 2번 출구</h3>
			<h3>버스 이용시 - 노원역 9번 출구(11-210), 노원역 2번 출구(11-595)</h3>
		</div>
		
		
	</div>
	<div id="footer">
   
        <a href="Introduce">소개 </a>| <a href="">고객센터 </a>| <a href="Location">위치 </a> 
    </div>
        
        <table id="dp-nametable">
          <tr><td><small>상호명:데일리픽쳐|사업자등록번호:000-00-0000 사업자 확인</small></td></tr>
          <tr><td><small>통신판매업 신고번호 : 0000-서울노원-0000 | 개인정보관리책임자 : 홍길동</small></td></tr>  
          <tr><td><small>주소 : 서울시 노원구 | 대표자 : 이사장</small></td></tr>  
          <tr><td><small>TEL: 000-000-0000 | FAX: 000-0000-0000 | 이메일 : dp@dailypicture.com</small></td></tr>  
          <tr><td><small>Copyright 2020 데일리 픽쳐 Corp. All Rights Reserved.</small></td></tr> 
        </table>    
</body>
</html>