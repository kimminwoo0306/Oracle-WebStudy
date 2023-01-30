<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style type="text/css">
.listGroup{
	width:1200px;
	margin: 0 auto;
}
.flickity-viewport{
	width:100%;
}
.main-carousel{
	width:1200px;
	align:center;
}
.cell{
	/*width:33%;*/
	height:300px;
	/*width:288px;*/
	/*margin:0 18px 0 0;*/
	width:285px;
	margin:0 20px 0 0;
	overflow:hidden;
	border-radius:10px;
}
.cell img{
	width:285px;
	height:200px;
	object-fit:cover;
}
.flickity-page-dots{
	display:none;
}

</style>
</head>
<body>

<div class="listGroup">
	<div class="main-carousel">
	  <div class="cell"><img src="../img/seoul-01.png"></div>
	  <div class="cell"><img src="../img/seoul-02.png"></div>
	  <div class="cell"><img src="../img/seoul-03.png"></div>
	  <div class="cell"><img src="../img/seoul-04.png"></div>
	  <div class="cell"><img src="../img/seoul-05.png"></div>
	</div>
</div>

<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<script type="text/javascript">
$('.main-carousel').flickity({
	  // options
	  cellAlign: 'left',
	  wrapAround:true,
	  freeScroll: true
	});
</script>
</body>
</html>