<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dto.MyctDto" %>
<%@ page import="com.study.springboot.dto.MemberDto" %>
<%@ page import= "com.study.springboot.dto.ReplyDto" %>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.List" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/settingpop.css">
	    <%
			ArrayList<MyctDto> clist = (ArrayList<MyctDto>)session.getAttribute("mmlist");
		%>
    	
    	<%
     	 MemberDto member = (MemberDto)session.getAttribute("memberInfo"); 
	   
     	%>
     	
     	<%
     	 List<ReplyDto> rlist = (List<ReplyDto>)session.getAttribute("rlist"); 
     	%>
    
    
    <title>Main</title>
	
    <style>
       
       

	     * {
			    max-width:100%;
				margin:0 auto;
				padding:0;
			 /*   border: solid red 1px;   */
     		   }

         #subbody{
            margin-top:-19px;
            padding-top:30px;
            background-color: rgb(239, 237, 237);
        
          }
          
          /* 밑줄  */
        .three{			
            
           border-bottom:solid rgb(224, 223, 223) 0.1px;
           
          }
          
        .own {
          width:2000px;
          color:gray; 
          border: thin solid rgb(240, 231, 231);
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
     
        #main{
            width: 600px;
            
            margin:0 auto;
            text-align: center;
            margin-top: 100px;
            background-color: white;
            
            border-radius: aa bb cc dd;
            /* border: thin solid rgb(240, 231, 231); */
          
            border: thin solid rgb(215, 214, 214);
            border-radius: 1em;
    
        }
        
        
        /*    메인 부분    */ 
        
        #profiletable{
        width: 100%;
        }
        

        #profilebox{
         margin-top: 7%;
         margin-bottom: 3%;
         float: left;
         margin-left: 30px;
        }
        
        .profilereg{
         float:left;
         margin-right: 200px;
         margin-bottom: 15px;
         outline:0;
         border:0;
        }
        
     
        .sprofileimg{
        
        	border: solid rgb(153, 243, 18) 2px;
        	width: 35px;
    		height: 35px; 
    		border-radius: 70%;
    		overflow: hidden;
    		
    		
        }	
        
       .profile {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		 }
		   
		   
        #user_id {
            margin-top: 20px;
            float: left;
            height: 50px;
        }
       
       .image {
           background-color: rgb(248, 245, 245);
           height: 490px;
           text-align: left;
       }
       
      

      a{
            text-decoration: none;
            color: black;
       }
       
       
       
       #titlebox{
	       vertical-align: center;
	       float: left;
	       margin-left: -20px;
	       width:100px;
	     
       }
       
       #textmemo{
		border: 0;
		margin-left: -30px;
		margin-top: 15px;
		height: auto;
		}
		
	   .texta textarea {
	      width: 100%;
	      resize: none;
	      overflow-y: hidden; /* prevents scroll bar flash */
	      padding: 1.1em; /* prevents text jump on Enter keypress */
	      padding-bottom: 0.2em;
	      line-height: 1.6;
       }	
		
	  
	  .texta {
         width: 490px;
         margin-left: -10px;
      
      }
      
      
      .content {
          background-color: rgb(236, 245, 245);
          height: 80px;
          text-align: left;
      }
      
      #chatWrite{
       margin-bottom: 50px;
      }
      
      .chatWrite{
      border: 0;
      height: 30px;
      outline: 0;
      float:left;
      width: 450px;
      
      }
      

        
        #pagin{
		
		text-align: center;
		margin-top: 200px;
		
		}
       

        #footer{
            text-align: center;
            margin-top: 150px;
            
            width:50%;
            
        }
        
         
        
        
        
    </style>
    

</head>

