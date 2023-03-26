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
.whitegray_btn{
	/* width:15px; */
	 padding : 3px 8px 3px 8px;
	 margin : 1px 1px 1px 1px; 
}
h2{
margin:60px 0;
}
</style>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear" style="width:900px;position:relative;left:-10px;">
    <h2 class="sectiontitle">공지사항</h2>
    <div style="height: 5px"></div>

    <table class="table">
    	<tr>
    		<th width=20% class="text-center">번호</th>
    		<td width=30% class="text-left">${vo.nno }</td>
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
    		<td class="text-left" valign="top" colspan="4" height="200"><pre style="white-space: pre-wrap;background-color:white;border:none">${vo.content }</pre></td>
    	</tr>
    	<tr>
    		<td class="text-right" colspan="4">
    		<a href="../adminpage/notice_list.do" class="whitegray_btn">목록</a>
    		</td>
    	</tr>
    </table>

  </main>
</div>

</body>
</html>