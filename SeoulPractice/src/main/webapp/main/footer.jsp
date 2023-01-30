<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container a{
            /* a태그 디폴트값 */
   color:black;
   text-decoration:none;
}
footer{
	background-color:gray;
	color:white;
}
a{
	color:white;
}

h5{
	color:white;
}
      .background {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.4);
        z-index: 1000;

        /* 숨기기 */
        z-index: -1;
        opacity: 0;
      }

      .show {
        opacity: 1;
        z-index: 1000;
        transition: all 0.5s;
      }
      
      #show_btn{
              
        /*버튼 디폴트값 지우기*/
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance:none;
        
        border : 2px solid white;
        border-radius : 4px;
        padding : 10px 20px;
        background-color:transparent;
        color: white;
      }
      
      #show_btn:hover{
        border : 2px solid #004fff;
        color : #004fff;
      }
      
      #close_btn{
        /*버튼 디폴트값 지우기*/
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance:none;
        
        width:70px;
        height:40px;
        border-radius:4px;
        border : 0;
        background-color : #e0e0e0;
        color:black;
        float:right;
      }

      .window {
        position: relative;
        width: 100%;
        height: 100%;
      }

      .photoby_popup {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #ffffff;
        box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
		border-radius: 10px;
        /* 임시 지정 */
        width: 450px;
        height: 420px;

        /* 초기에 약간 아래에 배치 */
        transform: translate(-50%, -40%);
        
        padding : 50px;
      }

      .show .photoby_popup {
        transform: translate(-50%, -50%);
        transition: all 0.5s;
      }
      
      .photoby_popup h4{
      margin:0px;
     padding-bottom : 40px;
      text-align:center;
      
      }
      
      #photoby_content{
      padding-bottom : 20px;
      }
   
     #photoby_content p{
     color:black;
     }
     
     #photoby_content a{
     color:#004fff;
     }  

</style>
</head>
<body>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="about-veno">
                        <div class="logo">
                            <img src="../img/footer_logo.png">
                        </div>
                        <p></p>
                    </div>
                </div>
                <div class="col-md-3">
                  <div class="useful-links">
                        <div class="footer-heading">
                            <h5>메뉴</h5>
                        </div>
                        <div class="row">
                                <ul>
                                    <li><a href="#" ><i class="fa fa-stop"></i>홈</a></li>
                                    <li><a href="#" ><i class="fa fa-stop"></i>여행지</a></li>
                                    <li><a href="#" ><i class="fa fa-stop"></i>맛집</a></li>
                                    <li><a href="#" ><i class="fa fa-stop"></i>커뮤니티</a></li>
                                </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="useful-links">
                        <div class="footer-heading">
                            <h5>고객지원</h5>
                        </div>
                        <div class="row">
                                <ul>
                                    <li><a href="../notice/list.do"><i class="fa fa-stop"></i>공지사항</a></li>
                                    <li><a href="#"><i class="fa fa-stop"></i>문의게시판</a></li>
                                    <li><a href="#"><i class="fa fa-stop"></i>일반 관광 문의</a></li>
                                </ul>
                        </div>
                     </div>
                </div>
                <div class="col-md-2">
                    <div class="useful-links">
                        <div class="footer-heading">
                            <h5>운영</h5>
                        </div>
                        <p>월~금 오전 9시 ~ 오후 6시<br>
                        <a href="#">staff@seoul99trip.com</a>
                        </p>
                        <p>
                        <br><br><br><br><br>
                            <button id="show_btn">메인배너이미지 출처</button>
                        </p>
                        
			    <div class="background">
			      <div class="window">
			        <div class="photoby_popup">
			          <h4 style="color:black;">메인배너이미지 출처</h4>
			            <div id="photoby_content">
			            <p>
			            seoul-01&nbsp;&nbsp;경복궁 경회루 ⓒ
			            <a href="https://kr.freepik.com/free-photo/gyeongbokgung-palace-with-cherry-blossom-in-spring-south-korea_11306598.htm#page=4&query=%EA%B2%BD%EB%B3%B5%EA%B6%81&position=45&from_view=search&track=sph">작가 tawatchai07</a> 출처 Freepik
			            <p>
			            seoul-02&nbsp;&nbsp;N서울타워 ⓒ
			            <a href="https://kr.freepik.com/free-photo/seoul-tower-and-pink-cherry-blossom-sakura-season-in-spring-seoul-in-south-korea_11599557.htm#query=%EB%82%A8%EC%82%B0&position=45&from_view=search&track=sph">작가 tawatchai07</a> 출처 Freepik
			            <p>
			            seoul-03&nbsp;&nbsp;DDP ⓒ
			            <a href="https://kr.freepik.com/free-photo/dongdaemun-design-plaza_11599536.htm#query=%EB%8F%99%EB%8C%80%EB%AC%B8&from_query=ddp&position=1&from_view=search&track=sph">작가 tawatchai07</a> 출처 Freepik
			            <p>
			            seoul-04&nbsp;&nbsp;북한산 ⓒ
			            <a href="https://kr.freepik.com/free-photo/sunrise-at-baegundae-peak-and-bukhansan-mountains-in-autumn-seoul-in-south-korea_11600365.htm#page=3&query=%EA%B4%91%ED%99%94%EB%AC%B8&position=43&from_view=search&track=sph">작가 tawatchai07</a> 출처 Freepik
			            <p>
			            seoul-05&nbsp;&nbsp;광화문 ⓒ
			            <a href="https://kr.freepik.com/free-photo/beautiful-architecture-building-of-gyeongbokgung-palace_3798285.htm#query=%EA%B4%91%ED%99%94%EB%AC%B8&position=45&from_view=search&track=sph">작가 lifeforstock</a> 출처 Freepik
			            <p>
			            seoul-06&nbsp;&nbsp;반포대교 ⓒ
			            <a href="https://pixabay.com/ko/photos/대한민국-서울-한강-야경-2836848/">작가 dldusdn</a> 출처 Pixabay         
			            </div>
			            <button id="close_btn">닫기</button>      
			        </div>
			      </div>
			    </div>

                    </div>
                </div>
            </div>
        </div>
    <script>
      function show() {
        document.querySelector(".background").className = "background show";
      }

      function close() {
        document.querySelector(".background").className = "background";
      }

      document.querySelector("#show_btn").addEventListener("click", show);
      document.querySelector("#close_btn").addEventListener("click", close);
    </script>
    </footer>
</body>
</html>