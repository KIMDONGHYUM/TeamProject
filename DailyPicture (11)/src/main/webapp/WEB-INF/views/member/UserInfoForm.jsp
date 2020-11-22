<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.study.springboot.dao.IMemberDao" %>    
<%@ page import="com.study.springboot.dto.MemberDto" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>

<%
	// MemberInfoAction에서 넘긴 회원정보를 추출한다.
	MemberDto member = (MemberDto)session.getAttribute("memberInfo");

	String email = member.getMail();
	
	Date birth = (Date)member.getBirth();
	int birthYear = 2000;
	int birthMonth = 1;
	int birthDay = 1;
	if( birth != null ) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(birth);
		birthYear = cal.get(Calendar.YEAR);
		birthMonth = cal.get(Calendar.MONTH);
		birthDay = cal.get(Calendar.DAY_OF_MONTH);
	}
%>


<html>
<head>
	<title>현재 유저정보 출력화면</title>
	
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
	
	<script type="text/javascript">
	
		function changeForm(val){
			if(val == "-1"){
				location.href="MainForm";
			}else if(val == "0"){
				location.href="MemberModifyFormAction";
			}else if(val == "1"){
				location.href="DeleteForm";
			}
		}
		
	</script>
	
</head>
<body>
		<br><br>
		<b><font size="6" color="gray">내 정보</font></b>
		<br><br><br>
						<!-- 가져온 회원정보를 출력한다. -->
		<table>
			<tr>
				<td id="title">아이디</td>
				<td><%=member.getId() %></td>
			</tr>
						
			<tr>
				<td id="title">비밀번호</td>
				<td><%=member.getPassword() %></td>
			</tr>
					
			<tr>
				<td id="title">이름</td>
				<td><%=member.getName() %></td>
			</tr>
					
			<tr>
				<td id="title">성별</td>
				<td><%=member.getGender()%></td>
			</tr>
					
			<tr>
				<td id="title">생일</td>
				<td>
					<%=birthYear %>년 
					<%=birthMonth %>월 
					<%=birthDay %>일
				</td>
			</tr>
					
			<tr>
				<td id="title">이메일</td>
				<td>
					<%=email %>
				</td>
			</tr>
					
			<tr>
				<td id="title">휴대전화</td>
				<td><%=member.getPhone() %></td>
			</tr>
			<tr>
				<td id="title">주소</td>
				<td>
					<%=member.getAddress() %>
				</td>
			</tr>
		</table>
		
		<br>
		<input type="button" value="뒤로" onclick="changeForm(-1)">
		<input type="button" value="회원정보 변경" onclick="changeForm(0)">
		<input type="button" value="회원탈퇴" onclick="changeForm(1)">
</body>
</html>