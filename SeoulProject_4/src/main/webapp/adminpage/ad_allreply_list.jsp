<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
#tt{
  color:black;
  
}
</style>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.del').click(function(){
		let no=$(this).attr("data-no");
		$.ajax({
			type:'post',
			url:'../adminpage/notice_delete.do',
			data:{"no":no},
			success:function(result)
			{
				reload()
			}
		})
	})
})
</script> -->
</head>
<body>
<div class="wrapper row3">
  <main class="container clear" style="width:900px;position:relative;left:20px;">
  <h2 class="sectiontitle text-left">서울여행/맛집 댓글</h2>
  <div style="height: 5px"></div>
  <div style="height: 550px; margin-bottom: 200px;">
  
  <table class="table">
    <tr>
      <th width=10% class="text-center">번호</th>
      <th width=10% class="text-center">구분</th>
      <th width=20% class="text-center">내용</th>
      <th width=15% class="text-center">이름</th>
      <th width=30% class="text-center">작성일</th>
      <th width=15% class="text-center"></th>
    </tr>
    <%--
       for(FreeBoardVO vo:request.getAttribute("list"))
    --%>
    <c:forEach var="vo" items="${list }"><%-- request.setAttribute("list",list) => request.getAttribute("list") ${list} --%>
      <tr>
        <td width="10%" class="text-center">${vo.arno}</td>
        <c:if test="${vo.cate_no==1 }">
          <td width="10%" class="text-center">서울여행</td>
        </c:if>
        <c:if test="${vo.cate_no==2 }">
          <td width="10%" class="text-center">맛집</td>
        </c:if>
        <td width="40%" >${vo.msg }</td>
        
        <td width="15%" class="text-center">${vo.name }(${vo.id })</td>
        <td width="10%" class="text-center">${vo.dbday }</td>
        <td width="15%" class="text-center">
          <a href="../adminpage/ad_all_reply_delete.do?arno=${vo.arno }" class="btn btn-xs btn-info">삭제</a>
        </td>
      </tr>
    </c:forEach>
  </table>
  </div>
  <table class="table">
    <tr>
      <td class="text-center">
       <a href="../adminpage/ad_all_reply_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
        ${curpage } page / ${totalpage } pages
       <a href="../adminpage/ad_all_reply_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
      </td>
    </tr>
  </table>
  </main>
</div>

</body>
</html>