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
    <main class="container clear" style="position:relative;width:90%;left:-90px;">
     <h2 class="sectiontitle text-left">맛집 관심 목록</h2>
     <div style="height: 30px"></div>
     <table class="table">
       <tr>
        <th class="text-center">번호</th>
        <th class="text-center"></th>
        <th class="text-center">업체명</th>
        <th class="text-center">주소</th>
        <th class="text-center">전화</th>
        <th class="text-center"></th>
       </tr>
       <c:forEach var="vo" items="${list }">
         <tr>
	        <td class="text-center">${vo.ajno }</td>
	        <td class="text-center">
	         <img src="${vo.poster }" style="width:30px;height: 30px">
	        </td>
	        <td>${vo.name }</td>
	        <td>${vo.addr}</td>
	        <td class="text-left">${vo.tel }</td>
	        <td class="text-center">
	         <a href="../mypage/food_jjim_delete.do?ajno=${vo.ajno }" class="btn btn-xs btn-warning">취소</a>
	        </td>
	       </tr>
       </c:forEach>
     </table>
    </main>
  </div>
  </div>
</body>
</html>