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
				location.href="1on1";
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
	    			<tr><td><a href="Question">자주하는 질문</a></td></tr>
	    			<tr><td><h3><b><a href="1on1">1대1 문의</a></b></h3></td></tr>
    			</table>
    		</div>
    		
    		<div id="notice">
    			<h4><b>1대1 문의</b></h4>
    			<table id="noticetable" width="500" cellpadding="0" cellspacing="0" border="5">
    				<tr>
	    				<th>제목</th><td>df</td>
	    			</tr>
	    			<tr>	
	    				<th>작성자</th><td>sd</td>
	    			</tr>	
	    			<tr>	
	    				<th>작성일</th><td>as</td>
	    			</tr>
	    			<tr>	
	    				<th>조회</th><td>1</td>
    				</tr>
    				<tr>
    					<th>내용</th><td>ㅇㅇ</td>
    			
    				</tr>
    				
	        			
    			</table>
    			<div id="btns">
    				<button class="btn btn-primary" onclick="ChangeView(0)">목록</button>
    				
				</div>    		
    		</div>
    	</div>
    	
</body>
</html>