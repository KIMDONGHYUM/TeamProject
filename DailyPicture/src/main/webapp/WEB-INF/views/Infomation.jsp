<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	<script>
		function ChangeView(value) {
			if(value== "0") {
				location.href="write_view";
				}
			else if(value=="1") {
				location.href="modifyqna";
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
        	border: 1px solid red;
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
       
</style>
</head>
<body>
		<div id="header">
       		<jsp:include page="Header.jsp" /> 
    	</div> 
    	
    	<div id="wrapper">
    		<div id="title">
    			<h2><b>고객센터</b></h2>
    			<a href="Information">공지사항</a><br>
    			<a href="">자주하는 질문</a><br>
    			<a href="">1대1 문의</a>
    		</div>
    		
    		<div id="notice">
    			<h4><b>공지사항</b></h4>
    			<table width="500" cellpadding="0" cellspacing="0" border="5">
    				<tr>
	    				<th>번호</th>
	    				<th>제목</th>
	    				<th>작성자</th>
	    				<th>작성일</th>
	    				<th>조회</th>
    				</tr>
    				
    				<tr>
    				<td>1</td>
    				<td>1</td>
    				<td>1</td>
    				<td>1</td>
    				<td>1</td>
    				</tr>
	        			
    			</table>
    				<button class="btn btn-primary" onclick="ChangeView(0)">글작성</button>
    				<button class="btn btn-success" onclick="ChangeView(1)">글수정</button>
    				<button class="btn btn-danger" onclick="ChangeView(2)">글삭제</button>
    		</div>
    	</div>
    	
</body>
</html>