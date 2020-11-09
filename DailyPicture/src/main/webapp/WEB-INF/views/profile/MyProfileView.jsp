<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.study.springboot.dto.MemberDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 내용 보기</title>
<!-- view.jsp -->
        <%
     	 MemberDto member = (MemberDto)session.getAttribute("memberInfo"); 
     	%>
     	<link rel="stylesheet" type="text/css" href="css/modelpopupp.css">
     	
     	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	
     	
     	
     	
     	
     	
     	
     <style>
     
    
			* {
				margin:0 auto;
				padding:0;
				max-width:100%;
			   /*  border: solid red 1px;  */
			
				
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
		
     
     
     
     
     
     
     #poppimg{
			background-color:rgba(0,0,0,.9);
			
			vertical-align:bottom;
			display: block;
			float:left;
			height:100%;
			width:65%;
			}
			.poppimg{
			height:100%;
			width:85%;
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
			   
			 @media screen and (max-width: 1250px) {
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
			 width:100%;
			 position: absolute;
			 bottom: 0px;
			/*  margin-left: 650px; */
			 margin-left: 0px;
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
  			    width: 70%;
				
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
		
		} 
		
		#reply{
		margin-top: 10px;
		flot:left;
		margin-left: 0px;
		width:99%;
		text-align: left;			

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
					<table id="reply">
			      	        
					    <tr>
					   	<td>
					   	<div id="popprofilebox">
					   	
					   	 <div class="sprofileimg" style="background: #BDBDBD;"> 
					       <a href="profile.go"><img class="profile" src="user/${dto.id}/<%=member.getPicture() %>"  onerror="this.src='img/profile.jpg'" ></a>
					       </div>
                          <div id="user_popid">
                          <a href="profile.go"><label for="sprofileimg"><small>${dto.id}</small></label></a> 
                        </div>
                       
                        </div>
					   	</td>
					   
					  
					       <td><input type="text" id="textmemo" value="${dto.memo}" disabled/><td>
					       
					                       
					</tr>
					
					</table>
					
					<table id="reply">
			      	        
					    <tr>
					   	<td>
					   	<div id="popprofilebox">
					   	
					   	 <div class="sprofileimg" style="background: #BDBDBD;"> 
					       <a href="profile.go"><img class="profile" src="user/<%=session.getAttribute("sessionID") %>/<%=member.getPicture() %>"  onerror="this.src='img/profile.jpg'" ></a>
					       </div>
                          <div id="user_popid">
                          <a href="profile.go"><label for="sprofileimg"><small><%=session.getAttribute("sessionID")%></small></label></a> 
                        </div>
                       
                        </div>
					   	</td>
					   
					  
					       <td><input type="text" id="textmemo" value="${dto.memo}" disabled/><td>
					       
					                       
					</tr>
					
					</table>
					
					
					 
					
					<div id="chatWrite">
					 <form action="ReplysendAcion"></form>
			  		  <input type="text" class="chatWrite" placeholder="글을써주세요" />
			  		  	
			  		   <input type="hidden" name="board_no" value="${dto.board_no}" />
			  		
			  		  <input type="hidden" name="writer" value="${dto.id}" />
			  		 
			  		  
			  		  <input type="submit" class="btn btn-primary" style="float:right" value="보내기"/>	
			  		</div>
			  	
			  		</div>
			  		 
			
		
		
		
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

</body>
</html>




