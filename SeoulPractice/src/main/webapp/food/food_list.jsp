<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울 맛집 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	width:1200px;
}
.route{
	width:100%;
	margin-top:40px;
}
.food_toptitle{
	width:100%;
	margin:60px 0;
	line-height:36px;
}
*{

width:1200px;
heigth: 1100px;
bolder: 10px solid black;
    
}
div.container{
  width:1200px;
  heigth: 1100px;
  bolder: 10px solid black;
  
}
div.li_header{
  position:fixed;
  top:0;left:0;
  width: 1200px;
  height:100px;
  background-color:#E6E6E6;
  
  color: black;
}
.list_title{
  text-align:center;
  font-size: 18px; 
  background-color:#E6E6E6;
}
.list_subtitle{
   text-align:center;
  background-color:#E6E6E6;
}
.li_section{
  width: 100%;
  height: 800px;
 
  padding-top: 105px;
  background-color: 
}
.li_footer{
  width: 100%;
  height: 100px;
  
}
</style>
</head>
<body>

<div class="container">
  <div class="li_header">
    <h1 class="list_title">${vo.title}</h1>
    <h4 class="list_subtitle">${vo.subtitle}</h4>
    </div>
  <div class="li_section">
     <hr style="bolder: dotted 10px;">
    <table class="table">
       
      <tr>
        <td>
          <c:forEach var="fvo" items="${list }">
            <table class="table">
              <tr>
                <td width="30%" class="text-center" rowspan="4">
                  <a href="../food/food_detail.do?fno=${vo.fno }"><img src="${fvo.poster }" style="width: 300px;height: 160px" class="img-rounded"></a>
                </td>
                <td width=70%><h4><a href="../food/food_detail.do?fno=${fvo.fno }">${fvo.name }</a>&nbsp;<span style="color:orange">${fvo.score }</span></h4></td>
                
              </tr>
              <tr>
                <td width=70%>${fvo.addr }</td>
              </tr>
              <tr>
                <td width=70%>${fvo.tel }</td>
              </tr>
              <tr>
                <td width=70%>${fvo.type }</td>
              </tr>
            </table>
          </c:forEach>
        </td>
      </tr>
    </table>
    
  </div>
  <div class="li_footer">
    <hr style="bolder: dotted 10px;">
   <br>실시간 인기검색 키워드
    <a href="#">#!!!!!#!!!!!</a>
  </div>
</div>
  
  <div class="container">
  <header class="heading">
   <form method=post action="../food/food_location.do" class="inline">
     <input type=text name="ss" size=25 class="input-sm" value="${ss }">
     <input type=submit value="검색">
   </form>
  </header>
<script type="text/javascript">
</script>
</body>
</html>