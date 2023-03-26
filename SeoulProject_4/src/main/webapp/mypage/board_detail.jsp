<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	let i=0;
	let u=0;
	let r=0;
	$(function(){
		$('#delete').click(function(){
			if (i===0)
			{
				$('#del').show();
				$('#delete').text("취소");
				i=1
			}
			else
			{
				$('#del').hide();
				$('#delete').text("삭제");
				i=0;
			}
		})
		$('#del_btn').on('click', function(){
			let pwd= $('#del_pwd').val()
			if(pwd.trim()==="")
			{
				$('#del_pwd').focus()
				return
			}
			let bno = $('#del').attr("data-no")
			$.ajax({
				type: 'post',
				url: '../board/delete.do',
				data:{"bno":bno, "pwd":pwd},
				success: function(result)
				{
					let msg=result.trim();
					if(msg === 'yes')
					{
						location.href="../board/list.do"
					}
					else
					{
						alert("비밀번호가 틀립니다 \n 다시 입력하세요")
						$('#del_pwd').val("")
						$('#del_pwd').focus()
					}
				}
			})
		})
		$('.ups').click(function(){
			$('.rinsert').hide();
			$('.rupdate').hide();
			let bno= $(this).attr("data-no")
			if(u===0)
			{
				$('#u'+ bno).show();
				$(this).text("취소")
				u=1;
			}
			else
			{
				$('#u'+bno).hide();
				$(this).text("수정")
				u=0;
			}
		})
		$('.replys').click(function(){
			$('.rinsert').hide();
	          $('.rupdate').hide();
	          
	          let bno=$(this).attr("data-no");
	          if(r===0)
	          {
	    	  	  $('#r'+bno).show();
	    	  	  $(this).text("취소")
	    	  	  r=1;
	          }
	    	  else
	    	  {
	    		  $('#r'+bno).hide();
	  	  		  $(this).text("댓글")
	    	   	  r=0;
	    	  }
		})
	})
</script>
<style type="text/css">
.commentbody{
   width:100%;
   padding: 70px;
   background: white;
   box-shadow: 5px 5px 5px 3px gray;
   background-color:white;
}
.whitegray_btn{
	/* width:15px; */
	 padding : 3px 8px 3px 8px;
	 margin : 1px 1px 1px 1px; 
}
textarea{
resize: none;
}
</style>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear" >
    <h2 class="sectiontitle text-left">자유 게시판</h2>
    <div style="height: 5px"></div>
    
    <table class="table" style="width:80%;position:relative;left:10px;">
    	<tr>
    		<th width=20% class="text-center">번호</th>
    		<td width=30% class="text-left">${vo.bno }</td>
    		<th width=30% class="text-center">작성일</th>
    		<td width=30% class="text-left">${vo.dbday }</td>
    	</tr>
    	<tr>
    		<th width=20% class="text-center">이름</th>
    		<td width=30% class="text-left">${vo.name }</td>
    		<th width=30% class="text-center">조회수</th>
    		<td width=30% class="text-left">${vo.hit }</td>
    	</tr>
    	<tr>
    		<th width=20% class="text-center">제목</th>
    		<td colspan="3" class="text-left">${vo.title }</td>
    	</tr>
    	<tr>
    		<td class="text-left" valign="top" colspan="4" height="200"><pre style="white-space: pre-wrap;background-color:white;border:none;font-size: 16px;font-family:Noto Sans KR">${vo.content }</pre></td>
    	</tr>
    	<tr>
    		<td class="text-right" colspan="4">
    		
    		<a href="../mypage/update.do?bno=${vo.bno }" class="whitegray_btn">수정</a>
    		<a href="../mypage/board_delete.do?no=${vo.bno }" class="whitegray_btn" >삭제</a>
    		
    		<a href="../mypage/board_list.do" class="whitegray_btn">목록</a>
    		</td>
    	</tr>
    	
    </table>
    
         </div>
 

</body>
</html>