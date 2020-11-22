<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dto.Dp1on1Dto" %>
<%@ page import="com.study.springboot.dto.ReplyDto" %>
<%@ page import="com.study.springboot.dto.MemberDto" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	<% Dp1on1Dto view_1on1 = (Dp1on1Dto)session.getAttribute("view_1on1"); 
	   List<ReplyDto> rlist = (List<ReplyDto>)session.getAttribute("rlist");
	   MemberDto mdto = (MemberDto)session.getAttribute("mdto");
	%>
	
<style>

 		 * {
			margin:0 auto;
			padding:0;
			max-width:100%;
     		}
     		 
	#header {
            background-color: white;
            vertical-align: top;
            margin-top: -5px;
            margin-left: -5px;
            margin-right: -10px;
            padding-top: 40px;
            text-align: center;
        	}
        	
 	   .own {
            width:2000px;
            color:gray; 
            border: thin solid rgb(240, 231, 231);
        	}
        
   #wrapper {padding: 30px;}  
        	     	                
     #title {
        	width:200px;
        	height:100%;
        	position:fixed;
        	padding-left: 80px;
        	text-align:end;
        	}
        	
   #title a {
        	text-decoration: none;
        	padding-top:40px;
        	}
        	
      table {
        	width:800px;
        	height: auto;
        	}
        	
      #btns {
       		padding-top: 10px;
       		padding-left:65%;     		
       		}
       
      #list {    	   
       		width: 160px;
            height: 300px;
            text-align: end;
            padding-top: 60px;
            padding-right: 80px;
      		}
      
#noticetable {
      		border: 3px solid  rgb(214, 206, 206);
      		border-top:none;
      		border-right:none;
      		border-left:none;
      		border-bottom:none;
      		border-collapse:collapse
      		}
      		
#noticetable th {
      		text-align: center;
      		padding: 20px;
      		width:100px;
      		}   
      
      #con {
      		padding-top:40px;
      		padding-bottom:40px;
      	   }
      	   
  .profile {
			width: 33px;
    		height: 32px; 
    		border-radius: 70%;
			border:solid rgb(153, 243, 18) 2px;
			float:left;
			margin-right:8px;
			}
			
#writerprofile {
	   		width: 33px;
    		height: 32px; 
    		border-radius: 70%;
			border:solid rgb(153, 243, 18) 2px;
			text-align:end;
			margin-right:3px;
	   }
	   
	  #con {font-size:20px;}
			
#oneononecomment {
	  		padding-top:40px;
	  		padding-left:20px;
	  		}
	  	  
#commentbox {	  	
		  	padding-top:50px;
		  	padding-left:350px;
	  		}
	  		
#commentinsert{
		  	padding-top:50px;
		  	padding-left:320px;
	  		}
	  		
#commentinsert input[type="text"] {height:50px;}
	  			  	
   #topMenu {
      		padding-top:30px;
      		height: 30px;
      		width: 850px;
      		padding-bottom:80px;
     	    }
     	    
#topMenu ul li {
      		list-style:none;
      		background-color: rgb(230, 227, 227);
      		float: left;  
      		line-height: 50px;
      		vertical-align: middle;
      		text-align: center;
      		}
      		
#topMenu .menuLink {
      		text-decoration:none;
      		color:white;
      		display:block;
      		width:280px;
      		font-size:15px;
      		font-weight: bold;		
      		}
      		
#topMenu .menuLink:hover {
      		color: black;
      		background-color:white;
      		}
      
</style>

<script>
		function formSubmit(reply_no){
			document.getElementById("reply_no"+reply_no).action = "DeleteCommentAction";
	        document.getElementById("reply_no"+reply_no).submit();
		}
</script>
</head>
<body>
		<div id="header">
       		<jsp:include page="Header.jsp" /> 
    	</div> 
    	<nav id="topMenu">
    		<ul>
	    		<li><a class="menuLink" href="Infomation">공지사항</a></li>
	    		<li><a class="menuLink" href="Question">자주하는 질문</a></li>
	    		<li><a class="menuLink" href="1on1">1대1 문의</a></li>
    		</ul>
    	</nav>
    	<div id="wrapper">   		
    		
    		<form action="Delete1on1Action" method="post">
	    		<div id="notice">
	    			
	    			<table id="noticetable" width="500" >
	    				<input type="hidden" name="board_no" value="${view_1on1.board_no}">
		    				<tr>	
		    					<td style="font-size:50px; text-align:start"><b>${view_1on1.title}</b></td>
			    				
			    				<td style="text-align:end; font-size:15px;">
				    				<img id="writerprofile" src="user/${mdto.id}/${mdto.picture}"  onerror="this.src='img/profile.jpg'" >
				    				<b>${view_1on1.writer}</b><br>
				    				<fmt:formatDate pattern="yyyy.MM.dd kk:mm" value="${view_1on1.reg }"/>
			    				</td>		    				
			    			</tr>		    			    			
	    				<tr>
	    					<td id="con">${view_1on1.content}</td>
	    				</tr>   				    								  	
		        			
	    			</table>
		    				<div id="btns">
			    				<input type="button" class="btn btn-outline-primary" value="목록" onclick="javascript:window.location='1on1'">
			    				<input type="button" class="btn btn-outline-success" onclick="javascript:window.location='modify_1on1'" value="수정">
			    				<input type="submit" class="btn btn-outline-danger" value="삭제">
		    				</div>  
	    		</div>
    		</form>  		
    		 		   			
    			<div id="commentinsert">
		    		<form action="ReplyInsertAction" method="post">
		    			<input type="hidden" name="board_no" value="${ view_1on1.board_no } ">
		    			<input type="text" size="100px" name="content">
		    			<input type="submit"  class="btn btn-light" value="댓글 등록">
		    		</form>
    			</div>
    			
    			<div id="commentbox">
		    		<c:forEach var="rdto" items="${rlist }" varStatus="status">
		    			
		    			<!-- jstl에 있는 변수를 스크립틀릿에서 사용할 수 있게 바꾼다. -->
							<c:set var="user_id" value="${rdto.user_id}" ></c:set>	
							<% String user_id = (String)pageContext.getAttribute("user_id"); %>
	
		    			<form action="DeleteCommentAction" method="post">
			    			<img class="profile" src="user/${rdto.user_id}/${rdto.picture}"  onerror="this.src='img/profile.jpg'" >
			    			<b>${rdto.user_id }</b>      
			    				${rdto.content }
			    					<br>
			    						<fmt:formatDate pattern="yyyy.MM.dd hh:mm" value="${rdto.reg }"/>
			    							<input type="hidden" id="reply_no" name="reply_no" value="${rdto.reply_no }">
								    			<% if(session.getAttribute("sessionID").equals(user_id)) {%>		    						    		
								    				<input type="submit" class="btn btn-outline-warning" value="댓글삭제" ${status.count }> <!-- 버튼에 숫자를 지정해주지 않아서 처음꺼가 삭제된 것, 버튼에 숫자 지정해줄것 -->
								    			<%}%>
			    									<br><br>
		    			</form>		    		
		    		</c:forEach>
    		</div>
    			
    			
    		
    		
    	</div>
    	
</body>
</html>