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
<!-- 근처 맛집이미지리스트 슬라이드 관련 -->
<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
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
   /* display:inline; */
   float:left;
   /*background:yellow;*/
}
.trip_name a{
   font-size:36px;
}
/* 링크복사 버튼 */
.circle_btn{
   -webkit-appearance: none;
   -moz-appearance: none;
    appearance:none;
    
   width : 40px;
   height : 40px;
           
   /* 버튼 색상 */
   background : white;
   border : 1px solid lightgray;
   border-radius : 50%;
   cursor:pointer;
   display:inline-block;
}
/* 찜버튼, 좋아요 버튼 */
i.fa-heart,i.fa-thumbs-up{
    padding: 10px;
    font-size: 20px;
    color: gray;
    border: 1px solid lightgray;
    border-radius: 50px;
    text-align: center;
    cursor:pointer;
}
.item_info{
   margin : 20px 0 0 0;
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
/* 최근 댓글리뷰 */
.titleAndBtn h2{
   margin: 0 30px 30px 0;
   display: inline-block;
}
.titleAndBtn a{
   width:120px;
   line-height:40px;
   display:inline-block;
   background: #e0e0e0;
   text-align:center;
   vertical-align:super;
   border-radius:4px;
}
.recent_review{
   margin: 0 0 70px 0;
   width:100%;
   height:150px;
}
.recent_review > div{
   height:100%;
   display:flex;
   justify-content:space-between;
}
.recent_reviewBox{
   padding:30px;
   width:48%;
   height:100%;
   overflow:hidden;
   white-space: nowrap;
   text-overflow:ellipsis;   
   box-shadow : 0 3px 13px 0 rgb(0,0,0,0.2);
   /* background: lightgray; */
}
.recent_reviewBox .msg{
   margin:30px 0 0 0;
   display:block;
   overflow:hidden;
   white-space: nowrap;
   text-overflow:ellipsis;
}
/* 근처 맛집 이미지리스트 관련 */

.topText{
   width:100%;
   height:30px;
   line-height:30px;
   margin:70px 0 10px 0;
   z-index:2;

}
.topText div{
   display:inline-block;
   margin: 0 0 0 50px;
}
.text_btn{
   margin: 0 10px;
   padding: 0 15px;
   border-radius:4px;
   background: #e0e0e0;
   
}
.text_btn:hover{
   color:white;
   background: #004fff;
}
.topText h3{
   float:left;
}
.topText a{
   float:right;
   color:black;
   text-decoration:none;
}
.imglistSection{
   width:100%;
   margin: 0 0 70px 0;
}
.main-carousel{
   width:100%;
   margin-top:10px;

}
.flickity-viewport{
   width:100%;

}
.cell{
   width:270px;
   height:270px;
   margin:20px;
   overflow:hidden;
   background:white;
   box-shadow : 0 5px 10px 0 rgb(0,0,0,0.2);
   position:relative;
}
.flickity-viewport .cell img{
   width:100%;
   height:180px;
   object-fit:fit;
}
.flickity-page-dots{
   display:none;
}
path.arrow{
   width:20%;
   height:20%
}
.flickity-prev-next-button{
   width:30px;
   height:30px;
   background:white;
}
.flickity-prev-next-button.previous{
   left:20px;
}
.flickity-prev-next-button.next{
   right:20px;
}

h4.cellName{
   margin:20px 20px 10px 20px;
}
div.cellInfo{
   margin:0 20px 20px 20px;
}
.cell a{
   color : black;
   text-decoration:none;
}
.cell .cellInfo .gu,i.fa-star{
   color : #004fff;
}
.cell .cellInfo .hit{
   color : gray;
   float: right;
}

#foodcate_title, #foodcate_title{
   color : black;
   z-index:5;
}

#foodcate_cell{
   width:355px;
   height:230px;
   margin:20px;
}   
#foodcate_cellimg{
   width:100%;
   height:100%;
   object-fit:fit;
}
.foodcate_back{
   position:absolute;
   width:100%; height:100%;
   background-color:rgba(0,0,0,0.3);
}
.foodcate_titles{
   width:100%;
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   text-align:center;
}
.foodcate_h3, .foodcate_h5{
   color:white;
}

