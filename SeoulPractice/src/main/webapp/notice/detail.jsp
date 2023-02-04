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
.btn {
  flex: 1 1 auto;
  margin: 10px;
  padding: 30px;
  text-align: center;
  text-transform: uppercase;
  transition: 0.5s;
  background-size: 200% auto;
  color: white;
 /* text-shadow: 0px 0px 10px rgba(0,0,0,0.2);*/
  box-shadow: 0 0 20px #eee;
  border-radius: 10px;
 }

/* Demo Stuff End -> */

/* <- Magic Stuff Start */

/* .btn:hover 
  background-position: right center; /* change the direction of the change here 
}
*/

a.whitegray_btn{
   padding: 5px 10px;
   margin: 5px 5px;
}
</style>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
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
    	     	<a href="../notice/list.do" class="whitegray_btn">목록</a>
    		</td>
    	</tr>
    </table>
  </main>
</div>

</body>
</html>