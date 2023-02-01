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
.route{
	/* 페이지 경로 */
	width:100%;
	margin-top:40px;
}

.trip_toptitle{
	width:100%;
	margin:60px 0;
	line-height:36px;
	
	/*background:yellow;*/
}
.filterbar{
	width:100%;
	margin-bottom:30px;
	
	/*background:lightblue;*/
}
.trip_side{
	position:relative;
	width:20%;
	height:800px;
	float:left;
	
	/*background:pink;*/
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
.tripScore_section{
	position:absolute;
	top:35%;
}
.trip_content{
	width:80%;
	float:right;
	
	/* background:lightgray; */
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
	
	/* background: lightgray; */
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
    
/*  background: yellow;
    border: 1px solid black; */
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

})

</script>
</head>
<body>
<div class="container">


		<div class="route">
		 <a href="">홈</a>&nbsp;&nbsp;>&nbsp;&nbsp;
		 <a href="">여행지</a>
		</div>
		
		
		<h1 class="trip_toptitle">${content_title }</h1>
		<div class="filterbar">
		<!--  -->
			
		</div>
		<div class="trip_side">

		  <div class="tripCategory_section">
		  	<h4>여행지 카테고리</h4>
		    <ul>
				<li><a class="tripCate" href="../trip/trip_all.do?tcno=1">명소</a></li>
				<li><a class="tripCate" href="../trip/trip_all.do?tcno=2">자연</a></li>
				<li><a class="tripCate" href="../trip/trip_all.do?tcno=3">즐길거리</a></li>
				<li><a class="tripCate" href="../trip/trip_all.do?tcno=4">쇼핑</a></li>
		    </ul>
		  </div>
		  <div class="tripScore_section">
		  	<h4>여행지 평가</h4>
		  	<ul>
			    <li>전체보기</li>
			    <li>좋아요</li>
			    <li>보통이에요</li>
			    <li>아쉬워요</li>
		    </ul>
		  </div>
		</div>
		<div class="trip_content" id="Print">
		
 			<!-- 3*3 정렬 -->
			<div class="content_allItem">
			   <c:forEach var="vo" items="${list }">
			 	 
				 <div class="content_item">
				    <button class="jjim_btn"><i class="fa-sharp fa-solid fa-heart"></i></button>
				    
				    <a href="../trip/trip_detail.do?tno=${vo.tno }">
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