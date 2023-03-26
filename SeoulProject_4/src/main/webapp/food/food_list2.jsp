<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    <!-- ################################################################################################ --> 
  </div>
</div>
<div class="wrapper row3">
  <main class="container clear"> 
    <div class="jumbotron">
      <h3 class="text-center">${vo.title }</h3>
      <h4 class="text-center">${vo.subtitle }</h4>
    </div>
    <table class="table">
      <tr>
        <td>
          <c:forEach var="fvo" items="${list }">
            <table class="table">
              <tr>
                <td width="30%" class="text-center" rowspan="4">
                  <a href="../food/food_find_before_detail.do?fno=${fvo.fno }"><img src="${fvo.poster }" style="width: 300px;height: 160px" class="img-rounded"></a>
                </td>
                <td width=70% class="inline text-left"><h4><a href="../food/food_find_before_detail.do?fno=${fvo.fno }"><span style="color:black">${fvo.name }</span></a>&nbsp;</h4>
                  <%-- <img src="../food/img/like1.png" style="width: 35px;height: 35px;padding-right:10px" title=${fvo.count }>--%>
                </td>
              </tr>
              <tr>
                <td width=70% class="text-left">${fvo.addr }</td>
              </tr>
              <tr>
                <td width=70% class="text-left">${fvo.tel }</td>
              </tr>
              <tr>
                <td width=70% class="text-left">${fvo.type }</td>
              </tr>
            </table>
          </c:forEach>
        </td>
      </tr>
    </table>
  </main>
</div>
</body>
</html>








