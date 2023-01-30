<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.route{
	padding: 20px 0;
	width:100%;
	background:skyblue;
}
.tripmain_title{
	width:100%;
	height:100px;
	background:yellow;
}
.areaFilter{
	width:100%;
	height:
}
.container .trip_side{
	position:relative;
	width:20%;
	height:800px;
	background:pink;
	float:left;
}
.trip_category{
	position:absolute;
}
.trip_score{
	position:absolute;
	top:30%;
}
.trip_content{
	width:80%;
	height:800px;
	background:lightgray;
	float:right;
}

</style>
</head>
<body>

	<div class="container">
		<div class="route">
		 <a>홈</a>&nbsp;&nbsp;>&nbsp;&nbsp;
		 <a>여행지</a>
		</div>
		
		</div>
		<div class="tripmain_title">
		서울의 모든 여행지
		</div>
		<div class="areaFilter">
		지역필터
		</div>
		<div class="trip_side">

		  <div class="trip_category">
		  여행지 카테고리
		    <ul>
		      <li>명소</li>
		      <li>자연</li>
		      <li>즐길거리</li>
		      <li>쇼핑</li>
		    </ul>
		  </div>
		  <div class="trip_score">
		  여행지 평가
		  	<ul>
		      <li>좋아요</li>
		      <li>보통이에요</li>
		      <li>아쉬워요</li>
		    </ul>
		  </div>
		</div>
		<div class="trip_content">
		여행지 리스트
		</div>

<script type="text/javascript">
</script>

</body>
</html>