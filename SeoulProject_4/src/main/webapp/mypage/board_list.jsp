<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="container">
  <div class="wrapper row3">
    <main class="container clear" style="position:relative;width:80%;left:-100px;">
     <h2 class="sectiontitle text-left">내가 쓴글</h2>
     <div style="height: 30px"></div>
     <table class="table">
    	 <tr>
    	 	<th width=10% class="text-center">번호</th>
    	 	<th width=30% class="text-center">제목</th>
    	 	<th width=15% class="text-center">이름</th>
    	 	<th width=15% class="text-center">작성일</th>
    	 	<th width=10% class="text-center">조회수</th>
    	 	<th width=20% class="text-center">첨부파일</th>
    	 </tr>
    	 <%--
    	 		for(FreeBoardVO vo:request.getAttribute("list"));
    	  --%>
    	 <c:forEach var="vo" items="${list }"> <%-- request.setAttribute("list", list)  => request.getAttribute("list") == ${list }--%>
    	 	<tr>
    	 		<td width="10%" class="text-center">${vo.bno }</td> <%-- vo.getNo() --%>
    	 		<td width="30%" style="color: black">
    	 		
    	 		<a href="../mypage/my_detail.do?bno=${vo.bno }"style="color: black">${vo.title }</a> &nbsp;
    	 		<c:if test="${vo.dbday==today }">
    	 			<sup><img src="../img/new.gif"></sup>
    	 		</c:if>
    	 		</td>
    	 		<td width="15%" class="text-center">${name }</td>
    	 		<td width="15%" class="text-center">${vo.dbday }</td>
    	 		<td width="10%" class="text-center">${vo.hit }</td>
    	 		<td width="20%" class="text-center">
    	 			<c:if test="${vo.filesize>0 }">
    	 				<img src="../img/file.png" style="width:20px;height:20px" class="img-circle">
    	 			</c:if>
    	 		</td>
    	 	</tr>
    	 </c:forEach>
    	</table>
    </main>
  </div>
  </div>
</body>
</html>