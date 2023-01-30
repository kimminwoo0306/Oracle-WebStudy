<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
    <h2 class="sectiontitle">공지사항</h2>
    <div style="height: 5px"></div>
    <div style="height: 550px">
    <table class="table">
    	<tr>
    		<th width=20% class="text-center">번호</th>
    		<td width=30% class="text-center">${vo.nno }</td>
    		<th width=30% class="text-center">작성일</th>
    		<td width=30% class="text-center">${vo.dbday }</td>
    	</tr>
    	<tr>
    		<th width=20% class="text-center">이름</th>
    		<td width=30% class="text-center">${vo.name }</td>
    		<th width=30% class="text-center">조회수</th>
    		<td width=30% class="text-center">${vo.hit }</td>
    	</tr>
    	<tr>
    		<th width=20% class="text-center">제목</th>
    		<td colspan="3" class="text-center">${vo.title }</td>
    	</tr>
    	<tr>
    		<td class="text-left" valign="top" colspan="4" height="200"><pre style="white-space: pre-wrap;background-color:white;border:none">${vo.content }</pre></td>
    	</tr>
    	<tr>
    		<td class="text-right" colspan="4">
    		<a href="../notice/update.do" class="btn btn-xs btn-success">수정</a>
    		<a href="../notice/delete.do" class="btn btn-xs btn-warning">삭제</a>
    		<a href="../notice/list.do" class="btn btn-xs btn-info">목록</a>
    	</tr>
    </table>
  </main>
</div>

</body>
</html>