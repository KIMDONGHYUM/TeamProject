
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
		ArrayList<MyctDto> cclist = (ArrayList<MyctDto>)session.getAttribute("cclist");
     	
     
     	%>
     	
     	
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
				location.href="MyProfile"
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
			   /*  border: solid red 1px;    */
			
				
    		  }
    		  
          #subbody{
            margin-top:-19px;
            padding-top:30px;
            background-color: rgb(239, 237, 237);
        
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
       .own {
          width:2000px;
          color:gray; 
          border: thin solid rgb(240, 231, 231);
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
            margin-top: 200px;
         
            
        }
		
	
			#container {
			    margin-left: 3%;
			    margin-top: -60px;
			   
				text-align: center;
				
			}			
			#imgbox{
				
				padding-top: -200px;
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
		margin-top: 140px;
		}
		
		 }
        
		
		
  		 #footer{
        text-align: center;
        margin-top: 80px;        
        width:50%;    
        }
					
		</style>		
	</head>
	<body>
	
	
	
		 <div id="header">
       		<jsp:include page="Header.jsp" /> 
    	</div> 
    
	
		
	<div id="subbody">	
		
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
			    	    

	    <button id="lockBtn" class="pimgbar" onclick="changeView1(1)"><img src="img2/unlock.jpg" alt="잠금" style="width:0.5"></button>
		<button id="searchBtn" class="pimgbar" onclick="showhide();"><img src="img2/search.jpg" alt="찾기"></button>	
		
		<button id="settingBtn" class="pimgbar" onclick="changeView1(3)"><img src="img2/setting.jpg" alt="설정"></button>		
		  		
		  </div>
		  
			
			
			
			<div id ="searchview" class="search" style="display:none">
		    <select style="display:none" name="searchType" >

		      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
		    </select>
		
		    <input type="text" class="search_input" name="keyword" id="keywordInput" value="${scri.keyword}"/>
		
		    <button id="listsearchBtn" type="button">></button>
		    
	    
		  </div>
			
				
			
	 
 
    		 <div id="imgbox" style="margin-top:50px">
    		  
    		  <div id="container">
	
    			  
 		     <c:forEach var="dto" items="${ cclist }" >
			  
			  
			  <div class="gallerylist">
				<ul>
					<li>
						<a href="MyProfileView?board_no=${dto.board_no}&writer=${dto.id}">
							<div class="screen">
								<div class="top">${dto.memo}</div>
								<div class="bottom">DAILYPICTURE</div>
								<img src="user/${dto.id}/${ dto.picture }" >
							</div>
							
						</a>
					</li>
			  </ul>	
			</div>
			
			  
		  	        
			 

			</c:forEach> 	
			  </div>
			
			
		</div>	
		
		
		
		

	

		
		<div id="pagin">
		
		<div class="w3-bar w3-small">
		  <c:if test="${pageMaker.prev}">
	    	<a href="MyProfileSecret${pageMaker.makeSearch(pageMaker.startPage - 1)}" class="w3-button">&laquo;</a>
	    </c:if>
		 
		 <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idex">
	    	<a href="MyProfileSecret${pageMaker.makeSearch(idex)}" class="w3-button">${idex}</a>
	    </c:forEach>
		 
		  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<a href="MyProfileSecret${pageMaker.makeSearch(pageMaker.endPage + 1)}" class="w3-button">&raquo;</a>
	    </c:if> 
		</div>
		</div>
		
		
	<div id="footer">
  		 
   		<a href="Introduce">소개 </a>| <a href="Infomation">고객센터 </a>| <a href="Location">위치 </a>
  		
    </div>
        
</div> 
  
  
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
		      $(function(){
		        $('#listsearchBtn').click(function() {
		          self.location = "MyProfileSecret" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
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
	
			};

    </script>
    
    
     
						
   	
 
	</body>
</html>