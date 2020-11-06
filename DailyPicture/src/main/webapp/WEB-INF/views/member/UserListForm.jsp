<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dto.MemberDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.ArrayList"%>
<%
	
		ArrayList<MemberDto> list =	(ArrayList<MemberDto>)session.getAttribute("list");
     
	//ArrayList<MemberDto> list = new ArrayList<MemberDto>();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<style>
	table {
		border: 1px solid black;
		font-size: 12px;
	}
	td {
		border: 1px solid black;
		padding: 10px;
	}
</style>
</head>
<body>
	<h2>회원목록</h2>
	<div >
		<table style="margin: 0 auto;">
			<tr style="background-color: skyblue; color:black;">
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>성별</td>
				<td>생년월일</td>
				<td>메일</td>
				<td>전화번호</td>
				<td>주소</td>
				<!-- <td>가입일</td> -->
			</tr>
				<%
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr style="background-color: white;">
				<td><%=list.get(i).getId() %></td>
				<td><%=list.get(i).getPassword()%></td>
				<td><%=list.get(i).getName()%></td>
				<td><%=list.get(i).getGender()%>
				<td><%=list.get(i).getBirth()%>
				<td><%=list.get(i).getMail()%>
				<td><%=list.get(i).getPhone()%></td>
				<td><%=list.get(i).getAddress()%></td>
				<%-- <td><%=list.get(i).getReg()%></td> --%>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>