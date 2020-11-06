<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>

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
  
  	  .own {
            width:2000px;
            color:gray; 
            border: thin solid rgb(240, 231, 231);
        }


        .headerpicture{
            text-align: center;
         
        }
       /*  .img0{
         outline: 0;
            border: 0;
        }
        .img1{
         outline: 0;
            border: 0;
        }
         */
        #main{
            width: 800px;
    
           margin:0 auto;
            text-align: center;
            margin-top: 100px;
            background-color: white;
            border-radius: aa bb cc dd;
            border: thin solid rgb(240, 231, 231);
            border-radius: 2em;
    
        }


        .profile{
            float: left;
            margin-left: 30px;
            margin-top : 10px;
        }
        #user_id {
            margin-top: 20px;
            float: left;
            height: 50px;
        }
       
       .image {
           background-color: rgb(248, 245, 245);
           height: 400px;
           text-align: left;
       }


      a{
            text-decoration: none;
            color: black;
       }
       .comment {
           float: left;
           padding: 20px;
       }
      .content {
          background-color: rgb(236, 245, 245);
          height: 80px;
          text-align: left;
      }
       

        #text {
          margin-top: 20px;
          width: 700px;
          height: 40px;
      }

        #send {
          padding-top: 20px;
          padding-left: 20px;
      }
        
       /*  span{
         
          margin-left: 200px;  
        }
        */

        #footer{
            text-align: center;
            margin-top: 300px;
            
            width:50%;
            
        }
        
        
        
    </style>
    

</head>

<body>
    <div id="header">
       <jsp:include page="Header.jsp" /> 
    </div>
    
    
        
    <div id="main" >

        <table>
            <tr>
                
                    <a href="profile"><img class="profile" src="img/profile.jpg" ></a>
                    <div id="user_id" >
                        <a href="profile.go"><small>user_id</small></a> 
                    </div>
                <br>
                <br>

                
                
            </tr>
            
            <tr>
                 <div class="image">
                    <h2>게시물 ex) 사진 or 동영상</h2>

                 </div>   
             
            </tr>

            <tr>
            <div class="comment">
                <a href="/like"><img src="img/alret.jpg" ></a>
                <a href="gocomment.go"><img src="img/comment.jpg"></a>
                <a href="goshare.go"><img src="img/bird.jpg"></a>
                
            </div>
            <br>
            <br>
            <br>
            <div class="content">
                <h2>내용</h2>
            </div>
            </tr>

            <tr>
                <div class="comments">
                    <input type="text" id="text" type="text" placeholder="댓글달기.." style="background-color:transparent;border:0 solid black;text-align:left;"> 
                    <a href="/send"><img id="send" src="img/send.jpg"></a>
                </div>
                
            </tr>
            <tr>
             
                <div class="blank">

                </div>

            </tr>

        </table>

    </div>

    <div id="footer">
   
        <a href="Introduce">소개 </a>| <a href="Infomation">고객센터 </a>| <a href="Location">위치 </a> 
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