/* 근처 명소 추천 관련 */
.tripmap_section{
   width:100%;
   height:650px;
/*    background:gray; */
}
h2 span{
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


/* 여행지 메인이미지 리스트 슬라이드  */
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



/* 댓글리뷰 */
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


hr{ margin: 0; border-top: 1px solid lightgray;}


/* 댓글리뷰 입력출력 관련 */
.table>tbody>tr>td{
   border:0;
}
.commentBox{
   width:84%;
   height:100px;
   resize:none;
   float: left;
}
.post_btn{
   width:15%;
   height:100px;
   background:#004fff;
   color:white;
   font-size:18px;
   border:0;
   border-radius:4px;
}
span.whitegray_btn,a.whitegray_btn{
   padding: 5px 10px;
   margin: 0 5px;
}

</style>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">


let u=0

$(function(){
   $('.ups').click(function(){
      $('.rupdate').hide();
       let arno=$(this).attr("data-no");
       if(u==0)
       {
           $(this).text("취소");
           $('#u'+arno).show();
           u=1;
       }
       else
       {
           $(this).text("수정");
           $('#u'+arno).hide();
           u=0;
       }
   })


})

   
   

</script>
<body>
<div class="container">


   
      <!-- 여행지명 / 조회수 / 링크복사 / 찜 / 좋아요 -->

      <div class="top_section">
         <h1 class="trip_name" tno="${vo.tno }"><a href="../trip/trip_detail.do?tno=${vo.tno }">${vo.name }</a></h1>
         <div class="top_buttons">
         
            <button class="circle_btn" onClick={copyLink()}><i class="fa-solid fa-link"></i></button>
            
            <%-- 비로그인 상태 찜/좋아요 --%>
            <c:if test="${sessionScope.id==null }">
                 
                <%-- 찜 --%>
                <span><i class="fa-sharp fa-solid fa-heart" onclick="alert('로그인이 필요합니다.')"></i></span>

                <%-- 좋아요 --%>
                <span><i class="fa-regular fa-thumbs-up" onclick="alert('로그인이 필요합니다.')"><span style="font-size:16px">(${like_total })</span></i></span>&nbsp;
                
            </c:if>
            
            <%-- 로그인 상태 찜/좋아요 --%>
            <c:if test="${sessionScope.id!=null }">

                <%-- 찜 --%>
                <c:if test="${myJjim_count==0 }">
                  <a href="../jjim/tripjjim_insert.do?tno=${vo.tno }"><i class="fa-sharp fa-solid fa-heart" style="color:gray"></i></a>
                </c:if>
                <c:if test="${myJjim_count>0 }">
                  <a href="../jjim/tripjjim_delete.do?tno=${vo.tno }"><i class="fa-sharp fa-solid fa-heart" style="color:#f46555"></i></a>
                </c:if>

                <%-- 좋아요 --%>
                <c:if test="${myLike_count==0 }">
                  <a href="../like/triplike_insert.do?tno=${vo.tno }"><i class="fa-regular fa-thumbs-up" style="color:gray"><span style="font-size:16px">(${like_total })</span></i></a>
                </c:if>
                <c:if test="${myLike_count>0 }">
                  <a href="../like/triplike_delete.do?tno=${vo.tno }"><i class="fa-regular fa-thumbs-up" style="color:#f46555"><span style="font-size:16px">(${like_total })</span></i></a>
                </c:if>

            </c:if>
         </div>
         <div class="item_info">
            <span class="gu">서울 ${gu }</span><span class="hit">&nbsp;&nbsp;&nbsp;&nbsp;조회수 ${vo.hit }</span> 
         </div>
      </div>
       
        
        <!-- 여행지 이미지슬라이드 & 소개글 -->
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
      
      
      <!-- 최근 리뷰 (최신 2개 출력)  -->
      <!-- 최근 리뷰가 0개이면 전체 안 보이게 하기 -->
      <c:if test="${count>0 }">
      
         <div class="titleAndBtn">
            <h2>최근 댓글리뷰</h2>
            <a href="#tripReview_section">전체 보러가기</a>
         
         </div>
         <div class="recent_review">
            <div>
               <c:forEach var="rcvo" items="${rcList }">
               
                  <div class="recent_reviewBox">
                     <span style="color:#004fff">${rcvo.id }</span>
                     <span style="color:gray">&nbsp;(${rcvo.dbday })</span>
                     <span class="msg">${rcvo.msg }</span>
                  </div>
               
               </c:forEach>
            </div>
         </div>
      
      </c:if>
      
      
      <div class="trip_address">
         <h2>주소<span style="margin:0 30px;font-size:24px;color:black;">${vo.addr }</span></h2>
      </div>

      <%-- 근처 가볼만한 곳 --%>   
      <div class="tripmap_section">
         <h2><span>${vo.name }</span> 근처 가볼만한 곳</h2>

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
   
   
      <%-- 근처 맛집리스트 --%>
      <div class="nearbyFood_section">
         <h2><span>${vo.name }</span> 근처 맛집</h2>
         
          <div class="imglistSection">
               <div class="imglistGroup">
               <div class="main-carousel">
               
                 <c:forEach var="fvo" items="${flist }">
                    
                       <div class="cell" id="foodcate_cell">
                           <a href="../food/food_detail.do?fno=${fvo.fno }">
                           <div class="foodcate_back"></div>
                           <img src="${fvo.poster }" id="foodcate_cellimg">
                           <div class="foodcate_titles">
                             <h3 class="cellName foodcate_h3">${fvo.name }</h3>
                           </div>
                           </a>
                       </div>
                    
                 </c:forEach>
                 
               </div>
               </div>
          </div>

      </div>
   
      
      <!-- 여행지 댓글 리뷰 -->
      <div class="tripReview_section" id="tripReview_section">
      
         <div class="tReview_top">
            <h2 class="tReview_name">${vo.name }&nbsp;</h2><h2>댓글리뷰(${count!=0?count:"0" })</h2>
         </div>   
         
         <div class="tReview_body">
         
         
             <!-- (로그인상태) 댓글리뷰 등록란 -->
             <h3 style="display:inline-block"><span style="color:#004fff;font-size:24px;">&nbsp;${vo.name }</span>에 대한 방문후기를 들려주세요!</h3>
             

              <table class="table">
                  
                   <table class="table">
                    <tr>
                      <td>
                      
                         <c:if test="${sessionScope.id==null }">
                             <textarea class="commentBox"  name="msg" placeholder="&nbsp;&nbsp;로그인 후 댓글리뷰 등록이 가능합니다." disabled></textarea>&nbsp;
                             <input type=submit value="리뷰등록" class="post_btn" disabled>
                         </c:if>
                          
                       <form method="post" action="../all_reply/all_reply_insert.do">   
                         <c:if test="${sessionScope.id!=null }">
                            <input type=hidden name="no" value="${vo.tno }">
                            <input type=hidden name="cate_no" value="1">
                            <textarea class="commentBox"  name="msg"></textarea>&nbsp;
                            <input type=submit value="리뷰등록" class="post_btn">
                         </c:if>
                       </form>
                       
                      </td>
                    </tr>
                   </table>
                 
             </table>
              
              <!-- 댓글이 없을 때 -->         
              <c:if test="${count==0 }"> <!-- count=rList.size() 특정상세페이지의 덧글개수 -->
                 <table class="table">
                    <tr>
                      <td class="text-left" style="font-size:24px">아직 등록된 댓글리뷰가 없습니다.</td>
                    </tr>
                 </table>
              </c:if>
              
              <!-- 댓글 있을 때 -->
              <c:if test="${count>0 }">
                <table class="table">
                 <tr>
                  <td>
                   <c:forEach var="rvo" items="${rList }">
                     <table class="table">
                       
                     
                       <!-- (로그인상태) 댓글 출력 -->
                       <tr>                        
                         <td class="text-left" width=70%>
                         <span style="color:#004fff">${rvo.id }</span>&nbsp;(${rvo.dbday })
                         </td>
                         
                         <td class="text-right" width=30%>
                           <c:if test="${sessionScope.id!=null }">
                             <c:if test="${sessionScope.id==rvo.id }">
                               <span class="whitegray_btn ups" data-no="${rvo.arno }">수정</span>
                               <a href="../all_reply/all_reply_delete.do?arno=${rvo.arno }&no=${vo.tno}&cate_no=1" class="whitegray_btn">삭제</a>
                             </c:if>
                           </c:if>
                         </td>
                         
                       </tr>
                       <tr>
                         <td colspan="2"><pre style="white-space:pre-wrap;background-color: white;border:none;padding:0;font-family:Noto Sans KR;font-size:16px">${rvo.msg }</pre></td>
                       </tr>
                       <hr style="margin:20px 0;">
                       
                                              
                       <!-- 댓글 수정 -->
                       <tr id="u${rvo.arno }" class="rupdate" style="display:none">
                          <td colspan="2">
                            <form method="post" action="../all_reply/all_reply_update.do">
                               <input type=hidden name="no" value="${vo.tno }">
                               <input type=hidden name="arno" value="${rvo.arno }">
                               <input type=hidden name="cate_no" value="1">
                               <textarea class="commentBox" name="msg">${rvo.msg}</textarea>&nbsp;
                               <input type=submit value="수정" class="post_btn">
                            </form>
                          </td>
                       </tr>
                        
                       
                     </table>
                   </c:forEach>
                  </td>
                 </tr>
                </table>
              </c:if>
             
             

         </div>

      </div>
      

      
</div>


      <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32c8b981048bb9ecf1ccc44705676320&libraries=services"></script>
      <script type="text/javascript">
   
      <%-- 맛집이미지리스트 관련 --%>
      $('.main-carousel').flickity({
           // options
           cellAlign: 'left',
           wrapAround:true,
           freeScroll: true
      });
      
      <%-- url 복사 기능 관련 --%>
      const copyLink = () => {
         var url = '';
         var textarea = document.createElement("textarea");
         document.body.appendChild(textarea); //</body> 전에 임시공간용 textarea를 추가
         url = window.document.location.href; //url에 현재 주소값 넣기
         textarea.value = url;  //textarea 값에 url 넣기
         textarea.select();  //textarea 선택
         document.execCommand("copy");  //복사
         document.body.removeChild(textarea); //임시공간용 textarea 삭제
         alert("링크가 복사되었습니다.");
      }
      
      
      <%-- 상단 여행지이미지 슬라이드 관련 --%>      
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
      
              //alert('검색 결과가 존재하지 않습니다.');
              //return;
      
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