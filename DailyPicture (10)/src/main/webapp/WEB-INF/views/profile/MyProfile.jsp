
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<%@ page import="com.study.springboot.dto.MyctDto" %>
<%@ page import="com.study.springboot.dto.MemberDto" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>

<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport;" content="width=device-wdidth; init-scale=1.0; user-scaclable=no">
		
     	<title>vGrid 플러그인</title>
     	
     	<%
		ArrayList<MyctDto> clist = (ArrayList<MyctDto>)session.getAttribute("clist");
     	
     
     	%>
     	
  <%--    <% 
              PageMaker pageMaker = (PageMaker)session.getAttribute("pageMaker");
     	%>   --%>
     	

     	
	   
	    	
     	<%
     	 MemberDto member = (MemberDto)session.getAttribute("memberInfo"); 
	   
     	%>
	    
	<link rel="stylesheet" type="text/css" href="css/stylepop.css">
	<link rel="stylesheet" type="text/css" href="css/modelpopup.css">
	<link rel="stylesheet" type="text/css" href="css/modelpopupp.css">
	<link rel="stylesheet" type="text/css" href="css/settingpop.css">
    <link rel="stylesheet" type="text/css" href="css/updatepop.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<script type="text/javascript">
		
		function changeView1(value){
			
			if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동
			{
				location.href="WritePage";
			}
			else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
			{
				location.href="LoginForm";
			}
			else if(value == "2") // 회원가입 버튼 클릭시 회원가입 화면으로 이동
			{
				location.href="JoinForm";
			}
			else if(value == "3") // 로그아웃 버튼 클릭시 로그아웃 처리
			{
				location.href="ModifyProfile";
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
	
	<!-- <script> 
	 document.getElementById('update').submit(); 
	</script>  -->
	
	
		<style>
			* {
				margin:0 auto;
				padding:0;
				max-width:100%;
			   /*  border: solid red 1px;  */
			
				
    		  }
         
         
         
			li {list-style: none; text-align:center;  padding: 6px; margin-top: 100px;}
		
         
         
	
		
		#searchview{
		text-align: center;
		
	    right: 5px;
	    top: 2px;
	    font-size: 15px;
	    
	    border: 0;
	    background: none;
		}
    	
    	
    	

  
	
        #header{
            background-color: white;
            vertical-align: top;
            margin-top: -5px;
            margin-left: -5px;
            margin-right: -10px;
            padding-top: 40px;
            
            
        }
        .own{
            width:90%;
            border:thin rgb(240, 231, 231);
            
           
        }
        
        .two{
        	width:70%;
            border: thin rgb(200, 197, 197);
        }
        
        .three{
	
            border-bottom:solid rgb(215, 214, 214) 1px;
             /* border: thin solid rgb(215, 214, 214); */
        }
        

       	#profile{
			padding-top:15px;
			text-align: center;
		}	
		
	   .box {
    		width: 150px;
    		height: 150px; 
    		border-radius: 70%;
    		overflow: hidden;
			
        	}
        	
        	
        .sprofileimg{
        
        	border: solid rgb(153, 243, 18) 2px;
        	width: 35px;
    		height: 35px; 
    		border-radius: 70%;
    		overflow: hidden;
    		
    		
        }	
       		
         .profilebar{
      	  margin-top:-5px;
          text-align: center;
          margin-right: 200px;
      
         }   
           .profile {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		   }
		  .profilep{
			  text-align: center;
		  }
            
            
        }
        .own{
            width:70%;
             
            border: thin solid  rgb(200, 197, 197);
        }
        
        .headerpicture{
            text-align: center;
        }
        


		

        #footer{
            text-align: center;
            margin-top: 300px;
            
        }
			#container div {
				width:200px;
				background:#fff;
				box-shadow: 0px 1px 1px #aaa;
				padding:5px;
				padding-bottom:5px;
				margin:20px;				
			}		
			#container div img {
				width:100%;
				padding-bottom:1px;
				margin-bottom:1px;
				
			}
		
			#container {
				margin: auto;
				text-align: center;
				
			}			
			#imgbox{
				
				width:1000px;
				text-align: center;
			
				
			}	
			.pimgbar{
				background-color: white;
				outline:0;
				border:0;
				}
		
		
			.col{
				vertical-align: -7px;
			
			}
				
				#popupview{
				margin-top: 10px;
				text-align: center;
				width: 300px;
		     	}
		     	
		     	#popupview2{
		     	margin-top: 10px;
				text-align: center;
				width: 300px;
		     	}
			
			
			
			.p{
				display:none;
			}
			.btnpop{
			margin-top: 15px;
			margin-left: 10px;
			border: 0;
			}
			
			
			/*           popview                     */
				
			
			
				
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
			
			
			
		
			#popchat{
			position:absolute;
			right: 0;
		    height:100%;
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
			
			#chatwritebox{ 
			background-color: red;
			
		
			
			 
			}
			
			
			#chatWrite{
			 width:100%;
			 position: absolute;
			 bottom: 0px;
			/*  margin-left: 650px; */
			 margin-left: -10px;
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
		 
		.titlememo{
		position:absolute;
		float: top;
		}
		 
		 
		
		#textmemo{
	
		border: 0;
		width: 1;
		height: auto;
		}
		
	  
	  .texta {
      width: 320px;
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
		
		
		#pagin{
		text-align: center;
		margin-top: 100px;
		}
		
		
  		 #footer{
        text-align: center;
        margin-top: 100px;        
        width:50%;    
        }
					
		</style>		
	</head>
	<body>
	
	
	
		 <div id="header">
       		<jsp:include page="Header.jsp" /> 
    	</div> 
    
	
		
		
		
		<div id="profile">
		  
		  <div class="box" style="background: #BDBDBD;"> 
		  <!-- 프로필 사진  -->
			
		 <img class="profile" src="user/<%=session.getAttribute("sessionID") %>/<%=member.getPicture() %>"  onerror="this.src='img/profile.jpg'" /> 
			  
		  </div>
				<h4><strong><%=session.getAttribute("sessionID") %></strong></h4>
			</div>
		
			
			 <div class="profilebar">
				
				<span class="col">
				<input type="checkbox" id="popup">
				<label for="popup" class="lb" name="1"><p class="p">1</p></label>
				<div>
					<div>
					<label for="popup"></label>
					
					
					<div id="popupview" >
						<form action="uploadOk" method="post" enctype="multipart/form-data">
							<h2>게시글을 만들기</h2>
							<hr class ="own">
						 
						    <textarea name="memo" id="memo" class="form-control" cols="30" rows="5" placeholder="내용을 입력하세요"></textarea><br />
							<input type="file" class="btn btn-info" class="form-control"  name="filename" placeholder="사진을 선택해주세요"><br />
							<input type="submit" class="btn btn-success" value="File Upload">
							</form>
							</div>
						
					</div>
					<label for="popup"></label>
				</div>
				
			    </span>
			    	    

	    <button id="lockBtn" class="pimgbar" onclick="changeView1(1)"><img src="img2/lock.jpg" alt="잠금"></button>
		<button id="searchBtn" class="pimgbar" onclick="showhide();"><img src="img2/search.jpg" alt="찾기"></button>	
		
		<button id="settingBtn" class="pimgbar" onclick="changeView1(3)"><img src="img2/setting.jpg" alt="설정"></button>		
		  		
		  </div>
		  
			
			
			
			<div id ="searchview" class="search" style="display:none">
		    <select style="display:none" name="searchType" >

		      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
		    </select>
		
		    <input type="text" class="search_input" name="keyword" id="keywordInput" value="${scri.keyword}"/>
		
		    <button id="listsearchBtn" type="button">></button>
		    
		    <script>
		      $(function(){
		        $('#listsearchBtn').click(function() {
		          self.location = "MyProfile" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      });   
		    </script>
		    
		    <script>

			   $(function(){
				$("#searchBtn").click(function (){
					$("#searchview").toggle();
				});
				});

     	    </script>	
		    
		    
		    
		  </div>
			
				
			<hr class="own"></hr>

 
    		 <div id="imgbox">
    		 
    	 
 		  
 		     <c:forEach var="dto" items="${ clist }" >
			  
			  
			  
			  <a href="MyProfileView?board_no=${dto.board_no}&writer=${dto.id}" class="titlememo"> ${dto.memo}</a>
			  
			  
			
		  	 <button class="btnpop" ><img src="user/${dto.id}/${ dto.picture }" width="260" height="280"></button>
		  	        
			   <!-- 다중 팝업 사용 -->			
			   <!-- 첫 번째 Modal -->
			   <div class="modal">
			    <span class="close">&times;</span>
			   
			     <!-- 팝업 Modal의 내용 -->
			     <div class="modal-content">
			      
			      
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
					
					
					<!-- 댓글내용  -->
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
					       
					       <!-- 수정  -->
					        <div class="container">
						        <div class="commentList"></div>
						    </div>



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

						String user_id = (String)pageContext.getAttribute("user_id");
						
						%>
					 
					   
					    <%			  
							if(session.getAttribute("sessionID").equals(user_id)){
						%> 
				        
						<div class="ssettingbox">
							       
				       		 		 <button class="updatebtn btn btn-info"  >댓글수정</button>
				       		 		
				            		 <div class="upmodal">
				            		 
								     <!-- 첫 번째 Modal의 내용 -->
								     <div class="upmodal-content">
								       <span class="upclose"></span>    
								       
								       <form action="ReplyUpdateAction">                    
								       <textarea name="content" id="memo" class="form-control" cols="30" rows="5" placeholder="수정할 내용을 입력하세요"></textarea><br />
								       <input type="hidden" name="board_no" value="${rdto.board_no}"/>
								       <input type="hidden" name="reply_no" value="${rdto.reply_no }" />
								       <input type="submit" class="btn btn-success" value="댓글수정">
								       </form> 
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
				  	  
			</div>
		     
		      
		       
		      	
			</c:forEach> 		
		</div>	
		
		
		
		

	

		
		<div id="pagin">
		
		<div class="w3-bar w3-small">
		  <c:if test="${pageMaker.prev}">
	    	<a href="MyProfile${pageMaker.makeSearch(pageMaker.startPage - 1)}" class="w3-button">&laquo;</a>
	    </c:if>
		 
		 <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idex">
	    	<a href="MyProfile${pageMaker.makeSearch(idex)}" class="w3-button">${idex}</a>
	    </c:forEach>
		 
		  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<a href="MyProfile${pageMaker.makeSearch(pageMaker.endPage + 1)}" class="w3-button">&raquo;</a>
	    </c:if> 
		</div>
		</div>
		
		
	<div id="footer">
  		 
   		<a href="Introduce">소개 </a>| <a href="Infomation">고객센터 </a>| <a href="Location">위치 </a>
  		
    </div>
        
  
		<!--                          쓰기 팝업창                           -->
			
		<!-- 사진 부분 -->
		<!-- body태그 뒤에서 script를 넣는 이유 -->
		<!-- 문서객체를 로딩후에 호출한다. -->
	<!-- 	<script src="js/jquery-2.2.4.min.js"></script>
		 <script src="js/jquery.vgrid.min.js"></script>
		<script>
			$("#container").vgrid(
				{ 
					// Key-Value 객체로 값을 넣어준다.
					time: 400, //애니메이션 실행 시간
					delay: 30, //애니메이션 지연 시간
					wait: 500 //애니메이션 대기 시간
					
				}
			);
		</script> --> 
		
		
		
	
		
	 <script>
	// Modal을 가져옵니다.
	var modals = document.getElementsByClassName("modal");
	// Modal을 띄우는 클래스 이름을 가져옵니다.
	var btns = document.getElementsByClassName("btnpop");
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
	  if (event.target.className == "modal") {
	      event.target.style.display = "none";
	  }
	  if (event.target.className == "mdal") {
	      event.target.style.display = "none";
	  }
	  if (event.target.className == "mmodal") {
	      event.target.style.display = "none";
			  }
			};

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
   	
 
	</body>
</html>