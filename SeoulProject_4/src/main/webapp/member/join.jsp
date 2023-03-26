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
<script type="text/javascript">
//아이디 유효성 검사
function checkId(){
	let id = $('#id').val();
	if(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g.test(id)){ 
		alert("한글은 아이디로 사용할 수 없습니다");
		$('#id').val('');
		return;
	}
	if(/[\{\}\[\]\/?.,;:|\*~`!^\-_+<>@#$%&₩\\\=\(\'\"]/.test(id)) {
		alert("특수문자를 사용할 수 없습니다");
		$('#id').val('');
		return;
	}
	if (/\s/.test(id)) {
		alert("공백 문자를 사용할 수 없습니다");
		$('#id').val('');
		return;
	}
	if (/admin/i.test(id)) {
		  alert("admin은 아이디로 사용할 수 없습니다");
		  $('#id').val('');
		  return;
	}
	
	$.ajax({
		url:'../member/idcheck_result.do', 
		type:'post',
		data:{"id":id},
		success:function(result){ 
			
			let count=Number(result.trim());
			
			if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/.test(id)) {
				$('#id_regex').text("영문과 숫자를 조합하여 6 ~ 20글자를 입력해 주세요")
			} else if(/^[a-zA-Z0-9]{6,20}$/.test(id)) {
				$('#id_regex').text('');
			} 
			if(count == 0) {
				if(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/.test(id)) {
					$('#id_ok').text("사용 가능한 아이디입니다.")
					$('#id_already').text('');
				}else if (!/^[a-zA-Z0-9]{6,20}$/.test(id)){
					$('#id_ok').text('');
				}
				
			} else if (count == 1) {
				$('#id_already').text("이미 사용중인 아이디입니다.")
				$('#id_ok').text('');
				$('#id_regex').text('');
			}
			if (!id) {
				  $('#id_ok').text('');
				  $('#id_regex').text('');
				  $('#id_already').text('');
			}
			$('#joinBtn').click(function(){
				if(count == 1) {
					alert("이미 사용중인 아이디 입니다.")
					$('#id_already').text("이미 사용중인 아이디입니다. 다시 입력해 주세요.")
					$('#id').val('');
				}
				
			})
		},
		
	})
        
};
function checkName() {
	let name=$('#name').val()
	if(name.trim()==="")
	{
		alert("이름은 필수 입력입니다")
		$('#name').focus()
		return 
	}
	if(/[A-Za-z!@#$%^&*()_+,-./:;<=>?@[\]^_`{|}~]/.test(name))
	{
		alert("이름은 한글만 입력 가능합니다")
		$("#name").val("");
		$('#name').focus()
		return
	}
	if (/\s/.test(name)) {
		alert("공백 문자를 사용할 수 없습니다");
		$('#id').val('');
		return;
	}
};
$(function(){
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
		if(/[\{\}\[\]\/?.,;:|\*~`!^\-_+<>@#$%&₩\\\=\(\'\"]/.test(nick)) {
			alert("특수문자를 사용할 수 없습니다");
			$('#nick').val('');
			return;
		}
		if (/\s/.test(nick)) {
			alert("공백 문자를 사용할 수 없습니다");
			$('#nick').val('');
			return;
		}
		if (/admin/i.test(nick)) {
			  alert("admin은 닉네임으로 사용할 수 없습니다");
			  $('#nick').val('');
			  return;
		}
		if (nick.length > 7) {
			 alert("닉네임은 최대 7글자 까지 입력 가능 합니다.");
			  $('#nick').val('');
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
})
$(function() {
	$('#joinBtn').click(function(){
		let id = $("#id").val();
		let idreg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/;
		if (!idreg.test(id)) {
			alert("영문과 숫자를 조합하여 6 ~ 20글자를 입력해 주세요")
			$('#id').val('');
			return;
		} 
		let pwd = $("#pwd").val();
		let pwd1 = $("#pwd1").val();
		let pwdreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
		if(!pwdreg.test(pwd)){
			alert("비밀번호는 8자리 이상이어야 하며, 영문/숫자/특수문자 모두 포함해야 합니다.");
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
		
		if (!$('#tos').prop('checked')) {
		    $('#tosPrint').text("약관에 동의해야 회원가입이 가능합니다.")
		    $("#tos").focus()
		    return;
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
					<!-- 아이디 -->
					<div class="inputWrap" style="flex-direction: column; align-items: flex-start;">
						<label>아이디</label>
						<input type="text" name="id" id="id" required oninput = "checkId()" placeholder="아이디는 6 ~ 20자 사이에서 영문과 숫자를 포함해야 합니다.">
                    </div>
                    <span id="id_ok" class="subcomment" style="color: blue;"></span>
                    <span id="id_already" class="subcomment" style="color: red;"></span>
                    <span id="id_regex" class="subcomment" style="color: red;"></span>
                    <!-- 이메일 -->
	                <label>이메일</label>
	                <div class="input-phone">
	                	<div class="inputWrap" style="flex-direction: column; align-items: flex-start;">
	                		<input type="text" name="email" id="email" required>
	                	</div>
                    	<div class="inputWrap">
                    		<button id="eBtn" type="button">중복확인</button>
                    	</div>
                    </div>
                    &nbsp;<span style="color:blue" id="ePrint" class="subcomment"></span>
                    <!-- 비밀번호 -->
                    <div class="inputDWrap">
                        <div class="inputWrap50">
                            <label>비밀번호</label>
                            <input type="password" name="pwd" class="inputFull"  id="pwd" required>
                        </div>
                        <div class="inputWrap50">
                            <label>비밀번호 확인</label>
                            <input type="password" name="pwd1" class="inputFull"  id="pwd1" placeholder="입력 오류 방지를 위해 한 번 더 입력해 주세요." required >
                            <p style="font-size: 12px; color: rgb(33, 160, 100); margin-top: 5px" id="pPrint"></p>
                        </div>
                        <p style="font-size: 11px; color: rgb(33, 160, 100);">* 비밀번호는 8 ~ 20자리 이상이어야 하며, 영문/숫자/특수문자가 포함해야 합니다.</p>
                    </div>
					<!-- 이름 -->                    
                    <div class="inputWrap" style="flex-direction: column; align-items: flex-start;">
                        <label>이름</label>
                        <input type="text" name="name" maxlength="150" autofocus required id="name" oninput = "checkName()">
                    </div>
                    <!-- 닉네임 -->
                    <label>닉네임</label>
                    <div class="input-phone">
                    	<div class="inputWrap" style="flex-direction: column; align-items: flex-start;">
                    		<input type="text" name="nick" id="nick" required placeholder="닉네임은 최대 7글자까지 입력 가능합니다.">
                    	</div>
                    	<div class="inputWrap">
                    		<button id="nBtn" type="button">중복확인</button>
                    	</div>
                    </div>
                    <span style="color:blue" id="nPrint" class="subcomment"></span>
                    
                    <div class="inputDWrap">
                    	<!-- 성별 -->
                    	<div class="inputWrap50">
                    	<label>성별</label>
                    		<select name="sex" class="inputFull" id="sex" required>
                    			<option value="0" style="font-size: 9px">선택</option>
                    			<option value="남자" style="font-size: 9px">남자</option>
                    			<option value="여자" style="font-size: 9px">여자</option>
                    		</select>
                    	</div>
                    	<!-- 생년월일 -->
                    	<div class="inputWrap50">
                    	<label>생년월일</label>
                    		<input type=date size=30 class="inputFull" name=day id="day "style="width: 100%; font-size: 12.5px; padding: 5px 10px;"  required>
                    	</div>
                    </div>
                    
                    <div>
                    	<!-- 휴대폰 번호 -->
                    	<label style="margin-bottom: -2px;">휴대폰 번호</label>
                    	<div class="input-phone">
                    		<div class="inputWrap">
                    			<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="phone1" class="col-xs-3"  id="phone1" value="010" style="padding: 12px 10px; width: 31.4%;" maxlength="3" required>
                    			<div class="inputFull" style="float: left; margin: 10.5px 4px;">-</div>
                    			<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="phone2" class="col-xs-4"  id="phone2" style="padding: 12px 10px; width: 31.4%;" maxlength="4" required>
                    			<div class="inputFull" style="float: left; margin: 10.5px 4px;">-</div>
                    			<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="phone3" class="col-xs-4"  id="phone3" style="padding: 12px 10px; width: 31.4%;" maxlength="4" required>
                    		</div>
                    		<!-- 중복 확인 -->
                    		<div class="inputWrap">
                    			<button id="tBtn" type="button">중복확인</button>
                    		</div>
                    	</div>
                    	<p style="color: blue; margin-top: 5px" id="tPrint" class="subcomment"></p>
                    </div>
                    
                    <div class="confirm">
                    	<input type="checkbox" name="term" id="tos" class="checkbox" required>
                    	<label for="tos" class="checkLabel">서울99여행 <a href="#" target="_blank">서비스 이용 약관</a> 및 <a href="#" target="_blank">개인 정보 수집 및 이용</a>에 동의합니다.</label>
                    	<span style="color: red;" id="tosPrint" class="subcomment"></span>
                    </div>
				</fieldset>
				<div>
					<button type="submit" class="btn submit" id="joinBtn">회원 가입</button>
				</div>
			</form>
			<div class="jump">
				<span><a href="../member/login.do">이미 아이디가 있다면 여기에서 로그인하세요</a></span>
			</div>
		</div>
	</div>
</body>
</html>