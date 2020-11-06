<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  


  
  <style>
        
        
      

        #logo{
            margin-top: 80px;
            text-align:center;
            max-width:100%;
        }

       


        #login{
            margin-top: 100px;
            margin: 100px;
            padding: 20px;
            text-align:center;
            
        }
        #inputPassword{
        margin:0 auto;
        margin-top: 30px;
            
        }

        #inputId{
            margin:0 auto;
        }
        
    
        .form-control{
            width:500px;
         
        }

        .col{
            text-align: center;
        }

       

    </style>
    <script type="text/javascript">
	
    function changeView(value){
  
    if(value == "1") //회원가입페이지 이동버튼
    {
        location.href="JoinForm";
        }
    }
    </script>
    
    <script>
		function checkValue() {
			//eval()함수 : 문자열을 코드로 변환해주는 함수
			//inputForm : 입력폼 문서객체
			var inputForm = eval("document.loginInfo");
			if(!inputForm.id.value)
			{
				alert("아이디를 입력하세요");	
				inputForm.id.focus();
				return false;//전송(통신) 안됨.
			}
			if(!inputForm.password.value)
			{
				alert("비밀번호를 입력하세요");	
				inputForm.password.focus();
				return false;//전송(통신) 안됨.
			}
			//통신 전송됨.
		}	
		function goFirstForm() {
			location.href = "MainForm";
		}
	</script>
</head>
<body>
	
		<%-- <div id="main">
			<jsp:include page="<%=contentPage%>" />
		</div>  --%>



    <div id="logo">
        <img src="img/logo.jpg" alt="logo">
        
    </div>

    <div id=login>
        <div class="row">
            <div class="col">
             
               <form name="loginInfo" method="post" action="MemberLoginAction" 
				onsubmit="return checkValue()">
				
                    <div class="form-group">
                      <input type="text" class="form-control" id="inputId" name="id" placeholder="아이디 입력" >
                   
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control" id="inputPassword" name="password" placeholder="비밀번호 입력" >
                    </div>
                    <div class="form-group form-check">
                      <label class="form-check-label" for="exampleCheck1">비밀번호를 잊으셨나요?</label>
                    </div>
                    <input type="submit" class="btn btn-primary" value="로그인"/>
                </form>
            </div>
        </div>

        <div class="Singup">
         <h4 style="color:blueviolet"><small>아이디가 없으신가요?</small></h4>
         <button id="singgupBtn" class="btn btn-success" onclick="changeView(1)">회원가입</button>
        </div>
        </div>
    
        <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script> -->
</body>
</html>
