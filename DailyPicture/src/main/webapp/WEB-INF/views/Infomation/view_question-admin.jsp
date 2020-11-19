<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dto.DpQuestionDto" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	<% DpQuestionDto view_question = (DpQuestionDto)session.getAttribute("view_question"); 
	Date reg = view_question.getReg();
	int year = 2000;
	int month = 1;
	int day = 1;
	if(reg != null){
		Calendar cal = Calendar.getInstance();
		cal.setTime(reg);
		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH)+1;
		day = cal.get(Calendar.DAY_OF_MONTH);
	}
	
	%>
	<script>
		function ChangeView(value) {
			if(value== "0") {
				location.href="Question";
				}
			
			}
	</script>
<style>

 		 * {
			margin:0 auto;
			padding:0;
			max-width:100%;
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
            width:2000px;
            color:gray; 
            border: thin solid rgb(240, 231, 231);
        }
    .headerpicture{
            text-align: center;
        }
        
        #wrapper {
       
        	display:flex;
        	padding: 30px;
        	padding-bottom:200px;
        }
        
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
       		text-align:end;
       }
       
       #list{
      	   
       		width: 160px;
            height: 300px;
            text-align: end;
            padding-top: 60px;
            padding-right: 80px;
       }
      
      #noticetable{
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
      
      #noticetable td {
      		text-align: start;
      }
       
      #con {
      		padding-top:40px;
      		font-size:20px;
      		text-align:start;
      }
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
    		<div id="title">
    		
    		<!--	<table id="list">
	    			<tr><td><h2><b>고객센터</b></h2></td></tr>
	    			<tr><td><a href="Infomation">공지사항</a></td></tr>
	    			<tr><td><h3><b><a href="Question">자주하는 질문</a></b></h3></td></tr>
	    			<tr><td><a href="1on1">1대1 문의</a></td></tr>
    			</table>-->
    		</div>
    		
    		<form action="DeletequestionAction" method="post">
    		<div id="notice">
    			
    			<table id="noticetable" width="500" >
    			<input type="hidden" name="board_no" value="${ view_notice.board_no } ">
    			
    				<tr>
	    				<td style="font-size:50px; text-align:start"><b>${view_question.title}</td>
	    			</tr>
	    			<tr>	
	    				<td style="text-align:end; padding-top:10px; font-size:15px;"><%=year+"년 "+month+"월 "+day+"일"%></td>
	    			</tr>
 	    			
    				<tr>
    					<td id="con">${view_question.content}</td>
    				</tr>
    				
	        			
    			</table>
    			<div id="btns">
    				<input type="button" class="btn btn-outline-primary" value="목록" onclick="javascript:window.location='Question'">
    				<input type="button" class="btn btn-outline-success" onclick="javascript:window.location='modify_question'" value="수정">
    				<input type="submit" class="btn btn-outline-danger" value="삭제">
				</div>    		
    		</div>
    		</form>
    	</div>
    	
</body>
</html>