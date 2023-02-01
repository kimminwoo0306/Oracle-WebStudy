<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../member/login.css">
<style type="text/css">
</style>
<script type="text/javascript">
//SweetAlert2 설정
const swalWithBootstrapButtons = Swal.mixin({
  customClass: {
    confirmButton: 'btn btn-success',
    cancelButton: 'btn btn-danger'
  },
  buttonsStyling: false
});

// 아이디 찾기 함수
function findId() {
  const name = document.getElementById("inputName").value;
  const email = document.getElementById("inputEmail").value;

  $.ajax({
    type: "POST",
    url: "findId.jsp",
    data: { name: name, email: email },
    success: function (response) {
      if (response === "ok") {
        swalWithBootstrapButtons.fire(
          '해당 이메일로 아이디를 발송했습니다.',
          '',
          'success'
        )
      } else {
        swalWithBootstrapButtons.fire(
          '일치하는 이름과 이메일이 없습니다.',
          '',
          'error'
        )
      }
    }
  });
}

</script>
</head>
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="#">
			<span>or use your email for registration</span>
			<input type="text" placeholder="Name" />
			<input type="email" placeholder="Email" />
			<input type="password" placeholder="Password" />
			<button>fhrmd</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="#">
			<h3>아이디 찾기</h3>
			<span>회원가입시 등록한 정보를 입력해주세요</span>
			<input type="text" placeholder="ID" />
			<input type="email" placeholder="Email" />
			<button style="margin-top: 5px">아이디 찾기</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend!</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="member.js"></script>
</div>
</html>


