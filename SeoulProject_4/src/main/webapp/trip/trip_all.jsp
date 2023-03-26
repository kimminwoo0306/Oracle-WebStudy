<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울99여행</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
.container a{
   color:black;
   text-decoration:none;
}
.trip_side{
   position:relative;
   width:20%;
   height:800px;
   float:left;
}
.tripCategory_section{
   position:absolute;
}
.trip_side h4{
   margin: 0 0 20px 0;
}
.trip_side li{
   margin: 0 0 10px 0;
}
.trip_side a:hover{
   color: #004fff;
}
.trip_content{
   width:80%;
   float:right;
}
.content_title{
   margin:0 0 30px 0;
}

/* 이미지리스트 */

.content_allItem{
 width:100%;
 height:100%;
 clear:both;
}
.content_allItem>.content_item{
 width:270px;
 height:270px;
 float:left;
 margin: 0 30px 30px 0;
 box-shadow : 0 5px 10px 0 rgb(0,0,0,0.2);
 
 position:relative;
}

.content_allItem .content_item img{
 display:inline-block;
 vertical-align:middle;
 width:100%;
 height:170px;
 object-fit:fit;
 
}

.item_name{
   margin: 20px 20px 10px 20px;
}
.content_allItem .item_info{
   margin: 0 20px 20px 20px;
}

.item_info .gu{
   color : #004fff;
   font-size:14px;
}
.item_info .hit{
   color : gray;
   font-size:14px;
   float:right;
}
/* 페이지 넘버링 */
.pagination{

   margin: 0 0 0 -20px;
   width:100%;
   text-align: center;
}
.pagination ul{
   display:inline-block;
   margin: 20px auto;
   
   text-align:center;
}
.pagination ul li{
   float:left;
   
   display:inline-block;
}
.pagination ul li i{
   font-size: 16px;
}
.pagination ul li a{
    padding: 10px 17px;
    border-radius: 50px;
    display: block;

}
.pagination ul li a:hover{
   background:lightgray;
}
.curpage a{
   color: #004fff;
}
</style>
<script type="text/javascript" src="http://code.jquery.con/jquery.js"></script>
<script type="text/javascript">

$(function(){
 	if($('#tcCheck').attr("tcno")==1)
	{
		$('#tc1').css("color","#004fff")
	}
	if($('#tcCheck').attr("tcno")==2)
	{
		$('#tc2').css("color","#004fff")
	}
	if($('#tcCheck').attr("tcno")==3)
	{
		$('#tc3').css("color","#004fff")
	}
	if($('#tcCheck').attr("tcno")==4)
	{
		$('#tc4').css("color","#004fff")
	}
})

</script>
</head>
<body>
<div class="container">


	  <input type=hidden tcno=${tcno } id="tcCheck">
	  
      <h1 class="allTopTitle">${content_title }</h1>
      
	  
      <div class="trip_side">

	        <div class="tripCategory_section">
	          <h4>여행지 카테고리</h4>
	          <ul>
	            <li><a id="tc1" class="tripCate" href="../trip/trip_all.do?tcno=1">명소</a></li>
	            <li><a id="tc2" class="tripCate" href="../trip/trip_all.do?tcno=2">자연</a></li>
	            <li><a id="tc3" class="tripCate" href="../trip/trip_all.do?tcno=3">즐길거리</a></li>
	            <li><a id="tc4" class="tripCate" href="../trip/trip_all.do?tcno=4">쇼핑</a></li>
	          </ul>
	        </div>
	        
	        <!-- 카테고리 내 검색 -->
	        <form method="post" action="../trip/trip_all_search.do">
	          <div style="position:absolute;top:30%;">
	            <h4><span style="color:#004fff;font-size:18px;">${tripCategory_name }</span>에서 검색하기</h4>
	            <input id="srhWord" type="text" name="searchWord" size=15 value="${searchWord}" minlength="2" style="height:30px;border-radius:4px;border:1px solid gray;" autocomplete="off">
	            <input type="hidden" name="tcno" value="${tcno }">
	            <input type="hidden" name="tripCategory_name" value="${tripCategory_name }">
	            <input type="hidden" name="content_title" value="${content_title }">
	          </div>
	        </form>

      </div>
      
      
      <div class="trip_content" id="Print">
      

	         <div class="content_allItem">
	            <c:forEach var="vo" items="${list }">
	              <div class="content_item">
	                <a href="../trip/trip_before_detail.do?tno=${vo.tno }">
	                   <img src="${vo.image }">
	                   <h4 class="item_name">${vo.name }</h4>
	                    <div class="item_info">
	                        <span class="gu">서울 ${vo.addr }</span><span class="hit">&nbsp;&nbsp;조회수 ${vo.hit}</span> 
	                    </div>
	                 </a>
	              </div>
	            </c:forEach>
	         </div>
  
         
            <!-- 페이지네이션 -->
            <div class="pagination">
              <ul>
                 <li><a href="../trip/trip_all.do?tcno=${tcno }&page=1"><i class="fa-solid fa-angles-left"></i></a></li>
                 <c:choose>
                      <c:when test="${startpage<=1 }">
                         <li><a href="../trip/trip_all.do?tcno=${tcno }&page=1"><i class="fa-solid fa-angle-left"></i></a></li>
                      </c:when>
                      <c:when test="${startpage>1 }">
                         <li><a href="../trip/trip_all.do?tcno=${tcno }&page=${startpage-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
                      </c:when>
                 </c:choose>
                 <c:forEach var="i" begin="${startpage }" end="${endpage }">
                     <li ${i==curpage?"class=curpage":"" }><a href="../trip/trip_all.do?tcno=${tcno }&page=${i }">${i }</a></li>
                 </c:forEach>
                 <c:choose>
                    <c:when test="${endpage<totalpage }">
                       <li><a href="../trip/trip_all.do?tcno=${tcno }&page=${endpage+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
                    </c:when>
                    <c:when test="${endpage==totalpage }">
                       <li><a href="../trip/trip_all.do?tcno=${tcno }&page=${endpage }"><i class="fa-solid fa-angle-right"></i></a></li>
                    </c:when>
                 </c:choose>
                 <li><a href="../trip/trip_all.do?tcno=${tcno }&page=${totalpage}"><i class="fa-solid fa-angles-right"></i></a></li>
              </ul>
            </div>
            
            

      </div>
         
      
      
</div>
</body>
</html>