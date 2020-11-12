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
<title>고객센터</title>
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
        	padding: 80px;
        	
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
      		border: 5px solid  rgb(214, 206, 206);
      }
      #noticetable th {
      		text-align: center;
      		padding: 20px;
      		width:100px;
      }
      
      #noticetable td {
      		text-align: center;
      }
       
      #con {
      		padding-top:20px;
      		
      }
</style>
</head>
<body>
		<div id="header">
       		<jsp:include page="Header.jsp" /> 
    	</div> 
    	
    	<div id="wrapper">
    		<div id="title">
    		
    			<table id="list">
	    			<tr><td><h2><b>고객센터</b></h2></td></tr>
	    			<tr><td><a href="Infomation">공지사항</a></td></tr>
	    			<tr><td><h3><b><a href="Question">자주하는 질문</a></b></h3></td></tr>
	    			<tr><td><a href="1on1">1대1 문의</a></td></tr>
    			</table>
    		</div>
    		
    		<div id="notice">
    			<h4><b>자주하는질문</b></h4>
    			<table id="noticetable" width="500" cellpadding="0" cellspacing="0" border="5">
    			<input type="hidden" name="board_no" value="${ view_question.board_no } ">
    				<tr>
	    				<th>제목</th><td>${view_question.title}</td>
	    			</tr>
	    			<tr>	
	    				<th>작성자</th><td>${view_question.writer}</td>
	    			</tr>	
	    			<tr>	
	    				<th>작성일</th><td><%=year+"년 "+month+"월 "+day+"일" %></td>
	    			</tr>
    				<tr>
    					<th>내용</th><td id="con">${view_question.content}</td>
    				</tr>
    				
	        			
    			</table>
    			<div id="btns">
    				<button class="btn btn-primary" onclick="ChangeView(0)">목록</button>
    				
				</div>    		
    		</div>
    	</div>
    	
</body>
</html>