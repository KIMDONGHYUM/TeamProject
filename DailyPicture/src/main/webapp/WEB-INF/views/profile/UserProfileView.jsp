
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<%@ page import="com.study.springboot.dto.MyctDto" %>
<%@ page import="com.study.springboot.dto.MemberDto" %>
<%-- <%@ page import="com.study.springboot.dto.PageMaker" %> --%>


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
     
     	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	   
	    	
     	<%
     	 MemberDto member = (MemberDto)session.getAttribute("mdto");
     	%>
	    
	<link rel="stylesheet" type="text/css" href="css/stylepop.css">
		<link rel="stylesheet" type="text/css" href="css/modelpopup.css">
		<link rel="stylesheet" type="text/css" href="css/modelpopupp.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	    
	    <script type="text/javascript">
		
		function changeView1(value){
			
		if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
			{
				location.href="MyProfileSecret";
			}
		else if(value == "2")
		{
		    location.href="ModifyProfile";
		}
		
		}
	    </script> 
	    
	     
	     
	     
	     
	     
		<style>
			* {
				margin:0 auto;
				padding:0;
				max-width:100%;
			   /*  border: solid red 1px;    */	
    		}
    		
    		.headerpicture{
	            text-align: center;
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
			#follow_btn {
		        position:absolute;
		        margin-left:180px;
		        top:315px;
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
				
			.p{
				display:none;
			}			
					
			#pagin{
			text-align: center;
			margin-top: 140px;
			}
			
			#footer{
	            text-align: center;
	            margin-top: 100px;
	            margin-bottom: 30px;        
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
			
			<img class="profile" src="user/<%=member.getId()%>/<%=member.getPicture() %>"  onerror="this.src='img/profile.jpg" />
			  
		  </div>
		  		
				<h4><strong><%=member.getId() %></strong></h4> 
				</form>
			</div>
		
			
			 <div class="profilebar">
				
				
			<span class="col">
				
					<%
			// 사용자의 프로필일 경우
			if(session.getAttribute("sessionID").equals(member.getId())){ 
		%>
		
					<input type="checkbox" id="popup">
				<label for="popup" class="lb"><p class="p">1</p></label>
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
		<button id="settingBtn" class="pimgbar" onclick="changeView1(2)"><img src="img2/setting.jpg" alt="설정"></button>		
		  		
		  </div>
			

			<% }else{ //사용자가 아닌사람이 볼 경우 %> 
			   </span>
				<button id="searchBtn" class="pimgbar" onclick="showhide();"><img src="img2/search.jpg" alt="찾기"></button>
	            
	            <form action="FollowAction" method="post">
		  		<% String id= member.getId(); %>
		  		<input type="hidden" name="following" value=<%=id%> > <input type="submit" id="follow_btn" value="팔로우" class="btn btn-primary" style="" >
	             </form>
	             </div>
		<% } %>	
				
			
			
			 <div id ="searchview" class="search" style="display:none">
		    <select style="display:none" name="searchType" >
		      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
		    </select>
		    <input type="text" class="search_input" name="keyword" id="keywordInput" value="${scri.keyword}"/>
		    <button id="listsearchBtn" type="button">></button>
		 </div>
			
 
    	<div id="imgbox" style="margin-top:50px">   
    	    <div id="container">
    		   <c:forEach var="dto" items="${ clist }" > 
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
	    	<a href="UserProfileViewhref${pageMaker.makeSearch(pageMaker.startPage - 1)}" class="w3-button">&laquo;</a>
	      </c:if>
		 
		  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idex">
	    	 <a href="UserProfileView?id=${mdto.id}&UserProvfileView${pageMaker.makeSearch(idex)}"  class="w3-button">${idex}</a>
	      </c:forEach>
		 
		  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<a href="UserProfileView${pageMaker.makeSearch(pageMaker.endPage + 1)}" class="w3-button">&raquo;</a>	
	      </c:if> 
		 </div>
		</div>
	       		
		
	<div id="footer">
   		<a href="Introduce">소개 </a>| <a href="Infomation">고객센터 </a>| <a href="Location">위치 </a>
    </div>
        
     
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
   
 
 
	</body>
</html>