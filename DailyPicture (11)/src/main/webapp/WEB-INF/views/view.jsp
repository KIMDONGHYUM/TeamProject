<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 내용 보기</title>
<!-- view.jsp -->
</head>
<body>

내용보기 <br>
<hr>

작성자 : ${ dto.board_no } <br>
제목 : ${ dto.memo } <br>
내용 : ${ dto.id } <br>
<hr>

<br>
<a href="list">목록보기</a>

</body>
</html>




