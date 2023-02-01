<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울99여행</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
.container{
	position:relative;
}
.container a{
	color:black;
	text-decoration:none;
}
.route{
	/* 페이지 경로 */
	width:100%;
	margin-top:40px;
	
	/*background:lightblue;*/
}
h1,h2,h3,h4{
	margin:0;
}
h2{
	margin: 0 0 30px 0;
}
.top_section{
	position:relative;
	margin:60px 0 30px 0;
	
	/*background:lightblue;*/
}
.trip_name{
	margin:0 50px 0 0;
	line-height:36px;
	display:inline;
	float:left;
	/*background:yellow;*/
}
.trip_name a{
	font-size:36px;
}
.copyLink_btn{
	-webkit-appearance: none;
	-moz-appearance: none;
	 appearance:none;
	 
	width : 40px;
	height : 40px;
	        
	/* 버튼 색상 */
	background : white;
	border : 1px solid lightgray;
	border-radius : 50%;

}
.jjim_btn{
	position:inherit;  /* 원래 적용된 position 빼기 */
	
	width : 40px;
	height : 40px;
	border : 1px solid lightgray;

}
.item_info{
	margin : 20px 0 0 0;
	
	/*background:pink;*/
}
.item_info .gu{
	color : #004fff;
	font-size:16px;
}
.item_info .hit{
	color : gray;
	font-size:16px;
}
.intro_section{
	margin:0 0 70px 0;
	width:100%;
	height:450px;
	box-shadow : 0 3px 10px 0 rgb(0,0,0,0.2);
}
.intro_section img{
	margin:0;
	width:65%;
	height:100%;
	background:lightgray;
	float:left;
}
.trip_about{
	margin:0;
	padding:40px;
	width:35%;
	height:100%;
	float:right;	
	background:white;
	
	scrollbar-width:none;
}
.trip_about div{
	width:100%;
	height:80%;
	overflow: auto;
}
.titleAndBtn{
	display:flex;
	justify-content: space-between;
	/* background:yellow; */
}
.titleAndBtn a{
	line-height:35px;
}
.recent_review{
	margin: 0 0 70px 0;
	width:100%;
	height:200px;
}
.recent_review > div{
	height:100%;
	display:flex;
	justify-content: space-between;
}
.recent_reviewBox{
	width:48%;
	height:100%;
	box-shadow : 0 3px 13px 0 rgb(0,0,0,0.2);
	/* background: lightgray; */
}
.recent_reviewBox div{
	width: 100%;
	height: 80%;
	padding: 30px;
}
.recent_reviewBox span{
	width:100%;
	height:20%;
	display: block;
	margin: 0 0 0 30px;
	line-height: 80px;
}
.goodpoint_section{
	margin: 0 0 100px 0;
	width:100%;
	height:300px;
	box-shadow : 0 3px 13px 0 rgb(0,0,0,0.2);
/* 	background:lightblue; */
}
.tripmap_section{
	width:100%;
	height:700px;
/* 	background:gray; */
}
.tripmap_section h2 span{
	color: #004fff;
	font-size: 30px;
}
.trip_review{
	width:100%;
	height:600px;
	background:yellow;
}
.trip_map{
	width:60%;
	height:100%;
	background:lightgray;
	float:left;
}
.trip_nearby{
	width:40%;
	height:100%;
	background:pink;
	float:right;
}
.trip_address{
	margin: 0 0 100px 0;
}

/* --- 이미지슬라이드 : 나중에 위로 올리기 --- */
.mainbanner{
	position:relative;
	width:65%;
	height:100%;
	margin:0;
	

	background:lightgray;
	float:left;
}

.mainbanner .slide{position:relative;margin:0 auto;width:100%;height:100%;}
.mainbanner .slide .slideCnt{position:relative;overflow:hidden;width:100%;height:100%;}
.mainbanner .slide .slideCnt li{position:absolute;top:0;left:0;width:100%;height:100%;list-style:none; /*font-size:50px;line-height:500px;*/ text-align:center;color:#fff}
.mainbanner .slide .slideCnt li img{width:100%; height:100%;}
.mainbanner .slide .btn a{
position:absolute;
top:46%;
margin-top:-15px; 
font-size:20px;
text-align:center;
text-decoration:none;
line-height:30px;}
.mainbanner .slide .btn a.prev{left:20px;}
.mainbanner .slide .btn a.next{right:20px;}
.mainbanner .slide .btn a i.fa-solid{margin:20px; color:white; font-size:20px;}
/* .mainbanner .slide .autoBtn{
	position:absolute;
	top:20px;
	right:20px;
	border-radius:3px;
	width:30px;
	height:30px;
	text-align:center;
	text-decoration:none;
	line-height:30px;
	/*background-color:transparent;*/
	color:white;
	font-weight:bold;
} */
.mainbanner .slide .autoBtn:hover{
  color:white;
}

