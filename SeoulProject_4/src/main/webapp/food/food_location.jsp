<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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

body {
  font-family:'Noto Sans KR', sans-serif;
  
}

.wrapper {
  width: 1200px;
  max-width: 60rem;
  margin: 6rem auto;
  
}

.label {
  font-size: .625rem;
  font-weight: 400;
  text-transform: uppercase;
  letter-spacing: +1.3px;
  margin-bottom: 1rem;
}

.searchBar {
  width: 100%;
  display: flex;
  flex-direction: row;
  align-items: center;
}

#searchQueryInput {
  width: 100%;
  height: 2.8rem;
  background: #f5f5f5;
  outline: none;
  border: none;
  border-radius: 1.625rem;
  padding: 0 3.5rem 0 1.5rem;
  font-size: 18px;
}

#searchQuerySubmit {
  width: 3.5rem;
  height: 2.8rem;
  margin-left: -3.5rem;
  background: none;
  border: none;
  outline: none;
}

#searchQuerySubmit:hover {
  cursor: pointer;
}
.route{
	/* 페이지 경로 */
	width:100%;
	margin-top:40px;
	
	/*background:lightblue;*/
}
.route a{
	color:black;
}
.food_toptitle{
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
.container .food_side{
	position:relative;
	width:20%;
	height:800px;
	float:left;
	
	/*background:pink;*/
}
.food_category{
	position:absolute;
}
.food_score{
	position:absolute;
	top:30%;
}
.food_content{
	width:80%;
	float:right;
	
	/* background:lightgray; */
}
.content_title{
	margin:0 0 30px 0;
}

/* 이미지리스트 */


.content_item{
 width:100%;
 height:100%;
 clear:both;
}
.content_item>div{
 width:270px;
 height:270px;
 float:left;
 margin: -29px 30px 100px 0;
 box-shadow : 0 5px 10px 0 rgb(0,0,0,0.2);
 
 position:relative;
/*
 line-height:270px;
 text-align:center;
*/
}
.content_item div:nth-child(3n){
/*margin: 15px 0;*/
}

.content_item div img{
 display:inline-block;
 vertical-align:middle;
 width:100%;
 height:170px;
 object-fit:fit;
 
}


.item_name{
	margin: 20px 20px 10px 20px;
	color: black;
}
div.item_info{
	margin: 0 20px 20px 20px;
}


.item_info .score,i.fa-star{
	color : #004fff;
	font-weight : bold;
	font-size:14px;
}
.item_info .hit{
	color : gray;
	font-size:14px;
}
.content_item a{
	margin:0; padding:0;
	color:black;
	text-decoration:none;
}

.pagination{

	margin: -550px 35px 0 0;
	display:block;
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
.pagination ul li a{
 	padding: 10px 17px;
    border-radius: 50px;
    display: block;
    color:black;
    
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
</head>
<body>
<div class="container">
 <header class="heading">
   <form method=post action="../food/food_location.do" class="inline">
     
     <%-- (나중에 정리) --%>
   
        
        <%-- 검색창 다시. 위치 조정--%>
      
        
         
        
		    
   </form>
  </header>
  


		<!-- <div class="route">
		 <a href="">홈</a>&nbsp;&nbsp;>&nbsp;&nbsp;
		 <a href="">맛집</a>
		</div> -->
		
		
		<h1 class="food_toptitle">서울의 모든 맛집</h1>
		  <div class="wrapper">
  <div class="label"></div>
  <form action="../food/food_location.do" method="post">
  <div class="searchBar">
    <input id="searchQueryInput" type="text" name="ss" placeholder="이곳에서 서울의 맛집을 찾아보세요!♡" value="${ss }" />
    <button id="searchQuerySubmit" type="submit" name="searchQuerySubmit">
      <svg style="width:24px;height:24px" viewBox="0 0 24 24"><path fill="#666666" d="M9.5,3A6.5,6.5 0 0,1 16,9.5C16,11.11 15.41,12.59 14.44,13.73L14.71,14H15.5L20.5,19L19,20.5L14,15.5V14.71L13.73,14.44C12.59,15.41 11.11,16 9.5,16A6.5,6.5 0 0,1 3,9.5A6.5,6.5 0 0,1 9.5,3M9.5,5C7,5 5,7 5,9.5C5,12 7,14 9.5,14C12,14 14,12 14,9.5C14,7 12,5 9.5,5Z" />
      </svg>
    </button>
  </div>
  </form>
</div>
		
		
		
		
		<div class="filterbar">
		지역필터
		</div>
		<div class="food_side">

		  <div class="food_category">
		  맛집 분류
		    <ul>
		      <li>편의기능</li>
		      <li>방문목적</li>
		      <li>분위기</li>
		      <li></li>
		    </ul>
		  </div>
		  <div class="food_score">
		  맛집 평가 필터
		  	<ul>
		      <li>좋아요</li>
		      <li>보통이에요</li>
		      <li>아쉬워요</li>
		    </ul>
		  </div>
		</div>
		<div class="food_content">
			<h3 class="content_title">${content_title }</h3>
			<!-- 3*3 정렬 -->
		
			<div class="content_item">
			   <c:forEach var="vo" items="${list }">
			 	 
				 <div>
				    <!--  <button class="jjim_btn"><i class="fa-sharp fa-solid fa-heart"></i></button>-->
				    
				    <a href="../food/food_find_before_detail.do?fno=${vo.fno }">
				    <img src="${vo.poster }">
				    <h4 class="item_name">${vo.name }</h4>
			        <div class="item_info">
			            <span class="score"><i class="fa-solid fa-star"></i>${vo.score}</span><span class="hit">&nbsp;&nbsp;&nbsp;&nbsp;조회수 ${vo.hit}</span> 
			        </div>
			        </a>
			        
				 </div>
				 
			   </c:forEach>
			   
		
			   </div>
			     <div class="map_wrap">
    <div id="map" style="width:250px;height:300px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
  </div>


			   
			   <%-- 페이지 나누기 --%>
		<div class="pagination">
		        <ul>
		        	<li><a href="../food/food_location.do?fno=${fno }&page=1"><i class="fa-solid fa-angles-left"></i></a></li>
		        	<c:choose>
			          	<c:when test="${startpage<=1 }">
			          		<li><a href="../food/food_location.do?fno=${fno }&page=1"><i class="fa-solid fa-angle-left"></i></a></li>
			          	</c:when>
			          	<c:when test="${startpage>1 }">
			          		<li><a href="../food/food_location.do?fno=${fno }&page=${startpage-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
			          	</c:when>
		        	</c:choose>
		        	<c:forEach var="i" begin="${startpage }" end="${endpage }">
		            	<li ${i==curpage?"class=curpage":"" }><a href="../food/food_location.do?fno=${fno }&page=${i }">${i }</a></li>
		        	</c:forEach>
		        	<c:choose>
		        		<c:when test="${endpage<totalpage }">
		        			<li><a href="../food/food_location.do?fno=${fno }&page=${endpage+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
		        		</c:when>
		        		<c:when test="${endpage==totalpage }">
		        			<li><a href="../food/food_location.do?fno=${fno }&page=${endpage }"><i class="fa-solid fa-angle-right"></i></a></li>
		        		</c:when>
		        	</c:choose>
		        	<li><a href="../food/food_location.do?fno=${fno }&page=${totalpage}"><i class="fa-solid fa-angles-right"></i></a></li>
		        </ul>
		      </div>
			</div>
			   
		
</div>
<script type="text/javascript">
</script>

</body>
</html>