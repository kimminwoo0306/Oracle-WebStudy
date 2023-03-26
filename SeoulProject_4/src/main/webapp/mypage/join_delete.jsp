<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<link rel="stylesheet" href="../mypage/delete_css.css">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.css">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#delBtn').click(function(){
		let pwd=$('#pwd').val();
		if(pwd.trim()==""){
			$('#pwd').focus();
			return
		}
		$.ajax({
			type:'post',
			url:'../mypage/join_delete_ok.do',
			data:{"pwd":pwd},
			success:function(response){
				let res=response.trim();
				if(res=="no"){//비밀번호가 틀립니다
					alert("비밀번호가 틀립니다")
				$('#pwd').val("")
				$('#pwd').focus()
				}else{
					alert("회원 탈퇴되었습니다")
					location.href="../main/main.do"
				}
			}
		})
	})
})
</script>
<style type="text/css">
.container{
  width:1150px;
}
#delBtn{
  width:100px;
  margin: auto;
  display: block;
  
}
#pwd{
  width:200px;
  position: relative;
  left:350px;
}
#pwdicon{
  position: relative;
  left:350px;
}
#location{
  position: relative;
  left:-180px;

}
</style>
</head>
<body>
<div style="height:50px"></div>
<div class="container">
  <div class="row">
    <div class="Absolute-Center is-Responsive">
      
      <div class="col-sm-12 col-md-10 col-md-offset-1">
        <form action="" id="loginForm">
          <div id="location">
          <div class="form-group input-group">
            <span class="input-group-addon" id="pwdicon"><i class="glyphicon glyphicon-lock"></i></span>
            <input class="form-control" type="password" name='password' placeholder="password" id="pwd" />     
          </div>
          <div class="checkbox text-center">
            <label>
              <input type="checkbox" ><a href="#" style="color: black;">회원 탈퇴에 동의합니다.</a>
            </label>
          </div>
          
          <div class="form-group text-center">
            <button type="button" class="btn btn-def btn-block" id="delBtn">확인</button>
          </div>
          <div class="form-group text-center">
            <a href="#" style="color: black;">비밀 번호 찾기</a>&nbsp;|&nbsp;<a href="#" style="color: black;">도움말</a>
          </div>
          </div>
        </form>        
      </div>  
    </div>    
  </div>
</div>
</body>
</html>