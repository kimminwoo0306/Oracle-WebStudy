<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>서울99여행</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<style>

/* 메인배너, 검색창 */
.mainbanner{
   position:relative;
   width:1200px;
   height:400px;
   margin:0 auto;
}
.mainbanner .main_input{
    -webkit-appearance: none;
       -moz-appearance: none;
            appearance: none;
            
  width:600px;
  height:50px;
  z-index:3;
  margin:0;
  padding: 0 30px;
  
  position:absolute;
  top:290px;
  left:70px;
  
  border:0;
  border-radius:4px;
  font-size : 18px;
  color:gray;
}
.mainbanner .main_input:focus{
   outline:none;
   color:black;
}
.mainbanner .main_input:hover{
   outline:none;
   box-shadow:0 0 10px 5px rgb(0,0,0,0.2);
}

.mainbanner .slide{position:relative;margin:0 auto;}
.mainbanner .slide .slideCnt{position:relative;overflow:hidden;width:1200px;height:400px}
.mainbanner .slide .slideCnt li{position:absolute;top:0;left:0;width:100%;height:100%;list-style:none; /*font-size:50px;line-height:500px;*/ text-align:center;color:#fff}

.mainbanner .slide .btn a{
position:absolute;
top:46%;
margin-top:-15px; 
font-size:20px;
text-align:center;
text-decoration:none;
line-height:30px;}
.mainbanner .slide .btn a.prev{left:30px;}
.mainbanner .slide .btn a.next{right:30px;}
.mainbanner .slide .btn a i.fa-solid{margin:10px; color:white; font-size:20px;}
.mainbanner .slide .autoBtn{
   position:absolute;
   top:30px;
   right:30px;
   border-radius:3px;
   width:30px;
   height:30px;
   text-align:center;
   text-decoration:none;
   line-height:30px;
   /*background-color:transparent;*/
   color:white;
   font-weight:bold;
}
.mainbanner .slide .autoBtn:hover{
  color:white;
}

.mainbanner .slide .slogan{
position : absolute;
top : 245px;
left : 100px;
font-size : 30px;
font-weight:400;
color:white;
}
 
/* 이미지리스트 슬라이드 */

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
   width:380px;
   height:230px;
   margin:15px;
   
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

#festival_cell{
   width:1200px;
   height:350px;
   margin:20px;
   box-shadow : 0 0px 20px 0 rgb(0,0,0,0.2);
}
#festival_cell div{
   width:50%;
   height:100%;
   float:right;
   padding:50px;
}
#festival_cell th{
   padding:15px;
}
#festival_cell td{
   padding:15px;
}
#festival_cellimg{
   width:50%;
   height:100%;
   object-fit:fit;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
   let rcnt_count=0;
   $('#recent_btn').click(function(){
      rcnt_count++;
      $('#recent_list').show()
      $('#recentOpen').hide()
      $('#recentClose').show()
      if(rcnt_count==2)
      {
         $('#recent_list').hide()
         $('#recentOpen').show()
         $('#recentClose').hide()
         rcnt_count=0
      }
   })
   

})



</script>
</head>
<body>
     
