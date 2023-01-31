<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	   $('#updateBtn').click(function(){ // .on('click', function(){})
	      let name = $('#name').val();
	      if(name.trim() === "") {
	         $('#name').focus()
	         return
	      }
	      
	      let title = $('#title').val();
	      if(title.trim() === "") {
	         $('#title').focus()
	         return
	      }
	      
	      let content = $('#content').val();
	      if(content.trim() === "") {
	         $('#content').focus()
	         return
	      }
	      
	      let pwd = $('#pwd').val();
	      if(pwd.trim() === "") {
	         $('#pwd').focus()
	         return
	      }
	      let bno = $('#bno').val();
	      let queryString = $('#update_frm').serialize(); // 안에있는 데이터를 다 읽어온다, form태그에 입력된 모든 데이터를 한번에 읽어서 전송
	      // alert(queryString)
	      
	      $.ajax({
	         type:'post',
	         url:'../board/update_ok.do',
	         data:queryString,
	         //data:{"no":no, "name":name, "subject":subject, "content":content, "pwd":pwd},
	         success:function(result) {
	            let res = result.trim();
	            if(res === 'no') {
	               // 비밀번호가 틀릴 경우
	               alert("비밀번호가 틀립니다\n다시 입력하세요")
	               $('#pwd').val("")
	               $('#pwd').focus()
	            } else {
	               // 비밀번호가 맞는 경우
	               location.href = "../board/detail.do?bno="+bno
	            }
	         }
	      })
	   })
	})
</script>
<style type="text/css">
textarea{
resize: none;
}
</style>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
    <h2 class="sectiontitle">수정하기</h2>
    <div style="height: 5px"></div>
    <div style="height: 550px">
		<div class="row">
			<form id="update_frm">
			<table class="table">
				<tr>
					<th class="text-center success" width=20%>이름</th>
					<td width=80% align=left>
						<input type=text name=name size=15 class="input-sm" value="${vo.name }" id="name">
						<input type=hidden name=bno value="${vo.bno }" id="bno">
					</td>
				</tr>
				<tr>
					<th class="text-center success" width=20%>제목</th>
					<td width=80 align=left>
						<input type=text name=title size=50 class="input-sm" value="${vo.title }" id="title">
					</td>
				</tr>
				<tr>
					<th class="text-center success" width=20%>내용</th>
					<td width=80% align=left>
						<textarea rows="10" cols="50" name=content id="content">${vo.content }</textarea>
					</td>
				</tr>
				<tr>
					<th class="text-center success" width=20%>비밀번호</th>
					<td width=80% align=left>
						<input type="password" name=pwd size=10 class="input-sm" id="pwd">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<input type=submit class="btn btn-sm btn-info" value="수정" id="updateBtn">
						<input type=button class="btn btn-sm btn-warning" onclick="javascript:history.back()" value="취소">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	</main>
	</div>
</body>
</html>