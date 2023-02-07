<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
    <h2 class="sectiontitle">자유 게시판</h2>
    <div style="height: 5px"></div>
    <div style="height: 550px">
    	<table class="table">
    		<tr>
    		<c:if test="${sessionScope.id==null }">
    		<td><span class="whitegray_btn" style="float:left">글쓰기</span> &nbsp; <span style="margin:0 20px;float:left;line-height:46px;color:gray;">로그인 후 이용 가능합니다</span></td>
    		</c:if>
    		<c:if test="${sessionScope.id!=vo.id }">
    			<td>
    				<a href="../board/insert.do" class="whitegray_btn" style="float:left">글쓰기</a>
    			</td>
    		</c:if>
    		</tr>
    	</table>
    	<table class="table">
    	 <tr>
    	 	<th width=10% class="text-center">번호</th>
    	 	<th width=30% class="text-center">제목</th>
    	 	<th width=15% class="text-center">작성자</th>
    	 	<th width=15% class="text-center">작성일</th>
    	 	<th width=10% class="text-center">조회수</th>
    	 	<th width=20% class="text-center">첨부파일</th>
    	 </tr>
    	 <%--
    	 		for(FreeBoardVO vo:request.getAttribute("list"));
    	  --%>
    	 <c:forEach var="find" items="${list }"> <%-- request.setAttribute("list", list)  => request.getAttribute("list") == ${list }--%>
    	 	<tr>
    	 		<td width="10%" class="text-center">${find.bno }</td> <%-- vo.getNo() --%>
    	 		<td width="30%" style="color: black">
    	 		
    	 		<a href="../board/detail.do?bno=${find.bno }"style="color: black">${find.title }</a> &nbsp;
    	 		<c:if test="${find.dbday==today }">
    	 			<sup><img src="../img/new.gif"></sup>
    	 		</c:if>
    	 		</td>
    	 		<td width="15%" class="text-center">${find.id }</td>
    	 		<td width="15%" class="text-center">${find.dbday }</td>
    	 		<td width="10%" class="text-center">${find.hit }</td>
    	 		<td width="20%" class="text-center">
    	 			<c:if test="${find.filesize>0 }">
    	 				<img src="../img/file.png" style="width:20px;height:20px" class="img-circle">
    	 			</c:if>
    	 		</td>
    	 	</tr>
    	 </c:forEach>
    	</table>
    	</div>
    	<table class="table" height="60px;">
    		<tr>
    			<td class="text-center">
    				<a href="../board/find.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm" style="background-color:#004fff;">이전</a>
    				${curpage } 페이지 / ${totalpage } 페이지
    				<a href="../board/find.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm" style="background-color:#004fff;">다음</a>
    			</td>
    		</tr>
    	</table>
    	
    	 <div class="search-box">
			  <form action="../board/find.do" method="post">
			  <table style="margin-left:auto;margin-right:auto;">
			   <tr>
			    <td style="margin:10px">
			  	<select class="form-control" name="searchField">
					<option value="0">선택</option>
					<option value="b_title">제목</option>
				</select>
				</td>
				<td style="margin:10px">
			   	 <input class="form-control" type="text" placeholder="게시글 제목 검색" name="ss" value="${ss }">
			   	</td>
			   	<td style="margin:10px">
			  	  <button class="search-btn" type="submit">
				   <i class="fas fa-search"></i>
				  </button>
				</td>
				</tr>
				</table>
			  </form>
		</div>
  </main>
  </div>
</body>
</html>