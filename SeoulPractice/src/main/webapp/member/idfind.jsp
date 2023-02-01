<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 30px;
}
.row{
   width: 350px;
   margin: 0px auto;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#okBtn').hide();
	$('#idBtn').on('click',function(){
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
				let res=Number(result.trim()); // 정수형 변경 
				if(res===0)
				{
					$('#result').html('<font color=blue>'+id+"입니다.</font>");
					$('#okBtn').show();
				}
				else
				{
					$('#result').html('<font color=red>'+id+"는(은) 찾을수 없는 아이디입니다</font>");
					$('#okBtn').hide();
				}
			}
		})
	})
	$('#okBtn').click(function(){
		parent.join_frm.id.value=$('#id').val();
		parent.Shadowbox.close();
	})
})
</script>
</head>
<body>
   <div class="container">
     <div class="row">
       <table class="table">
         <tr>
           <td class="text-center">
           		이름:&nbsp;<input type=text name=id id=name size=15 class="input-sm">
           		이메일:&nbsp;<input type=text name=id id=email size=15 class="input-sm"><br>
           		<input type=button value="아이디찾기" class="btn btn-sm btn-primary" id="idBtn">
           </td>
         </tr>
         <tr>
           <td class="text-center">
             <span id="result"></span>
           </td>
         </tr>
         <tr>
           <td class="text-center">
             <input type=button value="확인" class="btn btn-sm btn-success" id="okBtn">
           </td>
         </tr>
       </table>
     </div>
   </div>
</body>
</html>