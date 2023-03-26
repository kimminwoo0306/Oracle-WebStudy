<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">

h2{
margin:60px 0;
}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 15px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
}
</style>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
    <h2 class="sectiontitle">공지사항</h2>
    <div style="height: 5px"></div>
    <div style="height: 550px; margin-bottom: 160px">
    	<table class="table" style="padding:10px;">
    	 <tr>
    	 	<th width=15% class="text-center">구분</th>
    	 	<th width=35% class="text-center">제목</th>
    	 	<th width=10% class="text-center">이름</th>
    	 	<th width=15% class="text-center">작성일</th>
    	 	<th width=10% class="text-center">조회수</th>
    	 	<th width=15% class="text-center">첨부파일</th>
    	 </tr>
    	 <%--
    	 		for(FreeBoardVO vo:request.getAttribute("list"));
    	  --%>
    	 <c:forEach var="vo" items="${list }"> <%-- request.setAttribute("list", list)  => request.getAttribute("list") == ${list }--%>
    	 	<tr>
    	 		<td width="15%" class="text-center">${vo.prefix }</td> <%-- vo.getNo() --%>
    	 		<td width="35%" style="color: black; padding:15px 15px 15px 50px;" class="text-left"">
    	 		
    	 		<a href="../notice/detail.do?nno=${vo.nno }"style="color: black">${vo.title }</a> &nbsp;
    	 		<c:if test="${vo.dbday==today }">
    	 			<sup><img src="../img/new.gif"></sup>
    	 		</c:if>
    	 		</td>
    	 		<td width="10%" class="text-center">${vo.name }</td>
    	 		<td width="15%" class="text-center">${vo.dbday }</td>
    	 		<td width="10%" class="text-center">${vo.hit }</td>
    	 		<td width="15%" class="text-center">
    	 			<c:if test="${vo.filesize>0 }">
    	 				<img src="../img/file.png" style="width:20px;height:20px" class="img-circle">
    	 			</c:if>
    	 		</td>
    	 	</tr>
    	 </c:forEach>
    	</table>
    	</div>
    	<table class="table">
    		<tr>
    			<td class="text-center" style="padding:30px;">
    				<a href="../notice/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm" style="background-color:#004fff;">이전</a>
    				${curpage } 페이지 / ${totalpage } 페이지
    				<a href="../notice/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm" style="background-color:#004fff;">다음</a>
    			</td>
    		</tr>
    	</table>
  </main>
  </div>
</body>
</html>