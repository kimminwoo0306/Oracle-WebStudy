<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../member/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.background_pwd,
.background_id {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	/*background-color: rgba(0, 0, 0, 0.4);*/
	z-index: 500;
	
	/* 숨기기 */
	z-index: -1;
	opacity: 0;
	background: rgba(0,0,0,.4);
}
.pwd_show,
.id_show {
	opacity: 1;
	z-index: 500;
	transition: all 0.5s;
}
#show_btn_pwd,
#show_btn_id{
              
	/*버튼 디폴트값 지우기*/
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance:none;
	        
	border : 2px solid white;
	border-radius : 4px;
	padding: 6px 12px;
	background-color:transparent;
}
#show_btn_pwd:hover,
#show_btn_id:hover{
	border : 2px solid #004fff;
	color : #004fff;
}
      

.window {
	position: relative;
	width: 100%;
	height: 100%;
}

.photoby_popup {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #ffffff;
	box-shadow: 0 10px 15px rgba(0, 0, 0, 0.5);
	border-radius: 10px;
	/* 임시 지정 */
	width: 450px;
	height: 420px;
	
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
	padding : 50px;
	z-index: 9999;
}
.pwd_show .photoby_popup,
.id_show .photoby_popup {
	transform: translate(-50%, -50%);
	transition: all 0.5s;
}
      
.photoby_popup h4{
	margin:0px;
	padding-bottom : 40px;
	text-align:center;
}
      
#photoby_content{
	padding-bottom : 20px;
}
   
#photoby_content p{
	color:black;
}
     
