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
<link rel ="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
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
		$('#idfind').click(function(){
		Shadowbox.open({
			content:'../member/idcehck.do',
			player:'iframe',
			width:420,
			height:180,
			title:'아이디 찾기'
		})
	})
		
})
	/*// 로그아웃 버튼 
	$('#logoutBtn').click(function(){
		$.ajax({
			type:'post',
			url:'../member/logout.do',
			success:function(result)
			{
				location.href="../main/main.do";
			}
		})
	})*/
	
})
</script>
</head>
<body>
    <div class="container" id="container">
        <div class="form-container sign-in-container">
            <form method="POST">
                <img src="../member/logo.png" class="loginimg" style="margin-top: -10px;margin-left: 13px;">
                <span style="margin-top: 4px">서울99여행 아이디로 <br>모든 서비스를 이용할 수 있어요.</span>
				    <input type=text name=id size=10 placeholder="ID" id="log_id">
					<input type=password name=pwd size=10 placeholder="Password" id="log_pwd">
				    <button type=button value="로그인" id="logBtn">로그인</button>
                <div style="margin: 5px;">
	                <button class="btn btn-link btn-main py-0" type="button" id="idfind">아이디 찾기</button>|
	                <button class="btn btn-link btn-main py-0" type="button" id="idfind">비밀번호 찾기</button>
                </div>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-right">
                    <h2>서울99여행에 오신것을 <br>환영합니다!</h2>
                    <p>서울99여행을 이용하고 싶다면 <br>회원가입을 해주세요!</p>
                    <button type="button" onclick="location.href='../member/join.do'" class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>