<body>
    <div id="header">
       <jsp:include page="Header.jsp" /> 
    </div>
    
   
  <div id="subbody">
    <c:forEach var="mdto" items="${ clist }" varStatus="status">
    
    	<div id="main" >
    	
	      <table id="profiletable" >
					        
              <tr class="three">
			    <td>
			    	<div id="profilebox">
					   	
					   	<div class="sprofileimg" style="background: #BDBDBD;"> 
					      <a href="profile.go"><img class="profile" src="user/${mdto.id}/<%=member.getPicture() %>"  onerror="this.src='img/profile.jpg'" ></a>
					    </div>
                        
                        <div id="user_popid">
                          <a href="profile.go"><small>${mdto.id}</small></a> 
                        </div>
                       
                    </div>
			    </td>
					
			    <td>
			         <fmt:formatDate value="${mdto.reg}" var="reg" pattern="yyyy.MM.dd"/>
			         <input type="text" class="profilereg" value="${reg}" disabled/>
			    </td>
			    
			    </tr>
					   
		   </table>
                     
					
              
           <table>
            
	            <tr>
	                <td>
	                 <div class="image">
	                 
	                    <img src="user/${mdto.id}/${ mdto.picture }" width="100%" height="100%">
	                 
	                 </div>   
	                </td>
	            </tr>


          
	           <tr class="three">
	             <td>
	              <div class="likecoment">
	                <a href="/like"><img src="img/alret.jpg" ></a>
	                <!-- <a href="gocomment.go"><img src="img/comment.jpg"></a> -->
	                <a href="goshare.go"><img src="img/bird.jpg"></a>
	                <a href="goshare.go">♡</a>
	                
	              </div>
	             </td>
	           </tr>
           </table>
            
            <table>
               <tr>
	             
	                    <td>
					   	 
						
						  
						   	<div id="titlebox">
						   	
						   	 <div class="sprofileimg" style="background: #BDBDBD;"> 
						       <a href="profile.go"><img class="profile" src="user/${mdto.id}/<%=member.getPicture()%>"  onerror="this.src='img/profile.jpg'" ></a>
						     </div>
	                       
	                         <div id="user_popid">
	                          <a href="profile.go"><label for="sprofileimg"><small>${mdto.id}</small></label></a> 
	                         </div>
	                       
	                        </div>
	              
					    
					    </td>
					      
					 
					    <td>
					      
					      <div class="texta">
					       <textarea id="textmemo" style="width:100%" disabled>${mdto.memo}</textarea>
					      </div>
						 
						  <script>
						    $(document).ready(function() {
						      $('.texta').on( 'keyup', 'textarea', function (e){
						        $(this).css('height', 'auto' );
						        $(this).height( this.scrollHeight );
						      });
						      $('.texta').find( 'textarea' ).keyup();
						    });
						  </script>
						</td>	
						                       
			       </tr>
			   								
			    
	           </table>
		 
		   <table>
			    <tr>
				    <td>
					    <div class="container">
					    	<div class="commentList"></div>
					    </div>
				    </td>
			    </tr>
			</table>		
	               
	
               
           <p class="three"></p>
 
           <table>
	            <tr>
	            <td>
	                <div id="chatWrite">
					 <form action="Replyinsert">
			  		  <input type="text" class="chatWrite" name="content"  placeholder="글을써주세요" />
			  		  
			  		   <input type="hidden" name="board_no" value="${mdto.board_no}" />
			  		   <input type="hidden" name="writer" value="<%=session.getAttribute("sessionID") %>" />
			  	 	  
			  		  <input type="submit" class="btn btn-primary" style="float:right" value="보내기"/>	
			  		  </form>
			  		
			  		</div>
	               </td>
	            </tr>
	            
	            
             
         </table>
       
          <%--  <div class="container">
	        <label for="content">comment</label>
	        
	        <form name="commentInsertForm" id="commentInsertForm${status.count}">
	            <div class="input-group">
	                 <input type="hidden" name="writer" value="<%=session.getAttribute("sessionID") %>" />
	                 <input type="text" class="form-control" id="content${status.count}" name="content" placeholder="내용을 입력하세요.">
	                 <input type="hidden" name="board_no" value="${mdto.board_no}" />
	               <span class="input-group-btn">
	                    <button class="btn btn-default" type="button" name="commentInsertBtn" onclick="insertData(${status.count})">등록</button>
	               </span>
	              </div> 
	        </form> 
	       </div> --%>
	    
       </div> 
 
  </c:forEach> 
    
    

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
    
 </div>  

         <script>

			/* $('[name=commentInsertBtn]').one('click focus', function(){ 
			    var insertData = $(self).serialize(); //serialize는 form태그 name에 있는 값들을 가져와 준다.
                console.log(insertData);
			    commentInsert(insertData);
			}); */
			
			function insertData( btn_no ) {
				var insertData = $( '#commentInsertForm'+btn_no ).serialize(); //serialize는 form태그 name에 있는 값들을 가져와 준다.
		        console.log(insertData);
			    commentInsert(insertData);
			}
			 
			 
			//댓글 목록 
			function commentList(board_no){
			    $.ajax({
			        url : '/MainReplyView',
			        type : 'post',
			        data : board_no,
			        success : function(data){
			            var a =''; 
			            $.each(data, function(key, value){ 
			                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
			                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer;
			                a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
			                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
			                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
			                a += '</div></div>';
			            });
			            
			            $(".commentList").html(a);
			        }
			    });
			}
			 
			//댓글 등록
			function commentInsert(insertData){
			    $.ajax({
			        url : '/insert',
			        type : 'post',
			        data : insertData,// { 'writer': 'hong', 'content' : 'ment...' }
			        success : function(data){
			            if(data == 1) {
			            	var board_no = '${mdto.board_no}'; //게시글 번호
			                commentList(board_no); //댓글 작성 후 댓글 목록 reload
			                $('[name=content]').val('');
			            }
			        }
			    });
			}
			 
			
			 
			$(document).ready(function(){
			    commentList(); //페이지 로딩시 댓글 목록 출력 
			});
			 
			 
			 
			</script>


</body>
</html>


