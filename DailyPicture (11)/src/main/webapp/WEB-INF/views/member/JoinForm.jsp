<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
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

        #inputId{
            margin-top: 30px;
        }
        #input_userId_cheeck{
            margin-top: 10px;
            margin-right: 200px;
            
        }
        

        #inputPassword{
       
        margin-top: 30px;
        }
        #inputPasswordcheck{
        margin-top: -10px;
        }
        
        
        #inputphone{
        
        margin-top: 30px;
        
        }
            
        

        #inputmail{

            margin-top: 30px;
        }

       
        
    
        .form-control{
            width:300px;
            margin:0 auto;
         
        }

        .col{
            text-align: center;
        }

       

    </style>
    
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	

	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue()
	{
		if(!document.userInfo.id.value){
			alert("아이디를 입력하세요.");
			return false; //submit 취소
		}
		
		var idChecked = $('#check_hidden').val();
		if( idChecked != "yes") {
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		
		if(!document.userInfo.password.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
	
	// 취소 버튼 클릭시 첫화면으로 이동
	function goFirstForm() {
		location.href="MainForm";
	}
	
	function idCheck() {
		var user_id = $('#input_userId').val();
		
		if(!user_id){
			alert("아이디를 입력하세요.");
			return false;
		}
		// ajax 용도 : 화면 갱신(reload,redirect)가 없이
		//            부분화면 갱신(통신)을 js에서 한다.
		//           예)네이버 - 실시간검색어, 실시간날씨
		
		// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$.ajax({
			/* url : 'http://localhost:8080/servlet3_LoginJoinDB/IdCheckAction.do?id='+ user_id, */
			url : '${pageContext.request.contextPath}/IdCheckAction?id='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복됨, 0 = 중복안됨 : "+ data);							
				
				if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					alert("아이디가 중복됩니다.");
					$('#check_hidden').val("no");
				} else {
					// 0 : 아이디가 안됨.
					alert("아이디가 사용가능합니다.");
					$('#check_hidden').val("yes");
				}
			}, 
			error : function() {
					console.log("실패");
			}
		});
	}
	
</script>
	
    
</head>
<body>
    <div id="logo">
        <img src="img/logo.jpg" alt="logo">
        
    </div>

   	    <div id=login>
        <div class="row">
            <div class="col">
            <form method="post" action="MemberJoinAction" 
				name="userInfo" onsubmit="return checkValue()">	
                      <div class="form-group">
                        <input type="text" class="form-control" id="inputname" name="name" placeholder="성명" >
                      </div>
                      
                    <div class="form-group">
                      <input type="text" class="form-control" id="input_userId" name="id" placeholder="아이디 입력" >
                      <input type="button" class="btn btn-outline-dark" id="input_userId_cheeck" value="중복확인" onclick="idCheck()">
                      <input id ="check_hidden" type="hidden" value="no"/>
                    </div> 
               
                    <div class="form-group">
                      <input type="password" class="form-control" id="Password"  name="password" placeholder="비밀번호 입력" >
                    </div>

                    <div class="form-group">
                        <input type="password" class="form-control" id="inputPasswordcheck"  name="passwordcheck" placeholder="비밀번호 확인" >
                      </div>
                      
                      <div class="form-group">
                        <input type="text" class="form-control"  id="inputphone" name="phone" placeholder="전화번호 입력" >
                      </div>
                      
                      <div class="form-group">
                        <input type="text" class="form-control" id="inputmail" name="mail" placeholder="이메일 입력" >
                      </div>

                
                    <div class="Singup">
                        <input type="submit" class="btn btn-success" value="가입" />
                       </div>
                   </form>
            </div>
            </div>
            </div>
            
   
      
</body>
</html>

