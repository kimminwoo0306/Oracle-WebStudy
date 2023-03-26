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
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
*{
	font-family:'Noto Sans KR', sans-serif;
	margin:0;
	padding:0;
	font-size:16px;
	color:black;
	text-decoration:none;
}
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
    <div style="height: 550px; margin-bottom: 160px">
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
    	 	<th width=15% class="text-center">번호</th>
    	 	<th width=35% class="text-center">제목</th>
    	 	<th width=10% class="text-center">작성자</th>
    	 	<th width=15% class="text-center">작성일</th>
    	 	<th width=10% class="text-center">조회수</th>
    	 	<th width=15% class="text-center">첨부파일</th>
    	 </tr>
    	 <%--
    	 		for(FreeBoardVO vo:request.getAttribute("list"));
    	  --%>
    	 <c:forEach var="vo" items="${list }"> <%-- request.setAttribute("list", list)  => request.getAttribute("list") == ${list }--%>
    	 	<tr>
    	 		<td width="15%" class="text-center">${vo.bno }</td> <%-- vo.getNo() --%>
    	 		<td width="35%" style="color: black; padding:15px 15px 15px 50px;" class="text-left">
    	 		
    	 		<a href="../board/detail.do?bno=${vo.bno }"style="color: black">${vo.title }</a> &nbsp;
    	 		<c:if test="${vo.dbday==today }">
    	 			<img src="../img/new.gif">
    	 		</c:if>
    	 		</td>
    	 		<td width="10%" class="text-center">${vo.id }</td>
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
    				<a href="../board/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm" style="background-color:#004fff;">이전</a>
    				${curpage } 페이지 / ${totalpage } 페이지
    				<a href="../board/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm" style="background-color:#004fff;">다음</a>
    			</td>
    		</tr>
    	</table>
    	
    	<div class="search-box">
			  <form action="../board/find.do" method="post">
			  <table style="margin-left:auto;margin-right:auto;">
			   <tr>
			    <td style="margin:10px">
			  	<select class="form-control" name="field">
					<option value="0">선택</option>
					<option value="b_title">제목</option>
				</select>
				</td>
				<td style="margin:10px">
			   	 <input class="form-control" type="text" placeholder="게시글 제목 검색" name="ss" value="${ss }">
			   	</td>
			   	<td style="margin:10px">
				   <button class="whitegray_btn" type="submit" style="padding:5px">검색</button>
				</td>
				</tr>
				</table>
			  </form>
		</div>
	  </main>
  </div>
</body>
</html>