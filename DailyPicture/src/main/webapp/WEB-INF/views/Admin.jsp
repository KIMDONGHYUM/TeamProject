<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dto.MemberDto" %>
<%@ page import="com.study.springboot.dto.ReplyDto" %>
<%@ page import="com.study.springboot.dto.DpReasonDto" %>
<%@ page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	<% 
	   List<MemberDto> userlist = (List<MemberDto>)session.getAttribute("userlist");
	   List<ReplyDto> SingoList = (List<ReplyDto>)session.getAttribute("SingoList");
	   List<DpReasonDto> reasonlist = (List<DpReasonDto>)session.getAttribute("reasonlist");
	%>
	<script>
		function ChangeView(value) {
			if(value== "0") {
				location.href="write_1on1";
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
  
       #btns {
       		padding-top: 10px;
       		text-align:end;
       }
       
       #list{
      	   
       		width: 200px;
            height: 300px;
            text-align: end;
            padding-top: 60px;
            padding-right: 80px;
       }
       #noticetable{
      		border: 5px solid  rgb(214, 206, 206);
            display: inline-block;
            width: auto;
            height: auto;
            overflow: auto;
      }
      
      #noticetable th {
      		text-align: center;
      		padding:10px;
      }
      
      #noticetable td {
      		text-align: center;
      		padding:10px;
      }
      ::-webkit-scrollbar {
  			width: 6px;
		}
	
	#singotable{
      		border: 5px solid  rgb(214, 206, 206);
            display: inline-block;
            height: auto;
            width: auto;
            overflow: auto; 
      }
      #singotable th {
      	text-align: center;
      	padding:10px;
      }
      #singotable td {
      	text-align: center;
      	padding:10px;
      }
</style>

</head>
<body>
		<div id="header">
       		<jsp:include page="Header.jsp" /> 
    	</div> 
    	
    	<h1 style="padding-left:80px;"><b>관리자 페이지</b></h1>
    	
    	<div id="wrapper">
    		<div id="notice">
    			
    			<h3><b>유저목록</b></h3>
    			<table id="noticetable" width="500" cellpadding="0" cellspacing="0" border="5">
    				<tr>
	    				<th style="width:100px;">이름</th>
	    				<th style="width:200px;">아이디</th>
	    				<th style="width:500px;">비밀번호</th>
	    				<th style="width:200px;">전화번호</th>
	    				<th style="width:200px;">이메일</th>
	    				<th style="width:400px;">가입일자</th>
	    				
	    				
    				</tr>
    				<c:forEach var="dto" items="${ userlist }" >
	    				<tr>
	    				<td>${dto.name}</td>
	    				<td>${dto.id}</td>
	    				<td>${dto.password }</td>
	    				<td>${dto.phone}</td>
	    				<td>${dto.mail}</td>
	    				<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${dto.reg}"/></td>
	    				</tr>
	        		</c:forEach>	
    			</table>
    			<br><br>
    			<h3><b>신고 내역</b></h3>
    			<table id="singotable" width="500" cellpadding="0" cellspacing="0" border="5">
    				<tr>
	    				
	    				<th style="width:200px;">신고당한 아이디</th>
	    				<th style="width:500px;">신고 댓글 내용</th>
	    				<th style="width:500px;">댓글 신고일자</th>
	    				<th style="width:200px;">아이디 정지</th>
	    				
    				</tr>
    				<c:forEach var="sdto" items="${ SingoList }" varStatus="status">
    					
	    					<tr>
	    					<form action="SingoDeleteAction" method="post" onsubmit="return Check()">
	    						<input type="hidden" name="board_no" value="${sdto.board_no }">
	    						<input type="hidden" name="user_id" value="${sdto.user_id }">
	    						<input type="hidden" id="content" name="content" value="${sdto.content }">
			    				<td>${sdto.user_id}</td>
			    				<td>${sdto.content}</td>
			    				<td><fmt:formatDate pattern="yyyy년 MM월 dd일, kk시 mm시 ss초" value="${sdto.reg}"/></td>
			    				<td><input type="submit" class="btn btn-outline-danger" value="정지" ></td>
			    			</form>
			    			</tr>
		    			
		    				
	    				
	        		</c:forEach>	
    			</table>
    			<br><br>
    			<h3><b>탈퇴 사유</b></h3>
    			<table id="singotable" width="500" cellpadding="0" cellspacing="0" border="5">
    				<tr>
	    				
	    				<th style="width:200px;">탈퇴 아이디</th>
	    				<th style="width:500px;">탈퇴 사유</th>
	    				<th style="width:500px;">기타 의견</th>
	    				<th style="width:200px;">등록일</th>	
    				</tr>
    				<c:forEach var="rdto" items="${ reasonlist }">    					
	    					<tr>
	    						<td>${rdto.id }</td>
			    				<td>${rdto.reason}</td>
			    				<td>${rdto.opinion}</td>
			    				<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${rdto.reg}"/></td>			    				
			    			</tr>
	        		</c:forEach>	
    			</table>
    		</div>
    		
    	</div>
    	
</body>
</html>