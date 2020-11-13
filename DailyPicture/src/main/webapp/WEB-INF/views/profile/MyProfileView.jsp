<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.study.springboot.dto.MemberDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.List" %>
<%@ page import="com.study.springboot.dto.ReplyDto" %>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 내용 보기</title>
<!-- view.jsp -->
        <%
     	 MemberDto member = (MemberDto)session.getAttribute("mdto"); 
     	%>
     	
     	<%
     	 List rlist = (List)session.getAttribute("rlist"); 
     	%>
     	<link rel="stylesheet" type="text/css" href="css/modelpopupp.css">
     	<link rel="stylesheet" type="text/css" href="css/mpup.css">
   
	
	
     	
     	
     	
     	
     	
     	
     <style>
     
    
			* {
				margin:0 auto;
				padding:0;
				max-width:100%;
			   /* border: solid red 1px;  */
			
				
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
        
        }
        .own{
            width:90%;
            border: thin solid rgb(240, 231, 231);
           
        }
        
        .two{
        	width:70%;
            border: thin solid  rgb(200, 197, 197);
        }
        
        .three{

        	
					
            border-bottom: thin solid  rgb(200, 197, 197);
        }
        
        .four{
         
            border-top: thin solid  rgb(200, 197, 197);
        }
       	
		    #popprofilebox{
		    text-align:center;
		    
		    }
		    
        
        	
          .sprofileimg{
        
        	border: solid rgb(153, 243, 18) 2px;
        	width: 30px;
    		height: 30px; 
    		border-radius: 70%;
    		overflow: hidden;
    		
    		
        }	
        
          .profile {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		   }
		
     
     
     
     
     #mainbox{
     
     margin-bottom: 300px;
     
     }
     
     #poppimg{
			background-color:rgba(0,0,0,.9);
			
			vertical-align:bottom;
			display: block;
			float:left;
			height:630px;
			width:65%;
			}
			.poppimg{
			height:100%;
			width:85%;
			margin-left: 68px;
			}	
			
			
			#popupview2{
		    margin-top: 10px;
			text-align: center;
			width: 300px;
		    }
			
			
			#popchat{
			position:absolute;
			right: 0;
		    height:73.7%;
		    width: 35%;
		    vertical-aling: top;
		   
			
			  }
			  
		
			 @media screen and (max-width: 1150px) {
    	     #popchat{
			 	
			 	display:none;
			
			  }
    	 }
			
			
			
			
			#ptable{
			 	
				flot:left;
				margin-left: 0px;
				width:99%;
				text-align: left;
			
			
						
				
			}
			
			.line{
		 	 	border-bottom:thin solid rgb(240, 231, 231); 
				vertical-align:middle;
			
			
			  }
			
		
			
			
			
			#chatWrite{
			 width:90%;
			 position: absolute;
			 bottom: 0px;
			/*  margin-left: 650px; */
			 margin-left: 15px;
			 
			}
			
			 @media screen and (max-width: 1550px) {
    	     #chatWrite{
			 	
			 	display:none;
			
			  }
    	 }
			
			.chatWrite{
				
			 	height: 50px;
				border: 0;
  				outline: 0;
  			    width: 60%;
				
			}
			
		
			
		    #popprofilebox{
		    text-align:center;
		    
		    }
		    .dropdown-item{
		     border: 0;
  		    outline: 0;
		    }
		    
		    
		    
		    
		   
		   #deleteviewbox{
		   	text-align: center;
		   }
		    
		 #yesbtn{
		 
		 width: 70px;
		 	
		 }
		 .ynbox{
            /* 플렉서블 박스로 지정 */
            display: flex;
            flex-direction: row;
            margin-bottom: 10px;
        }
		 
		.opt3 {
            /* 가운데 맞춰 정렬 */
            justify-content: center;
        }
		 
		 
		#textmemo{
	
		border: 0;
		width: 1;
		height: auto;
		} 
	.texta {
      width: 500px;
      margin-left: -10px;
    }
    .texta textarea {
      width: 100%;
      resize: none;
      overflow-y: hidden; /* prevents scroll bar flash */
      padding: 1.1em; /* prevents text jump on Enter keypress */
      padding-bottom: 0.2em;
      line-height: 1.6;
    }
		
		#replyview{
		float:left;
		margin-left: 10px;
		margin-top: 10px;
		}
		#reply{
		margin-top: 10px;
		flot:left;
		
		width:99%;
		text-align: left;			

		}
		
		#repbox{
		
		float:left;
		width:100%;
		height: 400px;
		margin-left: 10px;
		overflow:auto;
		}
		
		.rep{
		float:left;
		width:100%;
		}
		
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


       
       <div id= "mainbox">
         <div id="poppimg">
			      <img class="poppimg" src="user/${dto.id}/${ dto.picture }">
			   	  </div>
			   	  
			      <div id="popchat"> 
			      
                     <table id="ptable" >
					        
					    <tr class="three">
					   	<td>
					   	<div id="popprofilebox">
					   	
					   	 <div class="sprofileimg" style="background: #BDBDBD;"> 
					       <a href="profile.go"><img class="profile" src="user/${dto.id}/<%=member.getPicture() %>"  onerror="this.src='img/profile.jpg'" ></a>
					       </div>
                          <div id="user_popid">
                          <a href="profile.go"><small>${dto.id}</small></a> 
                        </div>
                       
                        </div>
					   	</td>
					   
					  <fmt:formatDate value="${dto.reg}" var="reg" pattern="yyyy.MM.dd"/>
					       <td><input type="text" id="textmemo" value="${reg}" disabled/><td>
					       
					       <!--                  사진 수정 삭제 부분        드롭다운 부분                         -->
					  
					    
					  
					    
					   
					 
					   	<table id="systembox"> 
						<tr>
						<p class="bbtnpop">수정</p> 
					    <!-- 첫 번째 Modal -->
					   <div class="mmodal">
					
					     <!-- 첫 번째 Modal의 내용 -->
					     <div class="mmodal-content">
					       <span class="cclose">&times;</span>                         
					      <div id="popupview2" >
					       <form action="UpdatePan" method="post" enctype="multipart/form-data">
									<h2>게시글 수정</h2>
									<hr class ="own">
								    <input type="hidden" name="board_no" value="${dto.board_no}" />
		                            <input type="hidden" name="picture" value="${dto.picture}" />
								    <textarea name="memo" id="memo" class="form-control" cols="30" rows="5" placeholder="수정할 내용을 입력하세요"></textarea><br />
									<input type="file" class="btn btn-info" class="form-control"  name="filename" placeholder="사진을 선택해주세요"><br />
									<input type="submit" class="btn btn-success" value="파일수정">
									</form>
									</div>
					    
					     </div>
					   </div>
					   
					    </tr>
						
							
							
						   <tr>
						   <p class="bbtnpop">삭제</p> 
						 
						   <!-- 첫 번째 Modal -->
						   <div class="mmodal">
						
						     <!-- 첫 번째 Modal의 내용 -->
						     <div class="mmodal-content">
						                            
						       
						       <div id="deleteviewbox" >
							
									<h4>이 게시물을 영구적으로 삭제하시겠습니까?</h4>
									<hr class ="own">
								 
								  <form action="DeletePanAction"> 
                          
		                           <input type="hidden" name="board_no" value="${dto.board_no}" />
		                            <input type="hidden" name="picture" value="${dto.picture}" />
		                        
		                         <div class="ynbox opt3">
		                          
		                           <div class="yes">
		                           <input type="submit" id="yesbtn"  class="btn btn-info" value="예">
								   </div>		                       
		                          
		                          </form>
		                          
		                          
		                          <div class="no">
		                          <form>
		                          <input type="button"  class="cclose btn btn-info"  value="아니오" />
								  </form>
								 </div>
								 </div>
						       
						       
						     </div>
						   </div>			
			       			               
                          </tr>
                          
                          
                          <tr>
                          <a  href="#">나만보기</a>
                          </tr>
                          
					 
					    </table>
					 	
				  
					    <tr>
					    
					    </tr>
					    								
					</table> 
					
					<!-- 글 쓴이 내용 -->
					<table id="replyview">
			      	        
					    <tr>
					   	<td>
					   	<div id="popprofilebox">
					   	
					   	 <div class="sprofileimg" style="background: #BDBDBD;"> 
					       <a href="profile.go"><img class="profile" src="user/${dto.id}/<%=member.getPicture()%>"  onerror="this.src='img/profile.jpg'" ></a>
					       </div>
                          <div id="user_popid">
                          <a href="profile.go"><label for="sprofileimg"><small>${dto.id}</small></label></a> 
                        </div>
                       
                        </div>
					   	</td>
					   
					  
					     <td>
					      <div class="texta">
					       <textarea id="textmemo" disabled>${dto.memo}</textarea>
					      </div>
						</td>
					       
					                       
					</tr>
					
					</table>
			
				
			   

			       
					
			      	  <div id="repbox">
			      	  <c:forEach var="rdto" items="${ rlist }" > 
			      	   <table class="rep">     
					    <tr>
					   	<td>
					   	<div id="popprofilebox">
					   	
					   	 <div class="sprofileimg" style="background: #BDBDBD;"> 
					       <a href="profile.go"><img class="profile" src="user/${rdto.user_id}/${rdto.picture}"  onerror="this.src='img/profile.jpg'" ></a>
					       </div>
                          <div id="user_popid">
                          <a href="profile.go"><label for="sprofileimg"><small>${rdto.user_id}</small></label></a> 
                        </div>
                       
                        </div>
					   	</td>
					   
					  
					       <%-- <td><input type="text" id="textmemo" value="${rdto.content}" disabled/><td> --%>
					       
					       <td>
					        <div class="texta">
					       <textarea id="textmemo" disabled>${rdto.content}</textarea>
					      </div>
					       </td>
					       
					                       
					</tr>
					</table>
					</c:forEach>
					
					</div>
					
					
					
					 
					
					<div id="chatWrite">
					 <form action="Replyinsert">
			  		  <input type="text" class="chatWrite" name="content"  placeholder="글을써주세요" />
			  		  
			  		   <input type="hidden" name="board_no" value="${dto.board_no}" />
			  		   <input type="hidden" name="writer" value="<%=session.getAttribute("sessionID") %>" />
			  	 	  
			  		  <input type="submit" class="btn btn-primary" style="float:right" value="보내기"/>	
			  		  </form>
			  		
			  		</div>
			  			
			  		</div> 
			  		
			  		
			  		</div>
			  		
			  		
			  		
			  		
			  		<%-- <div id="chatWrite">
					 
					 <form name="replyInsert">
			  		  <input type="text" id="content" name="content" class="chatWrite" placeholder="글을써주세요" />
			  		  	
			  		   <input type="hidden" name="board_no" value="${dto.board_no}" />
			  		
			  		  <input type="hidden" name="writer" value="${dto.id}" />
			  		 
			  		  
			  		  <!-- <input type="button" class="btn btn-primary" name="replytBtn" style="float:right" value="보내기"/>	 -->
			  		 <button class="btn btn-primary" type="button" name="replyInsertBtn">등록</button>
                      </form> 
			  		
			  		
			  		</div>
			     	
			  		</div>  --%>
	     
				
		
		<script>

		
			var board_no = '${dto.board_no}'; //게시글 번호
			
			
			$('[name=replyInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
			    var insertData = $('[name=replyInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
			    replyInsert(insertData); //Insert 함수호출(아래)
			});
			 
		 
		 
			//댓글 목록 
			function replyList(){
		    $.ajax({
		        url : '/reply/list',
		        type : 'get',
		        data : {'board_no':board_no}    /*{'writer': writer} */
		        success : function(data){
		            var a =''; 
		            $.each(data, function(key, value){ 
		                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
		                a += '<div class="commentInfo'+value.reply_no+'">'+'댓글번호 : '+value.reply_no+' / 작성자 : '+value.user_id;
		                a += '<a onclick="commentUpdate('+value.reply_no+',\''+value.content+'\');"> 수정 </a>';
		                a += '<a onclick="commentDelete('+value.reply_no+');"> 삭제 </a> </div>';
		                a += '<div class="commentContent'+value.reply_no+'"> <p> 내용 : '+value.content +'</p>';
		                a += '</div></div>';
		            });
		            
		            $(".replyList").html(a);
		        }
		    });
		}
		 
		//댓글 등록
		function replyInsert(insertData){
		    $.ajax({
		        url : '/reply/insert',
		        type : 'post',
		        data : insertData,
		        success : function(data){
		            if(data == 1) {
		                replyList(); //댓글 작성 후 댓글 목록 reload
		                $('[name=content]').val('');
		            }
		        }
		    });
		}
		 
	/* 	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
		function replyUpdate(reply_no, content){
		    var a ='';
		    
		    a += '<div class="input-group">';
		    a += '<input type="text" class="form-control" name="content_'+reply_no+'" value="'+content+'"/>';
		    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
		    a += '</div>';
		    
		    $('.replyContent'+reply_no).html(a);
		    
		} */
		 
		/* //댓글 수정
		function commentUpdateProc(cno){
		    var updateContent = $('[name=content_'+cno+']').val();
		    
		    $.ajax({
		        url : '/comment/update',
		        type : 'post',
		        data : {'content' : updateContent, 'cno' : cno},
		        success : function(data){
		            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
		        }
		    });
		}
		 
		//댓글 삭제 
		function commentDelete(cno){
		    $.ajax({
		        url : '/comment/delete/'+cno,
		        type : 'post',
		        success : function(data){
		            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
		        }
		    });
		} */
		 
		 
		 
		 
		$(document).ready(function(){
		    replyList(); //페이지 로딩시 댓글 목록 출력 
		});
		 
		 
		 
		</script>


				
		
		


		
		<script>
       
						// Modal을 가져옵니다.
						var mmodals = document.getElementsByClassName("mmodal");
						// Modal을 띄우는 클래스 이름을 가져옵니다.
						var bbtns = document.getElementsByClassName("bbtnpop");
						// Modal을 닫는 close 클래스를 가져옵니다.
						var sspanes = document.getElementsByClassName("cclose");
						var ffuncs = [];
						 
						// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
						function MModal(num) {
						  return function() {
						    // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
						    bbtns[num].onclick =  function() {
						        mmodals[num].style.display = "block";
						        console.log(num);
						    };
						 
						    // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
						    sspanes[num].onclick = function() {
							    
						        mmodals[num].style.display = "none";
						    };
						  };
						}


						// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
						for(var i = 0; i < bbtns.length; i++) {
						  ffuncs[i] = MModal(i);
						}
						 
						// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
						for(var j = 0; j < bbtns.length; j++) {
						  ffuncs[j]();
						}
						 

						window.onclick = function(event) {
						
							  if (event.target.className == "mmodal") {
							      event.target.style.display = "none";
									  }
									};
						
    </script> 
    
    <script>
    $(document).ready(function() {
      $('.texta').on( 'keyup', 'textarea', function (e){
        $(this).css('height', 'auto' );
        $(this).height( this.scrollHeight );
      });
      $('.texta').find( 'textarea' ).keyup();
    });
  </script>
    

</body>
</html>




