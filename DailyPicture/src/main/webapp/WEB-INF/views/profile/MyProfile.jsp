
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<%@ page import="com.study.springboot.dto.MyctDto" %>
<%@ page import="com.study.springboot.dto.MemberDto" %>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>

<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport;" content="width=device-wdidth; init-scale=1.0; user-scaclable=no">
     	<title>vGrid 플러그인</title>
     	
     	<%
		ArrayList<MyctDto> clist = (ArrayList<MyctDto>)session.getAttribute("clist");
     	
     
     	%>
     	
     <%-- 	<% 
     	ArrayList<ReplyDto> rlist = (ArrayList<ReplyDto>)session.getAttribute("rlist");
     	%> --%>
     	

     	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	   
	    	
     	<%
     	 MemberDto member = (MemberDto)session.getAttribute("memberInfo"); 
	   
     	%>
	    
	<link rel="stylesheet" type="text/css" href="css/stylepop.css">
	<link rel="stylesheet" type="text/css" href="css/modelpopup.css">
	<link rel="stylesheet" type="text/css" href="css/modelpopupp.css">
	
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
	
	<script> 
	 document.getElementById('update').submit(); 
	</script> 
	
	
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
				width:800px;
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
			margin-top: 10px;
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
    
		  
		
		<div id="profile">
		  
		  <div class="box" style="background: #BDBDBD;"> 
		  <!-- 프로필 사진  -->
			
			<img class="profile" src="user/<%=session.getAttribute("sessionID") %>/<%=member.getPicture() %>"  onerror="this.src='img/profile.jpg'" />
			  
		  </div>
				<h4><strong><%=session.getAttribute("sessionID") %></h4>
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
		<button id="searchBtn" class="pimgbar" onclick="changeView1(2)"><img src="img2/search.jpg" alt="찾기"></button>	
		<button id="settingBtn" class="pimgbar" onclick="changeView1(3)"><img src="img2/setting.jpg" alt="설정"></button>
				
		  		
		  </div>
		  <hr class ="own"></hr>
		  
		 
		 
	<!--            게시글팝업                          -->
	
    		
    		 <div id="imgbox">
		
 		     <c:forEach var="dto" items="${ clist }" >
			
			
			 <div class="gallerylist">
			  
			  
			  <a href="MyProfileView?board_no=${dto.board_no}"> ${dto.memo} </a>
		  	 <button class="btnpop" ><img src="user/${dto.id}/${ dto.picture }" width="250" height="250"></button>
			 
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
			  		 
				 </div>
				  	  
			</div>
		      
		      
		      
		      </div>	
			</c:forEach> 		
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
		 
		 
		



		<!--                          쓰기 팝업창                           -->
			
		<!-- 사진 부분 -->
		<!-- body태그 뒤에서 script를 넣는 이유 -->
		<!-- 문서객체를 로딩후에 호출한다. -->
		<script src="js/jquery-2.2.4.min.js"></script>
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
		</script>
		
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
    
    
    
    
    
    
    <script>
            function buttonno(){
            	 alert('취소 되었습니다.');
            	 window.location.reload();

                 }
           
        </script>
     
    
	
	
   
	</body>
</html>