/* --- 카카오지도 --- */
.map_wrap{box-shadow : 0 3px 10px 0 rgb(0,0,0,0.2);}
.map_wrap, .map_wrap * {margin:0;padding:0;font-size:16px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;right:0;bottom:0;width:350px;margin:0px;padding:25px 5px 5px 5px;overflow-y:auto;background:white;z-index: 1;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #lightgray;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px; background:#004fff; border:0; border-radius:4px; padding: 2px 10px; color:white;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid lightgray;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {color: #004fff;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#004fff;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(../img/map_marker.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

/* 리뷰 */
.tripReview_section{
	width:100%;
}
.tReview_top{
	width:100%;
	display:inline-block;
}
.tReview_top h2{
	float:left;
}
.tReview_top .tReview_name{
	color: #004fff;
}
.tReview_top span{
	float:left;
	font-size: 24px;
	line-height:30px;
}
.tReview_top .tReview_score{
	margin: 0 0 0 30px;
}
.tReview_score{
	color: #004fff;
}
.tReview_top .blue_btn{
	padding: 7px 20px;
	float: right;
}
.tReview_body{
	width:100%;
	padding: 70px;
	background: white;
	box-shadow : 0 3px 13px 0 rgb(0,0,0,0.2);
}
.tripReview_section ul{
	margin: 0 0 70px 0;
	display:flex;
	justify-content: space-between;
}
.tripReview_section ul li.reviewFilter{
	width:22%;
}
hr{ margin: 0; border-top: 1px solid lightgray;}
.tReviewfilter_btn{
	-webkit-appearance: none;
	-moz-appearance: none;
	 appearance:none;
	 
	width:100%;
	padding: 10px;
	border:0;
	border-radius: 4px;
	background: #e0e0e0;
}
.tReviewfilter_btn:hover{
	color: white;
	background: #004fff;
}
.tReview_user{
	width:25%;
	padding:0 0 0 30px;
	display:inline-block;
	float: left;
}
.big_reviewBox div{
	margin: 0 0 30px 0;
	width:75%;
	float:right;
}
.big_reviewBox button{

}
.tReview_date{
	color:gray;
	margin: 0 0 0 30px;
}
.tReview_cont{
	margin: 20px 0;
	width:100%;
/* 	height:80px; */
	display:block;
	border:0;
	background:white;
	resize:none;
}
.tReview_cont:focus{outline:none;}
.big_reviewBox hr{
	margin: 30px 0;
	clear: both;
}

/* 리뷰작성 팝업창 */
.tReview_writePopup{
	margin:0 auto;
	padding:40px;
	width:600px;
	height:600px;
 	position:fixed;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	background:white;
	border-radius:4px;
	box-shadow : 0 10px 50px 0 rgb(0,0,0,0.4);
	z-index:30;
}
.tReview_writePopup textarea#content{
	resize:none;
	width:100%;
	height:190px;
	margin:0 0 20px 0;
}
.tReview_writePopup h2{
	margin: 0 0 50px 0;
}
.tReview_writePopup h4{
	margin: 0 0 30px 0;
}
.tReview_writePopup h4 span{
	color:gray;
}
input.whitegray_btn,input.blue_btn{
	width:40%;
	margin:20px 10px;	
}
input.score_input{
	width:10%;
	margin: 5px;
}
#like_btn{
	padding:0;
}
#like_btn i:hover{
	color:#ff6555;
}

