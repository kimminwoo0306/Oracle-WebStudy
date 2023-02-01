<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../member/join.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel ="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
	$('#idcheck').click(function(){
		Shadowbox.open({
			content:'../member/idcheck.do',
			player:'iframe',
			width:420,
			height:180,
			title:'아이디 중복체크'
		})
	})
	// email 검색 => 후보키 (unique)
	$('#eBtn').click(function(){
		let email=$('#email').val();
		let emailreg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(email.trim()==="")
		{
			$('#email').focus();
			return;
		}
		if(!emailreg.test(email)){
			alert("이메일을 형식에 맞게 입력해주세요.");
			$('#email').val("")
			$('#email').focus()
		    return;
		  }
		$.ajax({
			type:'post',
			url:'../member/email_check.do',
			data:{"email":email},
			success:function(result)
			{
				let count=Number(result.trim());
				if(count==0)
				{
					$('#ePrint').text(email+"는(은) 사용 가능한 이메일입니다")
					$('#email').prop('readonly',true)// <input readonly>
					// prop('disabled',true) , prop('checked',true)
				}
				else
				{
					$('#ePrint').text(email+"는(은) 이미 사용중인 이메일입니다")
					$('#email').val("")
					$('#email').focus()
				}
				
			}
		})
	})
	// 닉네임 검색
	$('#nBtn').click(function(){
		let nick=$('#nick').val();
		if(nick.trim()==="")
		{
			$('#nick').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/nick_check.do',
			data:{"nick":nick},
			success:function(result)
			{
				let count=Number(result.trim());
				if(count==0)
				{
					$('#nPrint').text(nick+"는(은) 사용 가능한 닉네임 입니다")
					$('#nick').prop('readonly',true)// <input readonly>
					// prop('disabled',true) , prop('checked',true)
				}
				else
				{
					$('#nPrint').text(nick+"는(은) 이미 사용중인 닉네임 입니다")
					$('#nick').val("")
					$('#nick').focus()
				}
			}
		})
	})
	// 전화번호 검색
	$('#tBtn').click(function(){
		let phone1=$('#phone1').val();
		let phone2=$('#phone2').val();
		let phone3=$('#phone3').val();
		let phone=phone1+"-"+phone2+"-"+phone3
		if(phone2.trim()==="")
		{
			alert("전화번호를 입력헤주세요1");
			$('#phone2').focus();
			return;
		}
		else if (phone3.trim()==="")
		{
			alert("전화번호를 입력헤주세요2");
			$('#phone3').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../member/tel_check.do',
			data:{"phone":phone},
			success:function(result)
			{
				let count=Number(result.trim());
				console.log(count)
				if(count==0)
				{
					$('#tPrint').text(phone+"는(은) 사용 가능한 전화번호 입니다")
					$('#phone1').prop('readonly',true)// <input readonly>
					// prop('disabled',true) , prop('checked',true)
				}
				else
				{
					$('#tPrint').text(phone+"는(은) 이미 사용중인 전화번호 입니다")
					$('#phone2').val("")
					$('#phone3').val("")
					$('#phone3').focus()
				}
			}
		})
	})
	
	$('#joinBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()==="")
		{
			alert("아이디 중복 체크버튼을 클릭하세요!!");
			$('#id').focus();
			return;
		}
		let email=$('#email').val()
		if(email.trim()==="")
		{
			alert("Email은 필수 입력입니다")
			$('#email').focus()
			return;
		}
		let pwd = $("#pwd").val();
		let pwd1 = $("#pwd1").val();
		let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$/;
		if(!reg.test(pwd)){
			alert("비밀번호는 8자리 이상이어야 하며, 대문자/소문자/숫자/특수문자 모두 포함해야 합니다.");
			$("#pwd").val("");
			$("#pwd1").val("");
			$("#pwd").focus();
			return;
		}
		
		if (pwd.trim() !== pwd1.trim()) {
			alert("비밀번호가 일치하지 않습니다.\n다시 입력해주세요");
		    $("#pwd1").val("");
		    $("#pwd1").focus();
		    return;
		}
		
		let sex = $("#sex").val();
		if (sex === "0") {
		  alert("성별을 선택하세요");
		  $("#sex").focus();
		  return;
		}
		let name=$('#name').val()
		if(name.trim()==="")
		{
			alert("이름은 필수 입력입니다")
			$('#name').focus()
			return 
		}
		
		$('#join_frm').submit();
	})
	
})
</script>
</head>
<body>
	<div class="innerContainer">
        <div class="inner">
        	<img src="../member/logo.png" class="loginimg"> 
            <form method="POST" action="../member/join_ok.do" name="join_frm" id="join_frm">
                <fieldset>
                    <label>아이디</label>
                    <div class="input-phone">
                    	<div class="inputWrap" style="flex-direction: column; align-items: flex-start;">
                    		<input type="text" name="id" id="id" required readonly placeholder="아이디 중복 확인을 해주세요">
                    	</div>
                    	<div class="inputWrap">
                    		<button id="idcheck" type="button">중복확인</button>
                    	</div>
                    </div>
	                <label>이메일</label>
                    <div class="input-phone">
                    	<div class="inputWrap" style="flex-direction: column; align-items: flex-start;">
                    		<input type="text" name="email" id="email" required>
                    	</div>
                    	<div class="inputWrap">
                    		<button id="eBtn" type="button">중복확인</button>
                    	</div>
                    </div>
                    &nbsp;<span style="color:blue" id="ePrint"></span>
                    
                    <div class="inputDWrap">
                        <div class="inputWrap50">
                            <label>비밀번호</label>
                            <input type="password" name="pwd" class="inputFull"  id="pwd" required>
                        </div>
                        <div class="inputWrap50">
                            <label>비밀번호 확인</label>
                            <input type="password" name="pwd1" class="inputFull"  id="pwd1" placeholder="입력 오류 방지를 위해 한 번 더 입력해 주세요" required>
                            <p style="font-size: 12px; color: rgb(33, 160, 100); margin-top: 5px" id="pPrint"></p>
                        </div>
                        <p style="font-size: 11px; color: rgb(33, 160, 100);">* 비밀번호는 8 ~ 20자리 이상이어야 하며, 대문자/소문자/숫자/특수문자가 포함해야 합니다</p>
                    </div>
                    
                    
                    <div class="inputWrap" style="flex-direction: column; align-items: flex-start;">
                        <label>이름</label>
                        <input type="text" name="name" maxlength="150" autofocus required id="id_username">
                    </div>
                        <label>닉네임</label>
	                    <div class="input-phone">
	                    	<div class="inputWrap" style="flex-direction: column; align-items: flex-start;">
	                    		<input type="text" name="nick" id="nick" required>
	                    	</div>
	                    	<div class="inputWrap">
	                    		<button id="nBtn" type="button">중복확인</button>
	                    	</div>
	                    </div>
	                    <span style="color:blue" id="nPrint"></span>
                    <div class="inputDWrap">
                    	<div class="inputWrap50">
                            <label>성별</label>
                            <select name="sex" class="inputFull" id="sex" required>
							  <option value="0">선택</option>
							  <option value="남자">남자</option>
							  <option value="여자">여자</option>
							</select>
                        </div>
                        <div class="inputWrap50">
                        	<label>생년월일</label>
                        	<input type=date size=30 class="inputFull" name=day id="day "style="width: 100%; font-size: 12.5px;" required>
                        </div>
                     </div>
                    <div>
                        <label style="margin-bottom: -2px;">휴대폰 번호</label>
                        <div class="input-phone">
                            <div class="inputWrap">
                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="phone1" class="col-xs-3"  id="phone1" value="010" style="padding: 12px 10px; width: 31.4%;" maxlength="3" required>
	                           <div class="inputFull" style="float: left; margin: 10.5px 4px;">-</div>
	                           <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="phone2" class="col-xs-4"  id="phone2" style="padding: 12px 10px; width: 31.4%;" maxlength="4" required>
	                           <div class="inputFull" style="float: left; margin: 10.5px 4px;">-</div>
	                           <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="phone3" class="col-xs-4"  id="phone3" style="padding: 12px 10px; width: 31.4%;" maxlength="4" required>
                            </div>
                            <div class="inputWrap">
                                <button id="tBtn" type="button">인증요청</button>
                            </div>
                        </div>
                        <p style="font-size: 12px; color: rgb(33, 160, 100); margin-top: 5px" id="tPrint"></p>
                    </div>
                    <div class="confirm">
                        <input type="checkbox" name="term" id="tos" class="checkbox" required>
                        <label for="tos" class="checkLabel">서울99여행 <a href="#" target="_blank">서비스 이용 약관</a> 및 <a href="#" target="_blank">개인 정보 수집 및 이용</a>에 동의합니다.</label>
                    </div>
                </fieldset>
                <div>
                    <button type="submit" class="btn submit" id="joinBtn">회원 가입</button>
                </div>
            </form>
            <div class="jump">
                <span><a href="../member/login.jsp">이미 아이디가 있다면 여기에서 로그인하세요</a></span> <!--로그인 페이지로 이동 -->
            </div>
        </div>
    </div>
    </body>
</html>