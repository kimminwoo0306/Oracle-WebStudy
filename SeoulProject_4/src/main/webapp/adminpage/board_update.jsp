<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      
      
      let bno = $('#bno').val();
      let queryString = $('#update_frm').serialize(); // 안에있는 데이터를 다 읽어온다, form태그에 입력된 모든 데이터를 한번에 읽어서 전송
      // alert(queryString)
      
      $.ajax({
         type:'post',
         url:'../adminpage/update_ok.do',
         data:queryString,
         //data:{"no":no, "name":name, "subject":subject, "content":content, "pwd":pwd},
         success:function(result) {
            let res = result.trim();
            
               // 비밀번호가 맞는 경우
               location.href = "../adminpage/board_list.do"
            
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
  <main class="container clear" style="width:80%;position:relative;left:-20px;">
    <h2 class="sectiontitle">수정하기</h2>
    <div style="height: 5px"></div>
    <div style="height: 550px">
    <form id="update_frm">
    	    <table class="table">
    	<tr>
    		<th width=20% class="text-center">이름</th>
    		<td width=80% align=left>
    		<input type=text name=name size=30 class="input-sm" value="관리자" id="name">
    		<input type="hidden" name=bno value="${vo.bno }" id="bno">
    		</td>
    	</tr>
    	<tr>
    		<th width=20% class="text-center">제목</th>
    		<td width=80% align=left>
    			<input type=text name=title size=60 class="input-sm" id="title" value="${vo.title }">
    		</td>
    	</tr>
    	<tr>
    		<th width=20% class="text-center">내용</th>
    		<td width=80% align=left>
    			<textarea rows="10" cols="60" name="content" id="content">${vo.content }</textarea required>
    		</td>
    	</tr>
    	<tr>
			<th width=20% class="text-center success">첨부파일</th>
				<td width=80% align=left>
					<input type=file name=upload size=20 class="input-sm">
				</td>
			</tr>
    	
    	<tr>
    		<td colspan="2" class="text-center">
    			<input type=button value="수정" class="btn btn-sm btn-danger" id="updateBtn">
    			<input type=button value="취소" class="btn btn-sm btn-danger" onclick="javascript:history.back()">
    		</td>
    	</tr>
    </table>
    </form>
    </div>
  </main>
  </div>
</body>
</html>