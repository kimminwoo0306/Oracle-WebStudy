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
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">Lorem</a></li>
      <li><a href="#">Ipsum</a></li>
      <li><a href="#">Dolor</a></li>
    </ul>
    <!-- ################################################################################################ --> 
  </div>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<!-- private int no, goods_discount,hit,account;
	private String goods_name, goods_sub, goods_price,goods_first_price,goods_delivery,goods_poster; -->
<div class="wrapper row3">
  <main class="container clear">
    <h2 class="sectiontitle">상품 상세보기</h2>
    <div style="height: 5px"></div>
    <table class="table">
     <tr>
       <td width=30% class="text-center" rowspan="6">
         <img src="${vo.goods_poster }" style="width:100%">
       </td>
       <td colspan="2">
         <h3>${vo.goods_name }</h3>
         <sub style="color:gray">${vo.goods_sub }</sub>
       </td>
     </tr>
     <tr>
       <td colspan="2"><h3><span style="color:magenta">${vo.goods_discount }%</span>&nbsp;${vo.goods_price }</h3></td>
     </tr>
     <tr>
       <td colspan="2" class="inline"><h3><span style="color:green">첫구매할인가</span>&nbsp;</h3>${vo.goods_first_price }</td>
     </tr>
     <tr>
       <td width="20%">배송</td>
       <td width="80%">${vo.goods_delivery }</td>
     </tr>
     <tr>
       <td colspan="2" class="text-center inline" >
        수량:
         <select name="account" class="input-sm">
           <c:forEach var="i" begin="1" end="${vo.account }">
             <option>${i }개</option>
           </c:forEach>
         </select>
       </td>
     </tr>
     <tr>
       <td colspan="2" class="text-center">
         <input type="button" value="장바구니" class="btn btn-lg btn-success">
         <input type="button" value="구매하기" class="btn btn-lg btn-danger">
       </td>
     </tr>
    </table>
</body>
</html>


