/* 페이지 넘버링 */
.pagination{

	margin: 0px;
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
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

//좋아요 버튼 횟수
let likeCount=0;
function likeClick(){
	likeCount++
	$('#likeCnt').text(Number(likeCount)).css("color","#f46555")
	$('.fa-thumbs-up').css("color","#f46555")
	
	if(likeCount==2)
	{
		likeCount=likeCount-2
		$('#likeCnt').text("")
		$('.fa-thumbs-up').css("color","black")
	}
}

$(function(){
	
	
	/* 글쓰기/수정/삭제 등 완료 후 넣기 */	
	/*$('#tReviewAdd_btn').click(function(){
		if(${sessionScope.id==null})
		{
			alert("로그인이 필요합니다.")
			return
		}
	}) */
	
	$('#write_btn').click(function(){

		let tno=$('.trip_name').attr("tno");
		$.ajax({
			type:'post',
			url:'../trip/trip_reviewInsert.do',
			data:{"tno":tno},
			success:function(result)
			{
				$('#reviewPrint').html(result)
				$('#cancel').click(function(){
					$('.tReview_writePopup').hide();
					
				})
 				$('#insert').click(function(){
					if(!$.trim($('textarea').val()))
					{
						$('textarea').focus();
						return;
					}
					$('.tReview_writePopup').hide();
					$.ajax({
					type:'post',
					url:'../trip/trip_reviewInsert_ok.do',
					data:{"tno":tno,"score":score,"cont":cont},
					success:function(result)
					{
						
					}
				})
				}) 

			}
		})
		
	})
	
	
}) 

</script>
<body>
<div class="container">


	
		<!-- 여행지명 / 평점 / 조회수 / 공유 / 찜버튼 -->

		
		<div class="route">
			<a href="">홈</a>&nbsp;&nbsp;>&nbsp;&nbsp;
			<a href="">여행지</a>
		</div>
		
		
		
		<div class="top_section">
			<h1 class="trip_name" tno="${vo.tno }"><a href="../trip/trip_detail.do?tno=${vo.tno }">${vo.name }</a></h1>
			<div class="top_buttons">
				<button class="copyLink_btn" onClick={copyLink()}><i class="fa-solid fa-link"></i></button>
				<button class="jjim_btn"><i class="fa-sharp fa-solid fa-heart"></i></button>
			</div>
			<div class="item_info">
				<span class="gu">서울 ${gu }</span><span class="hit">&nbsp;&nbsp;&nbsp;&nbsp;조회수 ${vo.hit }</span> 
			</div>
		</div>
       
        
		<div class="intro_section">
			<%-- <img src="${vo.image }"> --%>
			
			<div class="mainbanner">
			   <div class="slide">
				    <ul class="slideCnt">
				        <c:forTokens items="${vo.image}" delims="^" var="img">
				        	<li><img src="${img }" title="${vo.name }"></li>
				        </c:forTokens>
				    </ul>
				    <div class="btn">
				        <a href="#" class="prev"><i class="fa-solid fa-angle-left"></i></a>
				        <a href="#" class="next"><i class="fa-solid fa-angle-right"></i></a>
				    </div>
				    <a href="#" class="autoBtn"></a>
				</div>
		    </div>
			
			
			<div class="trip_about">
				<h2>소개</h2>
				<div><span>${vo.content }</span></div>
			</div>
			
			
		</div>
		
		
		<div class="titleAndBtn">
			<h2>최근 리뷰</h2>
			<a>리뷰 보러가기</a>
		
		</div>
		<div class="recent_review">
			
				<%-- forEach 돌려서 최근 리뷰 3개 가져오기 --%>
				<%-- 리뷰 없는 경우 "아직 등록된 리뷰가 없습니다!" 표시, 리뷰박스는 1개만 출력 --%>
				<%-- 유저명 & 평점 부분 위치 제대로 주기, 평점은 파란색 넣기 --%>
				<div>
					<div class="recent_reviewBox">
						<span>유저명&nbsp;&nbsp;&nbsp;★4/5</span>
						<div>본문내용 중략...(중략된 부분 클릭 시 해당 리뷰 위치로 이동)</div>
					</div>
					<div class="recent_reviewBox">
						<span>유저명&nbsp;&nbsp;&nbsp;★4/5</span>
						<div>본문내용 중략...</div>
					</div>
				</div>	
			
		</div>
		
<!-- 		<h2>이런 점이 좋았어요</h2>
		<div class="goodpoint_section">
		</div> -->


		<div class="trip_address">
			<h2>주소</h2>
			<h3>${vo.addr }</h3>
		</div>

		
		<div class="tripmap_section">
			<h2><span>${vo.name }</span> 근처 가볼만한 곳</h2>
<!-- 			<div class="trip_map">지도</div>
				<div class="trip_nearby">근처 추천</div> -->
			
			
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				
				    <div id="menu_wrap" class="bg_white">
				        <div class="option">
				            <div>
				                <form onsubmit="searchPlaces(); return false;">
				                       <input type="text" value="${vo.name } 근처 명소" id="keyword" size="15"> 
				                    <button type="submit">검색</button> 
				                </form>
				            </div>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <%-- <div id="pagination"></div> --%>
				    </div>
				</div>
		
					
		</div>
	
		<!-- 여행지 리뷰 -->
		

		
		<div class="tripReview_section">
		
			<div class="tReview_top">
				<h2 class="tReview_name">${vo.name }&nbsp;</h2><h2>리뷰</h2>
				<c:if test="${reviewCnt>0}">
				<h2 class="tReview_score">★${scoreAvg }</h2>
				</c:if>
				<h2>(${reviewCnt>0?reviewCnt:0 })건</h2>
				<!-- sessionScope.id로 로그인 확인 => 비로그인 => "※리뷰는 로그인 후 작성 가능합니다." 보여주기 -->
				<button class="blue_btn" id="write_btn">리뷰작성</button>
				<!-- <span class="text-right">※리뷰는 로그인 후 작성 가능합니다.</span> -->
			</div>	
			
			<div class="tReview_body">
				<!-- 필터버튼 -->
				
				<ul>
				  <li class="reviewFilter"><button class="tReviewfilter_btn">전체보기</button></li>
				  <li class="reviewFilter"><button class="tReviewfilter_btn">좋아요</button></li>
				  <li class="reviewFilter"><button class="tReviewfilter_btn">보통이에요</button></li>
				  <li class="reviewFilter"><button class="tReviewfilter_btn">아쉬워요</button></li>
				</ul>
				
										 
				
				
					
					<div class="big_reviewBox">
					  <c:forEach var="vo" items="${list }">		
						<span class="tReview_user">${vo.id }</span>
						<div>
							<span class="tReview_score">★${vo.score }점</span>&nbsp;/&nbsp;5점
							<span class="tReview_date">${vo.dbday }</span>
																					 
																									
							<textarea class="tReview_cont">${vo.content }</textarea> 
<!-- 							<button class="text_btn" id="like_btn" onclick="likeClick()"><i class="fa-regular fa-thumbs-up" style="padding:0; font-size:20px"></i></button>
							<span id="likeCnt"></span> -->
						</div>
						<hr>
					  </c:forEach>
					</div>
				
				
				<!-- 페이지네이션 -->
 				<div class="pagination">
		        <ul>
		        	<li><a href="../trip/trip_detail.do?tno=${tno }&page=1"><i class="fa-solid fa-angles-left"></i></a></li>
		        	<c:choose>
			          	<c:when test="${startpage<=1 }">
			          		<li><a href="../trip/trip_detail.do?tno=${tno }&page=1"><i class="fa-solid fa-angle-left"></i></a></li>
			          	</c:when>
			          	<c:when test="${startpage>1 }">
			          		<li><a href="../trip/trip_detail.do?tno=${tno }&page=${startpage-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
			          	</c:when>
		        	</c:choose>
		        	<c:forEach var="i" begin="${startpage }" end="${endpage }">
		            	<li ${i==curpage?"class=curpage":"" }><a href="../trip/trip_detail.do?tno=${tno }&page=${i }">${i }</a></li>
		        	</c:forEach>
		        	<c:choose>
		        		<c:when test="${endpage<totalpage }">
		        			<li><a href="../trip/trip_detail.do?tno=${tno }&page=${endpage+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
		        		</c:when>
		        		<c:when test="${endpage==totalpage }">
		        			<li><a href="../trip/trip_detail.do?tno=${tno }&page=${endpage }"><i class="fa-solid fa-angle-right"></i></a></li>
		        		</c:when>
		        	</c:choose>
		        	<li><a href="../trip/trip_detail.do?tno=${tno }&page=${totalpage}"><i class="fa-solid fa-angles-right"></i></a></li>
		        </ul>
		      </div>
		      
					
			</div>

		</div>
		
		
		<span id="reviewPrint">		
		
		
		<!-- 리뷰작성 팝업창 -->
<!-- 		<div class="tReview_writePopup">
			<h2 class="text-center">리뷰 작성하기</h2>
			<h4 class="text-left">여행지는 어떠셨나요?</h4>
			<div style="margin-bottom:30px;">
				<input class="score_input" type=radio name="score" value="5" checked>5점
				<input class="score_input" type=radio name="score" value="4">4점
				<input class="score_input" type=radio name="score" value="3">3점
				<input class="score_input" type=radio name="score" value="2">2점
				<input class="score_input" type=radio name="score" value="1">1점
			</div>
			<h4 class="text-left">이 곳을 방문한 후기를 들려주세요!</h4>
			<textarea style="width:100%; height:35%; margin-bottom:30px;" ></textarea>
			<div class="text-center">
				<input type=button class="whitegray_btn" value="취소" onclick="javascript:history.back()">
				<input type=button class="blue_btn" value="등록">
			</div>
		</div> -->
		
		</span>		
		
		
		
</div>


		<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32c8b981048bb9ecf1ccc44705676320&libraries=services"></script>
		<script type="text/javascript">
	
		<%-- url 복사 기능 관련 --%>
		const copyLink = () => {
			var url = '';
			var textarea = document.createElement("textarea");
			document.body.appendChild(textarea);
			url = window.document.location.href;
			textarea.value = url;
			textarea.select();
			document.execCommand("copy");
			document.body.removeChild(textarea);
			alert("링크가 복사되었습니다.");
		}
		
		
		<%-- 상단 이미지 슬라이드 관련 --%>		
		var SLIDE_TIME = 800,
		AUTO_TIME = 7000,

		$slideCnt = null,
		$slideBtnPrev = null,
		$slideBtnNext = null,
		$autoBtn = null,

		slideCntLength = 0,
		nextNum = 0,
		prevNum = 0,
		moveIng = false,
		play = null;

		$(document).ready(function(){
		init();
		initEvent();
		});

		function init(){
		$slideCnt = $(".slideCnt li");
		$slideBtnPrev = $(".btn .prev");
		$slideBtnNext = $(".btn .next");
		$autoBtn = $(".autoBtn");
		slideCntLength = $slideCnt.length;
		};

		function initEvent(){
		reset();
		$slideBtnNext.on("click", function(){
		next();
		});
		$slideBtnPrev.on("click", function(){
		prev();
		});
		
		$autoBtn.on("click", function(){
		autoMove();
		});
		autoPlay();
		};

		function reset(){
		$slideCnt.eq(0).siblings().css("left", "741px");
		};

		function prev(){
		if(moveIng == false){
		moveIng = true;
		nextNum--;
		if(nextNum < 0){
		  nextNum = slideCntLength - 1;
		};
		move(nextNum, prevNum, "-741px", "0", "741px");
		prevNum = nextNum;
		};
		};

		function next(){
		if(moveIng == false){
		moveIng = true;
		nextNum++;
		if(nextNum >= slideCntLength){
		  nextNum = 0;
		};
		move(nextNum, prevNum, "741px", "0", "-741px");
		prevNum = nextNum;
		};
		};

		function move(after, before, afterSet, afterSpace, beforeSpace){
		$slideCnt.eq(after).css("left", afterSet).animate({
		left: afterSpace
		}, SLIDE_TIME);
		$slideCnt.eq(before).animate({
		left: beforeSpace
		}, SLIDE_TIME, function(){
		moveIng = false;
		});
		};
		
		
		<%-- 카카오 지도 api 관련 --%>
		// 마커를 담을 배열입니다
		var markers = [];
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표 : 37.566826, 126.9786567
		        level: 20 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();  
		
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		// 키워드로 장소를 검색합니다
		searchPlaces();
		
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
		
		    var keyword = document.getElementById('keyword').value;
		
		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }
		
		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}
		
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
 		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);
		
		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);
		
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		
		        alert('검색 결과가 존재하지 않습니다.');
		        return;
		
		    } else if (status === kakao.maps.services.Status.ERROR) {
		
		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;
		
		    }
		}
		
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
		
		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);
		
		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {
		
		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);
		
		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });
		
		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
		
		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };
		
		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].place_name);
		
		        fragment.appendChild(itemEl);
		    }
		
		    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;
		
		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}
		
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
		
		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.place_name + '</h5>';
		
		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           
		
		    el.innerHTML = itemStr;
		    el.className = 'item';
		
		    return el;
		}
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = '../img/map_marker.png',
		    	//imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
		
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		
		    return marker;
		}
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		
		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 
		
		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }
		
		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;
		
		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }
		
		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}
		
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
		
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}
		
		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		 
		 
		</script>
		
		

</body>
</html>