#photoby_content a{
	color:#004fff;
}
</style>
<script type="text/javascript">
$(function(){
	// 로그인 버튼 
	$('#logBtn').click(function(){
		// id,pwd => Model로 전송 
		let id=$('#log_id').val();
		if(id.trim()==="")
		{
			$('#log_id').focus();
			return
		}
		let pwd=$('#log_pwd').val();
		if(pwd.trim()==="")
		{
			$('#log_pwd').focus();
			return
		}
		
		$.ajax({
			type:'post',
			url:'../member/loginok.do',
			data:{"id":id,"pwd":pwd},
			success:function(result)
			{
				// NOID , NOPWD , OK
				let res=result.trim();
				if(res==='NOID')
				{
					alert("아이디가 존재하지 않습니다!!")
					$('#log_id').val("");
					$('#log_pwd').val("");
					$('#log_id').focus()
				}
				else if(res==='NOPWD')
				{
					alert("비밀번호가 틀립니다!!")
					$('#log_pwd').val("")
					$('#log_pwd').focus()
				}
				else if(res==='OK')
				{
					alert("로그인 되었습니다.")
					location.href="../main/main.do";
				}
			}
		})
	})
})
//아이디 찾기
$(function(){
	$('#okBtn').hide();
	$('#idBtn').click(function(){
		let name=$('#name').val()
		let email=$('#email').val()
		if(name.trim()=="")
		{
			$('#name').focus();
			return
		}
		if(email.trim()=="")
		{
			$('#email').focus();
			return
		}
		$.ajax({
			type:'post', //get,post
			url:'../member/idfind_result.do', //MVC (Model=자바파일을 거친다)
			data:{"name":name, "email":email},
			// 실행된 JSP파일을 읽어 온다 ==> 1. HTML , 2. JSON 
			success:function(result) // 콜백:시스템에 의해 자동 호출 
			{
				let res=result.trim(); 
				if(res==="no")
				{
					$('#result').html('<font color=red>아이디를 찾을 수 없습니다.</font>');
					$('#okBtn').hide();
				}
				else
				{
					$('#result').html('<font color=blue>' + res + "입니다</font>");
					$('#okBtn').show();
					$('#close_btn').hide();
				}
			}
		})
	})
	$('#okBtn').click(function() {
		$('#name').val('');
		$('#email').val('');
		$('#result').empty();
		$('#result').removeAttr('style');
		$('#okBtn').hide();
		$('#close_btn').show();
	});
	
	$('#close_btn').click(function() {
		$('#name').val('');
		$('#email').val('');
		$('#result').empty();
		$('#result').removeAttr('style');
		$('#okBtn').hide();
		$('#close_btn').show();
	});
	
})
//비밀번호 찾기
$(function(){
	$('#okBtn_pwd').hide();
	$('#idBtn_pwd').click(function(){
		let id=$('#id').val()
		let email=$('#email_pwd').val()
		
		if(id.trim()=="") {
			$('#id').focus();
		}
		if(email.trim()=="") {
			$('#email_pwd').focus();
		}
		$.ajax({
			type:'post', //get,post
			url:'../member/pwdfind_result.do', //MVC (Model=자바파일을 거친다)
			data:{"id":id, "email":email},
			// 실행된 JSP파일을 읽어 온다 ==> 1. HTML , 2. JSON 
			success:function(result) // 콜백:시스템에 의해 자동 호출 
			{
				let res=result.trim();
				if(res==="no")
				{
					$('#result_pwd').html('<font color=red>비밀번호를 찾을 수 없습니다.</font>');
					$('#okBtn_pwd').hide();
				}
				else
				{
					$('#result_pwd').html('<font color=blue>' + res + "입니다</font>");
					$('#okBtn_pwd').show();
					$('#close_btn_pwd').hide();
				}
			}
		})
	})
	$('#okBtn_pwd').click(function() {
		$('#id').val('');
		$('#email_pwd').val('');
		$('#result_pwd').empty();
		$('#result_pwd').removeAttr('style');
		$('#okBtn_pwd').hide();
		$('#close_btn_pwd').show();
	});
	
	$('#close_btn_pwd').click(function() {
		$('#id').val('');
		$('#email_pwd').val('');
		$('#result_pwd').empty();
		$('#result_pwd').removeAttr('style');
		$('#okBtn_pwd').hide();
		$('#close_btn_pwd').show();
	});
	
})
</script>
</head>
<body>
    <div class="container" id="container">
        <div class="form-container sign-in-container">
            <form method="POST">
            	<a href="../main/main.do"><img src="../member/logo.png" class="loginimg" style="margin-top: -10px;margin-left: 13px;"></a>
                <span style="margin-top: 4px">서울99여행 아이디로 <br>모든 서비스를 이용할 수 있어요.</span>
				    <input type=text name=id size=10 placeholder="아이디" id="log_id">
					<input type=password name=pwd size=10 placeholder="비밀번호" id="log_pwd">
				    <button type=button value="로그인" id="logBtn">로그인</button>
                <div style="margin: 5px;">
	                <button class="btn btn-link btn-main py-0" type="button" id="show_btn_id">아이디 찾기</button>|
	                <button class="btn btn-link btn-main py-0" type="button" id="show_btn_pwd">비밀번호 찾기</button>
                </div>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-right">
                    <h2>서울99여행에 오신것을 <br>환영합니다!</h2>
                    <p>서울99여행을 이용하고 싶다면 <br>회원가입을 해주세요!</p>
                    <button type="button" onclick="location.href='../member/join.do'" class="ghost" id="signUp">회원가입</button>
                </div>
            </div>
        </div>
        <div id="01" class="background_id">
        	<div class="window">
        		<div class="photoby_popup">
        		<h4 style="color:black;">아이디 찾기</h4>
        			<div id="photoby_content">
        				<table class="table">
        					<tr>
        						<td class="text-center">
        							<div>
        								이름<input type=text name=id id=name size=15 class="input-sm" style="margin: 3px;">
        							</div>
						           	<div>
						           		이메일<input type=text name=id id=email size=15 class="input-sm" style="margin: 3px;">
						           	</div>
						           	<div>
						           		<input type=button value="아이디찾기" class="btn btn-sm btn-primary" id="idBtn" style="width: 50%">
						           	</div>
						         </td>
						     </tr>
						     	<tr>
						     		<td class="text-center">
						     			<span id="result"></span>
						     		</td>
						     	</tr>
						     	<tr>
						     		<td class="text-center">
						     			<input type=button value="확인" class="btn btn-sm btn-success" id="okBtn" style="width: 50%">
						     			<input type=button value="닫기" class="btn btn-sm btn-success" id="close_btn" style="width: 50%">
						     		</td>
						     	</tr>
						  </table>
					  </div>
			     </div>
			</div>
		</div>
		<div id="02" class="background_pwd">
        	<div class="window">
        		<div class="photoby_popup">
        		<h4 style="color:black;">비밀번호 찾기</h4>
        			<div id="photoby_content">
        				<table class="table">
        					<tr>
        						<td class="text-center">
        							<div>
        								아이디<input type=text name=id id=id size=15 class="input-sm" style="margin: 3px;">
        							</div>
						           	<div>
						           		이메일<input type=text name=id id=email_pwd size=15 class="input-sm" style="margin: 3px;">
						           	</div>
						           	<div>
						           		<input type=button value="비밀번호 찾기" class="btn btn-sm btn-primary" id="idBtn_pwd" style="width: 50%">
						           	</div>
						         </td>
						     </tr>
						     	<tr>
						     		<td class="text-center">
						     			<span id="result_pwd"></span>
						     		</td>
						     	</tr>
						     	<tr>
						     		<td class="text-center">
						     			<input type=button value="확인" class="btn btn-sm btn-success" id="okBtn_pwd" style="width: 50%">
						     			<input type=button value="닫기" class="btn btn-sm btn-success" id="close_btn_pwd" style="width: 50%">
						     		</td>
						     	</tr>
						  </table>
					  </div>
			     </div>
			</div>
		</div>
		
    </div>
    <script>
      function id_show() {
        document.querySelector(".background_id").className = "background_id id_show";
      }

      function id_close() {
        document.querySelector(".background_id").className = "background_id";
        
      }
      document.querySelector("#show_btn_id").addEventListener("click", id_show);
      document.querySelector("#close_btn").addEventListener("click", id_close);
      document.querySelector("#okBtn").addEventListener("click", id_close);
      
      function pwd_show() {
          document.querySelector(".background_pwd").className = "background_pwd pwd_show";
        }

        function pwd_close() {
          document.querySelector(".background_pwd").className = "background_pwd";
          
        }

        document.querySelector("#show_btn_pwd").addEventListener("click", pwd_show);
        document.querySelector("#close_btn_pwd").addEventListener("click", pwd_close);
        document.querySelector("#okBtn_pwd").addEventListener("click", pwd_close);
    </script>
</body>
</html>







