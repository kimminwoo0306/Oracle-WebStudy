<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>서울99여행</title>
<style type="text/css">
*{
	margin:0;
	padding:0;
	list-style: none;
	border-collapse: collapse;
	text-decoration: none;
	font-size:16px;
	color: black;
}

</style>
</head>
<body>
<div class="container">
  <header class="heading">
   <form method=post action="../food/food_location.do" class="inline">
     <input type=text name="ss" size=25 class="input-sm" value="${ss }">
     <input type=submit value="검색">
   </form>
  </header>

      <ul class="f_loc">
      <c:forEach var="vo" items="${list }" >
      </c:forEach>
      <a href="../food/food_detail.do?=${vo.fno }">
      <img src="${vo.poster }"></a>
      </ul>
   <!-- 다시 ....하기 왜 한줄로 출력될까..? one_quarter~~는 다른 템플릿 파일 필요 -->
    <c:forEach var="vo" items="${list }" varStatus="s">
          <li class="one_quarter ${s.index%4==0?'first':'' }"><a href="../food/food_detail.do?=${vo.fno }"><img src="${vo.poster }" title="${vo.name }"></a></li>
    </c:forEach>
   
</div>
</body>
</html>