<div class="container">   
  
  
    <!-- 메인배너 -->
    <div class="mainbanner">
      <div class="slide">
          <ul class="slideCnt">
              <li><img src="../img/seoul-01.png" title="경복궁 경회루"></li>
              <li><img src="../img/seoul-02.png" title="N서울타워"></li>
              <li><img src="../img/seoul-03.png" title="DDP"></li>
              <li><img src="../img/seoul-04.png" title="북한산"></li>
              <li><img src="../img/seoul-05.png" title="광화문"></li>
              <li><img src="../img/seoul-06.png" title="반포대교"></li>
          </ul>
          <div class="btn">
              <a href="#" class="prev"><i class="fa-solid fa-angle-left"></i></a>
              <a href="#" class="next"><i class="fa-solid fa-angle-right"></i></a>
          </div>
          <a href="#" class="autoBtn"></a>
          <p class="slogan">서울 구석구석을 여행하다</p>
          <form method =post action="../main/search.do">
             <input type=text class="main_input" placeholder="서울 어디로 떠나볼까요?" name="searchWord" autocomplete="off">
          </form>
      </div>
    </div>
    
    
    <!-- 최근 방문기록 버튼 -->
    
    <div id="recent_btn" style="padding:10px;width:40px;height:150px;background:gray;color:white;position:fixed;top:50%;right:0;transform:translateY(-50%);z-index:50;writing-mode: vertical-rl;text-align:center;letter-spacing:5px;cursor:pointer;">
       <i id="recentOpen" class="fa-solid fa-angle-left" style="display:inline-block;color:white;"></i>
       <i id="recentClose" class="fa-solid fa-angle-right" style="display:none; color:white;"></i>
       최근방문
    </div>
    <div id="recent_list" style="display:none; padding:15px;height:150px;background:white;float:right;position:fixed;top:50%;right:40px;transform:translateY(-50%);z-index:45;box-shadow:0 0 10px 5px rgb(0,0,0,0.2);">
       <c:if test="${tcList.size()==0 && flcList.size()==0}">
          <h4 style="margin:0 0 10px 0;padding-left:5px;">최근 여행지 & 맛집 방문기록이 없습니다.</h4>
       </c:if>
       <c:if test="${tcList.size()>0 }">
          <div style="float:right;">
             <h4 style="margin:0 0 10px 0;padding-left:5px;">여행지 기록</h4>
            <div>
               <c:forEach var="tcvo" items="${tcList }" varStatus="s">
                  <c:if test="${s.index<5 }">
                     <a href="../trip/trip_before_detail.do?tno=${tcvo.tno }"><img src="${tcvo.image }" style="margin:0 5px;width: 90px;height: 90px;" title=${tcvo.name }></a>
                  </c:if>
               </c:forEach>
            </div>
         </div>
      </c:if>
      <c:if test="${flcList.size()>0 }">
         <div style="float:right;">
             <h4 style="margin:0 0 10px 0;padding-left:5px;">맛집 기록</h4>
            <div>
               <c:forEach var="fcvo" items="${flcList }" varStatus="s2">
                  <c:if test="${s2.index<5 }">
                     <a href="../food/food_find_before_detail.do?fno=${fcvo.fno }"><img src="${fcvo.poster }" style="margin:0 5px;width: 90px;height: 90px;" title=${fcvo.name }></a>
                  </c:if>
               </c:forEach>
            </div>
         </div>
      </c:if>         

      

   </div>
   

   <!-- 여행지 리스트 -->
   <div class="topText">
       <h3>서울에서 꼭 가봐야할 곳</h3>
       <a href="../trip/trip_all.do?tcno=1" class="moreClick">더보기&nbsp;<i class="fa-solid fa-angle-right"></i></a>
    </div>
    <div class="imglistSection">
         <div class="imglistGroup">
         <div class="main-carousel">
           <c:forEach var="tvo" items="${tlist1 }" >
  
              <div class="cell">
                  <a href="../trip/trip_before_detail.do?tno=${tvo.tno }">    
                     <img class="cellImg" src="${tvo.image }">
                     <h4 class="cellName">${tvo.name }</h4>
                     <div class="cellInfo">
                        <span class="gu">서울 ${tvo.addr}</span><span class="hit">&nbsp;&nbsp;&nbsp;&nbsp;조회수 ${tvo.hit}</span> 
                     </div>
                  </a>        
              </div>
               
           </c:forEach>
         </div>
         </div>
    </div>
    

    <div class="topText">
       <h3>자연과 휴식을 즐길 수 있는 곳</h3>
       <a href="../trip/trip_all.do?tcno=2" class="moreClick">더보기&nbsp;<i class="fa-solid fa-angle-right"></i></a>
    </div>
    <div class="imglistSection">
         <div class="imglistGroup">
         <div class="main-carousel">
           <c:forEach var="tvo" items="${tlist2 }">
              <div class="cell">
                  <a href="../trip/trip_before_detail.do?tno=${tvo.tno }">    
                     <img class="cellImg" src="${tvo.image }">
                     <h4 class="cellName">${tvo.name }</h4>
                     <div class="cellInfo">
                        <span class="gu">서울 ${tvo.addr}</span><span class="hit">&nbsp;&nbsp;&nbsp;&nbsp;조회수 ${tvo.hit}</span> 
                     </div>
                  </a>        
              </div>
           </c:forEach>
         </div>
         </div>
    </div>
    
           
 
   <!-- 맛집리스트 -->
   <div class="topText">
       <h3>서울 메뉴별 인기 맛집리스트</h3>
    </div>
    <div class="imglistSection">
         <div class="imglistGroup">
         <div class="main-carousel">
         
           <c:forEach var="fvo" items="${flist }" varStatus="s">
              <c:if test="${s.index<5 }">
              <%-- <c:if test="${s.index>=6 && s.index<=11 }"> --%>
                 <div class="cell" id="foodcate_cell">
                     <a href="../food/food_list2.do?no=${fvo.fcno }">
                     <div class="foodcate_back"></div>
                     <img src="${fvo.image }" id="foodcate_cellimg">
                     <div class="foodcate_titles">
                       <h3 class="cellName foodcate_h3">${fvo.title }</h3>
                       <h5 class="cellName foodcate_h5" id="foodcate_subtitle">${fvo.subtitle }</h5>
                     </div>
                     </a>
                 </div>
              </c:if>
           </c:forEach>
           
         </div>
         </div>
    </div>

  
    <div class="topText">
       <h3>서울 지역별 인기 맛집리스트</h3>
    </div>
    <div class="imglistSection">
         <div class="imglistGroup">
         <div class="main-carousel">
         
           <c:forEach var="fvo" items="${flist }" varStatus="s">
              <c:if test="${s.index>=5 && s.index<10 }">
                 <div class="cell" id="foodcate_cell">
                     <a href="../food/food_list2.do?no=${fvo.fcno }">
                     <div class="foodcate_back"></div>
                     <img src="${fvo.image }" id="foodcate_cellimg">
                     <div class="foodcate_titles">
                       <h3 class="cellName foodcate_h3">${fvo.title }</h3>
                       <h5 class="cellName foodcate_h5" id="foodcate_subtitle">${fvo.subtitle }</h5>
                     </div>
                     </a>
                 </div>
              </c:if>
           </c:forEach>
           
         </div>
         </div>
    </div>
    
    

   
    
   <!-- 축제 리스트 -->
   <div class="topText">
       <h3>현재 진행중인 행사</h3>
    </div>
    <div class="imglistSection">
         <div class="imglistGroup">
         <div class="main-carousel">
         
           <c:forEach var="fsvo" items="${fslist }" >
              <div class="cell" id="festival_cell">
                <img src="${fsvo.image }" id="festival_cellimg">
                 <div>
               <table class="table">
                 <tr>
                   <th width=30%>행사이름</th>
                   <td width=70%>${fsvo.name }</td>
                 </tr>
                 <tr>
                   <th width=30%>행사기간</th>
                   <td width=70%>${fsvo.period }</td>
                 </tr>
                 <tr>
                   <th width=30%>웹사이트</th>
                   <td width=70%><a href="${fsvo.web }">웹사이트 바로가기</a></td>
                 </tr>
                 <tr>
                   <th width=30%>주소</th>
                   <td width=70%>${fsvo.addr }</td>
                 </tr>
               </table>
               </div>
              </div>
           </c:forEach>
         </div>
         </div>
    </div>   
    


