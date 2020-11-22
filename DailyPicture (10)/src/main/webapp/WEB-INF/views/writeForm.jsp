<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 양식</title>
<style type="text/css">


		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px solid skyblue;
			vertical-align : middle;
			margin-higth: 30px;
		}
		
		td{
			border:1px solid skyblue
		}
		
		#title{
			background-color:skyblue
		}
	</style>	
<!-- writeForm.jsp -->
</head>
<body>
	<table width="200" cellpadding="0" cellspacing="0" border="1" >
		<form action="write" method="post">
			<h1>글을 작성해주세요.</h1>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" size="80"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" size="80"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="content" size="80"></td>
			</tr>
			<tr>
				<td><input type="submit" value="입력"></td>
				<td><a href="list">목록보기</a></td>
			</tr>
		</form>
		
	</table>
</body>
</html>