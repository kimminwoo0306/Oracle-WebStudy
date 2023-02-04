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
  <main class="container clear">
    <h2 class="sectiontitle">자유 게시판</h2>
    <div style="height: 5px"></div>
    
    <table class="table">
    	<tr>
    		<th width=20% class="text-center">번호</th>
    		<td width=30% class="text-left">${vo.bno }</td>
    		<th width=30% class="text-center">작성일</th>
    		<td width=30% class="text-left">${vo.dbday }</td>
    	</tr>
    	<tr>
    		<th width=20% class="text-center">이름</th>
    		<td width=30% class="text-left">${vo.id }</td>
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
    		<c:if test="${sessionScope.id != null }">
             <c:if test="${sessionScope.id == vo.id }">
    		<a href="../board/update.do?bno=${vo.bno }" class="whitegray_btn">수정</a>
    		<span class="whitegray_btn" id="delete">삭제</span>
    		</c:if>
    		</c:if>
    		<a href="../board/list.do" class="whitegray_btn">목록</a>
    		</td>
    	</tr>
    	<tr id="del" style="display: none" data-no="${vo.bno }">
               <td colspan="4" class="text-right">
                  <form id="del_frm" class="inline">
                     비밀번호 : <input type="password" class="input-sm" size=15
                        id="del_pwd"> <input type="button" value="삭제"
                        class="btn btn-sm btn-primary" id="del_btn">
                  </form>
               </td>
        </tr>
    </table>
    <div style="height: 5px"></div>
    <div class="comment">
            <h3 class="sectiontitle">댓글(${count })</h3>
    </div>
    <div class="commentbody">
            <c:if test="${count == 0 }">
               <table class="table">
                  <tr>
                     <td class="text-center">댓글이 없습니다</td>
                  </tr>
               </table>
            </c:if>
            <c:if test="${count>0 }">
               <table class="table">
                  <tr>
                     <td>
                        <c:forEach var="rvo" items="${list }">
                           <table class="table">
                              <tr>
                                 <td class="text-left">
                                  <c:if test="${rvo.group_tab > 0 }">
                                     <c:forEach var="i" begin="1" end="${rvo.group_tab }">
                                        &nbsp;&nbsp;
                                     </c:forEach>
                                     <img src="../img/re_icon.png">
                                  </c:if>
                                 <img src="../img/user.jpg"><span style="color:orange">${rvo.name }</span>&nbsp;(${rvo.dbday })
                                 <pre style="white-space: pre-wrap; background-color: white; border: none;">${rvo.msg }</pre>
                                 </td>
                                 <td class="text-right">
                                    <c:if test="${sessionScope.id != null }">
                                       <c:if test="${sessionScope.id == rvo.id }">
                                          <span class="whitegray_btn ups" data-no="${rvo.rno }">수정</span>
                                          <a href="../board/reply_delete.do?rno=${rvo.rno }&bno=${vo.bno}" class="whitegray_btn">삭제</a>
                                       </c:if>
                                       <span class="whitegray_btn replys" data-no="${rvo.rno }">댓글</span>
                                    </c:if>
                                 </td>
                              </tr>
                              <%-- <tr>
                                 <td colspan="2">
                                    <pre style="white-space: pre-wrap; background-color: white; border: none">${rvo.msg }</pre>
                                 </td>
                              </tr> --%>
                              <%-- 대댓글 --%>
                              <tr id="r${rvo.rno }" class="rinsert" style="display:none">
                                 <td colspan="2" style="height:15px;">
                                    <form method="post" action="../board/reply_reply_insert.do">
                                       <input type=hidden name="bno" value="${vo.bno }">
                                       <input type="hidden" name="pno" value="${rvo.rno }">
                                       <textarea rows="3" cols="80" name="msg" style="float: left"></textarea>
                                       <input type="submit" value="댓글쓰기" class="whitegray_btn" style="height: 65px">
                                    </form>
                                 </td>
                              </tr>
                              <%-- 수정 --%>
                              <tr id="u${rvo.rno }" class="rupdate" style="display:none">
                                 <td colspan="2">
                                    <form method="post" action="../board/reply_update.do">
                                       <input type=hidden name="bno" value="${vo.bno }">
                                       <input type=hidden name="rno" value="${rvo.rno }">
                                       <textarea rows="3" cols="80" name="msg" style="float: left">${rvo.msg }</textarea>&nbsp;
                                       <input type="submit" value="수정" class="btn btn-sm btn-danger" style="height: 65px">
                                    </form>
                                 </td>
                              </tr>
                           </table>
                        </c:forEach>
                     </td>
                  </tr>
               </table>
            </c:if>
            <c:if test="${sessionScope.id!=null }">
               <table class="table">
                  <tr>
                     <td>
                        <form method="post" action="../board/reply_insert.do">
                           <input type=hidden name="bno" value="${vo.bno }">
                           <textarea rows="3" cols="80" name="msg" style="float: left"></textarea>&nbsp;
                           <input type="submit" value="댓글쓰기" class="whitegray_btn" style="height: 65px;">
                        </form>
                     </td>
                  </tr>
               </table>
            </c:if>
         </div>
  </main>
</div>

</body>
</html>