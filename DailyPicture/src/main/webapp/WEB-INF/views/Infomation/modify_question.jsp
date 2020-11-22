<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	<script src = "${path}/ckeditor/ckeditor.js"></script>
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
       
      #list {    	  
       		width: 160px;
            height: 300px;
            text-align: end;
            padding-top: 60px;
            padding-right: 80px;
       		}
      
#noticetable {border: 5px solid  rgb(214, 206, 206);}    		
      
#noticetable th {
      		text-align: center;
      		padding: 20px;
      		width:100px;
      		}
      
#noticetable td {
      		text-align: start;
      		padding-left:5%;
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
    		
    	<form action="modify_questionAction" method="POST" enctype="multipart/form-data">
    		<div id="notice">
    			<h4><b>자주하는 질문</b></h4>
    			
    			<table id="noticetable" width="500" cellpadding="0" cellspacing="0" border="5">
    				<input type="hidden" name="board_no" value="${ view_question.board_no } ">
	    				<tr>
		    				<th>제목</th><td><input type="text" size=70 name="title" value="${view_question.title }"></td>
		    			</tr>	    			
		    			<tr>	
		    				<th>카테고리</th>
			    				<td>
				    				<select name="category">
									        <option>업로드문의</option>
									        <option selected="selected">회원문의</option>
			   						 </select>
		   						 </td>
	    				</tr>
	    				<tr>
	    					<th>내용</th><td><textarea id = "editor4" name = "editor4" name="Upload" cols="80" rows="20" placeholder=${view_question.content }></textarea></td>
	    				</tr>	    					        			
    			</table>
    			<script>CKEDITOR.replace('editor4',{filebrowserUploadUrl:'/mine/imageUpload.do'});</script>
    			<div id="btns">
    				<input type="submit" class="btn btn-primary" value="게시">
    				<input type="button" class="btn btn-primary" value="취소" onclick="javascript:window.location='Question'">
    				
				</div>    		
    		</div>
    	</form>
    </div>
    	
</body>
</html>