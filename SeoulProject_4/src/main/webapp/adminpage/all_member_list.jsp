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
  <main class="container clear" style="width:900px;position:relative;left:-10px;">
  <h2 class="sectiontitle text-left">회원 목록(${count }명)</h2>
  <div style="height: 5px"></div>
  <div style="height: 550px; ">
  
  <table class="table">
    <tr>
      <th width=10% class="text-center">아이디</th>
      <th width=10% class="text-center">이름</th>
      <th width=10% class="text-center">성별</th>
      <th width=20% class="text-center">이메일</th>
      <th width=20% class="text-center">연락처</th>
      <th width=20% class="text-center">구분</th>
      <th width=10% class="text-center"></th>
    </tr>
    <%--
       for(FreeBoardVO vo:request.getAttribute("list"))
    --%>
    <c:forEach var="vo" items="${list }"><%-- request.setAttribute("list",list) => request.getAttribute("list") ${list} --%>
      <tr>
        <td width="10%" class="text-center">${vo.id}</td><%-- vo.getNo() = {} getXxx() --%>
        <td width="10%">${vo.name }</td>
        <td width="10%" class="text-center">${vo.sex }</td>
        <td width="30%" class="text-center">${vo.email }</td>
        <td width="20%" class="text-center">${vo.phone }</td>
        <c:if test="${vo.admin=='y' }">
        <td width="20%" class="text-center">관리자</td>
        </c:if>
        <c:if test="${vo.admin=='n' }">
        <td width="20%" class="text-center">일반</td>
        </c:if>
      </tr>
    </c:forEach>
  </table>
  </div>
  <table class="table">
    <tr>
      <td class="text-center">
       <a href="../adminpage/ad_member_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
        ${curpage } page / ${totalpage } pages
       <a href="../adminpage/ad_member_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
      </td>
    </tr>
  </table>
  </main>
</div>

</body>
</html>