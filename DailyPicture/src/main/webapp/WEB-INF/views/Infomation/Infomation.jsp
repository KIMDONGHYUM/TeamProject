<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dto.DpNoticeDto" %>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	
	<% ArrayList<DpNoticeDto> list = (ArrayList<DpNoticeDto>)session.getAttribute("list"); %>
	
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
      		padding:10px;
      }
      
      #noticetable td {
      		text-align: center;
      		padding:10px;
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
	    			<tr><td><h3><b><a href="Infomation">공지사항</a></b></h3></td></tr>
	    			<tr><td><a href="Question">자주하는 질문</a></td></tr>
	    			<tr><td><a href="1on1">1대1 문의</a></td></tr>
    			</table>
    		</div>
    		
    		<div id="notice">
    			<h4><b>공지사항</b></h4>
    			<table id="noticetable" width="500" cellpadding="0" cellspacing="0" border="5">
    				<tr>
	    				<th style="width:60px;">번호</th>
	    				<th style="width:500px;">제목</th>
	    				<th style="width:90px;">작성자</th>
	    				<th style="width:150px;">작성일</th>
	    				<th style="width:60px;">조회</th>
    				</tr>
    				<c:forEach var="dto" items="${ list }" >
	    				<tr>
	    				<td>${dto.board_no}</td>
	    				<td><a href="view_notice?board_no=${ dto.board_no }">${dto.title}</a></td>
	    				<td>${dto.writer}</td>
	    				<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${dto.reg}"/></td>
	    				<td>${dto.hit}</td>
	    				</tr>
	        		</c:forEach>	
    			</table>
    				
    		</div>
    	</div>
    	
</body>
</html>