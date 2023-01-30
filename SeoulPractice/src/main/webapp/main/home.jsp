<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<style> @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
.container a{
            /* a태그 디폴트값 */
   color:black;
   text-decoration:none;
}
.mainbanner{
	position:relative;
	width:1200px;
	height:400px;
	margin:0 auto;
}
.main_input{
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
.main_input:focus{
	outline:none;
	color:black;
}
.main_input:hover{
	outline:none;
	box-shadow:0 0 10px 5px rgb(0,0,0,0.2);
}

.slide{position:relative;margin:0 auto;}
.slide .slideCnt{position:relative;overflow:hidden;width:1200px;height:400px}
.slide .slideCnt li{position:absolute;top:0;left:0;width:100%;height:100%;list-style:none; /*font-size:50px;line-height:500px;*/ text-align:center;color:#fff}
/*.slide .slideCnt li:nth-child(1){background-color:#ccc}
.slide .slideCnt li:nth-child(2){background-color:#999}
.slide .slideCnt li:nth-child(3){background-color:#666}
.slide .slideCnt li:nth-child(4){background-color:#333}*/
.slide .btn a{
position:absolute;
top:48%;
margin-top:-15px; 
font-size:20px;
/*border-radius:3px;width:50px;height:30px;*/
text-align:center;
text-decoration:none;
line-height:30px;}
.slide .btn a.prev{left:30px;}
.slide .btn a.next{right:30px;}
.slide .btn a i.fa-solid{color:white;}
/*.slide .indicator{display:inline-block;position:relative;bottom:30px}
.slide .indicator a{display:block;float:left;margin-left:5px;border-radius:3px;width:20px;height:20px;text-align:center;text-decoration:none;line-height:20px;background-color:#fff;color:#333}
.slide .indicator a:first-child{margin-left:0}
.slide .indicator a.on{background-color:#000;color:#fff}*/
.slide .autoBtn{
	position:absolute;
	top:20px;
	right:20px;
	border-radius:3px;
	width:30px;
	height:30px;
	text-align:center;
	text-decoration:none;
	line-height:30px;
	/background-color:transparent;*/
	color:white;
	font-weight:bold;
}
.slide .autoBtn:hover{
  color:white;
}

.slide .slogan{
position : absolute;
top : 245px;
left : 100px;
font-size : 30px;
font-weight:400;
color:white;
}
.cell {
  width: 25%;
  height: 200px;
  margin-right: 15px;
  background:white;
  border-radius: 5px;
}
.cell img{
	width: 100%;
	height:200px;
	object-fit:cover;
	border-radius:10%;
	
}
.flickity-page-dots {
/*    position: absolute;
    width: 100%;
    bottom: -25px;
    padding: 0;
    margin: 0;
    list-style: none;
    text-align: center;
    line-height: 1; */
    display:none;
}

</style>

</head>
<body>
     
<div class="container">   
  
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
		    <%--<div class="indicator">
		        <a href="#">1</a>
		        <a href="#">2</a>
		        <a href="#">3</a>
		        <a href="#">4</a>
		    </div>--%>
		    <a href="#" class="autoBtn"></a>
		    <p class="slogan">서울 구석구석을 여행하다</p>
		    <input type=text class="main_input" placeholder="서울 어디로 떠나볼까요?">
		</div>
    </div>

	
	
</div>
<br>
<h4> 서울 여행지</h4>
<div class="main-carousel">
  <div class="cell"><img src="../img/seoul-02.png"></div>
  <div class="cell"><img src="../img/seoul-03.png"></div>
  <div class="cell"><img src="../img/seoul-04.png"></div>
  <div class="cell"><img src="../img/seoul-05.png"></div>
  <div class="cell"><img src="../img/seoul-06.png"></div>
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

$('.main-carousel').flickity({
	  // options
	  cellAlign: 'left',
	  wrapAround: true,
	  freeScroll: true
	});

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


</script>
</body>
</html>