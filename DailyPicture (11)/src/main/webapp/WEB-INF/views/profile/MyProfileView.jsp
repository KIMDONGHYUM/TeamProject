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
     	<!-- <link rel="stylesheet" type="text/css" href="css/mpup.css"> -->
     	<link rel="stylesheet" type="text/css" href="css/settingpop.css">
     	<link rel="stylesheet" type="text/css" href="css/updatepop.css">
   
	
	
     	
     	
     	
     	
     	
     	
     <style>
     
    
			* {
				margin:0 auto;
				padding:0;
				max-width:100%;
		/* 	    border: solid red 1px;  */
			
				
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
          
            text-align: center;
        	border-bottom:solid rgb(200, 197, 197) 1px;
					
           /*  border-bottom: thin solid  rgb(200, 197, 197); */
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
		    height:630px;
		    width: 35%;
		    vertical-aling: top;
		    background-color: rgb(239, 237, 237);
		   
			
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
        
        
         #n{
		 
		 width: 70px;
		 	
		 }
		 .yn{
            /* 플렉서블 박스로 지정 */
            display: flex;
            flex-direction: row;
            margin-bottom: 10px;
        }
		 
		.opt4 {
            /* 가운데 맞춰 정렬 */
            justify-content: center;
        }
		 
		 
		 
		 
		#textmemo{
		border: 0;
		height: auto;
		}
		
	  
	  .texta {
      width: 490px;
      margin-left: -10px;
      
      }
      #PsettingBtn{
      width: 100px;
      padding-left:-20px;
      margin-left: -20px;
      
      
      }
      
      .PsettingBtn{
       border: solid rgb(201, 202, 201) 1px;
        	width: 30px;
    		height: 30px; 
    		border-radius: 70%;
    		overflow: hidden;
      text-align: top;
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
					       <td><input type="text" id="textmemo" style="float:left" value="${reg}" disabled/><td>
					       
					       <!--                  사진 수정 삭제 부분        드롭다운 부분                         -->
					  
					    
					  
					    <c:set var="id" value="${dto.id}" ></c:set>	

						<%

						String user_id = (String)pageContext.getAttribute("id");
						
						%>
					 
					   
					    <%			  
							if(session.getAttribute("sessionID").equals(user_id)){
						%>     
					    		<table id="systembox"> 
						<tr>
						<td>
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
					    </td>
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
								 
								  <div class="ynbox opt3">
		                          
		                           <div class="yes">
		                            <form action="DeletePanAction"> 
                          
		                           <input type="hidden" name="board_no" value="${dto.board_no}" />
		                            <input type="hidden" name="picture" value="${dto.picture}" />
		                           <input type="submit" id="yesbtn"  class="btn btn-info" value="예">                    
		                          </form>
		                          
		                           </div>		   
		                          
		                          
		                          <div class="no">
		                          <form>
		                          <input type="button"  class="cclose btn btn-info"  value="아니오" />
								  </form>
								 </div>
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
					 <% }else{ //사용자가 아닌사람이 볼 경우 %> 
					   <tr>
					    
					    </tr>
					    								
					</table> 
					
								
	                <%	}	%>	 
					   
					 
					   
					
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
					      
					       <td id ="PsettingBtn">
					         <button class="PsettingBtn" >‧‧‧</button>

							   <div class="smodal">
							
							     
							     <div class="smodal-content">
							      
							       <span class="close">&times;</span>                         
							 
					 
					 
					 
							
							
						<!-- jstl에 있는 변수를 스크립틀릿에서 사용할 수 있게 바꾼다. -->
						<c:set var="user_id" value="${rdto.user_id}" ></c:set>	

						<%

						 user_id = (String)pageContext.getAttribute("user_id");
						
						%>
					 
					   
					    <%			  
							if(session.getAttribute("sessionID").equals(user_id)){
						%> 
				        
						<div class="ssettingbox">
							       
					   <input type="button" class="upbtnpop btn btn-outline-dark"  value="수정" />
					   
					    <!-- 첫 번째 Modal -->
					   <div class="upmodal">
					
					     <!-- 첫 번째 Modal의 내용 -->
					     <div class="upmodal-content">
					                          
					      <div id="popupview3" >
					                   <form action="ReplyUpdateAction">                    
								       <textarea name="content" id="memo" class="form-control" cols="30" rows="5" style="margin-top:20%" placeholder="수정할 내용을 입력하세요"></textarea><br />
								       <input type="hidden" name="board_no" value="${rdto.board_no}"/>
								       <input type="hidden" name="reply_no" value="${rdto.reply_no }" />
								       
								       <div class ="yn otp4">
								       <div class="y">
								       <input type="submit" class="btn btn-success" value="수정">
								       </div>
								       <div class="n">
		                                <input type="button"  class="upclose btn btn-danger"  value="취소" />
								       </div>
								       </div>
								       
								       </form> 
								       
								       
									</div>
					    
					           </div>
				           	   </div>
							       
							 
								 	    				        		        
							       <form action="DeleteReplyAction">
				            		
				            		 <input type="hidden" name="reply_no" value="${rdto.reply_no}" />
				            		  <input type="hidden" name="board_no" value="${dto.board_no}" />
				            		  
				            		<input type="submit" class="sbtn btn btn-success"  value="댓글 삭제">
				            
				        	       </form>
				        	       
				       		 	<form action="DeletePicture" method="POST" enctype="multipart/form-data">
				       		 		<input type="hidden" name="picture" value=<%=member.getPicture()%>>
				            		<input type="submit" class="sbtn btn btn-danger" class="form-control" value="현재 댓글 신고">
				        		</form>
							      </div>  
					
					
							<% }else{ //사용자가 아닌사람이 볼 경우 %> 
									<form action="DeletePicture" method="POST" enctype="multipart/form-data">
				       		 		<input type="hidden" name="picture" value=<%=member.getPicture()%>>
				            		<input type="submit" class="sbtn btn btn-danger" class="form-control" style="margin-top:25%" value="현재 댓글 신고">
				        		</form>
							      </div>  
	                 		<%	}	%>	     
							      
							        
							    
							     </div>
							  
					         
					         
					         
					       </td>
					        
					                       
					</tr>
					</table>
					</c:forEach>
					
					</div>
					
					
					
					 
					
					<div id="chatWrite" >
					 <form action="Replyinsert">
			  		  <input type="text" class="chatWrite" name="content"  placeholder="글을써주세요" />
			  		  
			  		   <input type="hidden" name="board_no" value="${dto.board_no}" />
			  		   <input type="hidden" name="writer" value="<%=session.getAttribute("sessionID")%>" />
			  	 	  
			  		  <input type="submit" class="btn btn-primary" style="float:right" value="보내기"/>	
			  		  </form>
			  		
			  		</div>
			  			
			  		</div> 
			  		
			  		
			  		</div>
			  		
			  		
			  		
			  		

	     
		


			  
                 <script>
				// Modal을 가져옵니다.
				var modals = document.getElementsByClassName("smodal");
				// Modal을 띄우는 클래스 이름을 가져옵니다.
				var btns = document.getElementsByClassName("PsettingBtn");
				// Modal을 닫는 close 클래스를 가져옵니다.
				var spanes = document.getElementsByClassName("close");
				var funcs = [];
				 
				// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
				function Modal(num) {
				  return function() {
				    // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
				    btns[num].onclick =  function() {
				        modals[num].style.display = "block";
				        console.log(num);
				    };
				 
				    // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
				    spanes[num].onclick = function() {
				        modals[num].style.display = "none";
				    };
				  };
				}
				 
				// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
				for(var i = 0; i < btns.length; i++) {
				  funcs[i] = Modal(i);
				}
				 
				// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
				for(var j = 0; j < btns.length; j++) {
				  funcs[j]();
				}
				 
				// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
				window.onclick = function(event) {
				  if (event.target.className == "smodal") {
				      event.target.style.display = "none";
				  }
				  if (event.target.className == "mmodal") {
					  event.target.style.display = "none";     
				  }
				  if (event.target.className == "upmodal") {
					  event.target.style.display = "none";     
				  }
				  
				 
				};
				
				
				    </script>
              
              
              
                	
	         <script>
       
						// Modal을 가져옵니다.
						var umodals = document.getElementsByClassName("upmodal");
						// Modal을 띄우는 클래스 이름을 가져옵니다.
						var ubtns = document.getElementsByClassName("upbtnpop");
						// Modal을 닫는 close 클래스를 가져옵니다.
						var uspanes = document.getElementsByClassName("upclose");
						var ufuncs = [];
						 
						// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
						function UModal(num) {
						  return function() {
						    // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
						    ubtns[num].onclick =  function() {
						        umodals[num].style.display = "block";
						        console.log(num);
						    };
						 
						    // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
						    uspanes[num].onclick = function() {
							    
						        umodals[num].style.display = "none";
						    };
						  };
						}


						// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
						for(var i = 0; i < ubtns.length; i++) {
						  ufuncs[i] = UModal(i);
						}
						 
						// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
						for(var j = 0; j < ubtns.length; j++) {
						  ufuncs[j]();
						}
						
						
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




