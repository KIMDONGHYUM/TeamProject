<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="com.study.springboot.dto.SimpleBbsDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- list.jsp -->
<title>SimpleBBS 게시판 리스트</title>
<style type="text/css">


		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px solid skyblue;
		}
		
		td{
			border:1px solid skyblue
		}
		
		#title{
			background-color:skyblue
		}
	</style>	
</head>
<body>
	<h2>SimpleBBS 게시판 리스트</h2>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="dto" items="${list1}" >
			<tr>
				<td>${dto.id}</td>
				<td>${dto.writer}</td>
				<td> <a href="view?id=${dto.id}"> ${dto.title} </a> </td>
				<td> <a href="delete?id=${dto.id}"> 삭제버튼 </a> </td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<h3> <a href="writeForm">글작성</a> </h3>

</body>
</html>