</div>

<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<script type="text/javascript">

var SLIDE_TIME = 800,
AUTO_TIME = 5000,

$slideCnt = null,
$slideBtnPrev = null,
$slideBtnNext = null,
//$slideBtnIndi = null,
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
//$slideBtnIndi = $(".indicator a");
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
//$slideBtnIndi.on("click", function(){
//indi($(this).index());
//});

$autoBtn.on("click", function(){
autoMove();
});
autoPlay();
};

function autoMove(){
if($autoBtn.text() == "| |"){
stopPlay();
}else{
autoPlay();
};
};

function autoPlay(){
$autoBtn.text("| |");
play = setInterval(function(){
next();
}, AUTO_TIME);
};

function stopPlay(){
$autoBtn.text("▶");
clearInterval(play);
};

function reset(){
$slideCnt.eq(0).siblings().css("left", "1200px");
//$slideBtnIndi.eq(0).addClass("on");
};

function prev(){
if(moveIng == false){
moveIng = true;
nextNum--;
if(nextNum < 0){
  nextNum = slideCntLength - 1;
};
move(nextNum, prevNum, "-1200px", "0", "1200px");
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
move(nextNum, prevNum, "1200px", "0", "-1200px");
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
//$slideBtnIndi.eq(nextNum).addClass("on").siblings().removeClass("on");
};


/*function indi(indiNum){
if(moveIng == false){
moveIng = true;
nextNum = indiNum;
if(nextNum > prevNum){
  move(nextNum, prevNum, "1200px", "0", "-1200px");
}else if(nextNum < prevNum){
  move(nextNum, prevNum, "-1200px", "0", "1200px");
};
prevNum = nextNum;
};
};*/


/* 이미지리스트 슬라이드 */

$('.main-carousel').flickity({
     // options
     cellAlign: 'left',
     wrapAround:true,
     freeScroll: true
   });


</script>
</body>
</html>