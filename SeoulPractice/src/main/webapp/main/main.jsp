<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
   // 화면 변경에 대한 요청값을 받는다 
   request.setCharacterEncoding("UTF-8");
   String mode=request.getParameter("mode");
   // 처음에 한번은 default지정 
   if(mode==null)
	   mode="0";
   String jsp=JspChange.change(Integer.parseInt(mode));
%> --%>
<!DOCTYPE html>
<html>
<head>  
    <%--<link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">--%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>서울99여행</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/fontAwesome.css">
    <link rel="stylesheet" href="../css/hero-slider.css">
    <link rel="stylesheet" href="../css/owl-carousel.css">
    <link rel="stylesheet" href="../css/datepicker.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
<!--<link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet"> -->
    <script src="../js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    
<style>

.container a{
            /* a태그 디폴트값 */
   color:black;
   text-decoration:none;
}
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
*{
font-family:'Noto Sans KR', sans-serif;
margin:0;
padding:0;
color:black;
}
.goup_btn {

        top: 90%;
        left: 95%;
        width: 50px;
        height: 50px;
        border-radius: 80%;
        background-color: #ffffff;
        border: 1px solid lightgray;
        position: fixed;
        z-index: 2;
      }

</style>
</head>
<body>

	<button class="goup_btn" onclick="goup()"><i class="fa-solid fa-arrow-up"></i></button>


	<!-- nav -->
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<!-- home -->
	<div class="container">
		<jsp:include page="${main_jsp }"></jsp:include>
	</div>
	

	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	    <div class="sub-footer">
	        <p>Copyright &copy; 2018 Company Name 
	    
	    	- Design: <a rel="nofollow" href="http://www.templatemo.com" style="color:blue;">Template Mo</a></p>
	    </div>
	
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js" type="text/javascript"></script>
	    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
	    <script src="../js/vendor/bootstrap.min.js"></script>
	    <script src="../js/datepicker.js"></script>
	    <script src="../js/plugins.js"></script>
	    <script src="../js/main.js"></script>
	    
	    <script>
      
	      function goup() {
	         window.scrollTo({top:0, left:0, behavior:'smooth'});
	       }
      
   		</script>
</body>
</html>