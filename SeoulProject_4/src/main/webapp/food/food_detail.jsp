<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울99여행</title>
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
i.fa-heart,i.fa-thumbs-up,i.fa-home{
    padding: 10px;
    font-size: 20px;
    color: gray;
    border: 1px solid lightgray;
    border-radius: 50px;
    text-align: center;
    cursor:pointer;
}
.foodReview_section{
   width:100%;
}
.fReview_top{
   width:100%;
   display:inline-block;
}
.fReview_top h2{
   float:left;
}
.fReview_top .fReview_name{
   color: #004fff;
}
.fReview_top span{
   float:left;
   font-size: 24px;
   line-height:30px;
}
.fReview_top .blue_btn{
   padding: 7px 20px;
   float: right;
}
.fReview_body{
   width:1100px;
   padding: 70px;
   background: white;
   box-shadow : 0 3px 13px 0 rgb(0,0,0,0.2);
}


hr{ margin: 0; border-top: 1px solid lightgray;}


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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>
<div class="container">
   <div class="row">
            <table class="table">
     <tr>
       <c:forTokens items="${vo.poster }" delims="^" var="image">
       <td>
        <img src="${image }" style="width: 1200px" class="img-rounded"></td>
       </c:forTokens>
              <td class="text-center">
               <img src="${image }" style="width:1200px">
              </td>
       
     </tr>
   </table>
   </div>
   <div style="height: 10px"></div>
   <div class="row" style="width:1200px">
    <div class="col-sm-7">
      <table class="table">
       <tr>
        <td colspan="2">
          <h3>${vo.name }&nbsp;&nbsp;<span class="score" style="color:orange">${vo.score }</span></h3>
        </td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">주소</span></th>
         <td width="85%">${addr1 }<br>
           <br><sub style="color:gray">지번:${addr2 }</sub>
         </td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">전화번호</span></th>
         <td width="85%">${vo.tel }</td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">음식종류</span></th>
         <td width="85%">${vo.type }</td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">가격대</span></th>
         <td width="85%">${vo.price }</td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">영업시간</span></th>
         <td width="85%">${vo.time }</td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">주차</span></th>
         <td width="85%">${vo.parking }</td>
       </tr>
       <c:if test="${vo.menu!='no' }">
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">메뉴</span></th>
         <td width="85%">
           <ul>
            <c:forTokens items="${vo.menu }" delims="원" var="m">
           <li>${m }원</li>
         </c:forTokens>
           </ul>
         </td>
       </tr>
       </c:if>
       <tr>
          <td colspan="2" class="text-right">
           <%-- 비로그인 상태 찜/좋아요 --%>
            <c:if test="${sessionScope.id==null }">
                 
                <%-- 찜 --%>
                <span><i class="fa-sharp fa-solid fa-heart" onclick="alert('로그인이 필요합니다.')"></i></span>

                <%-- 좋아요 --%>
                <span><i class="fa-regular fa-thumbs-up" onclick="alert('로그인이 필요합니다.')"><span style="font-size:16px">(${like_total })</span></i></span>&nbsp;
                
            </c:if>
          
          
             <c:if test="${sessionScope.id!=null }">
             
             <%-- 찜 --%>
                <c:if test="${myJjim_count==0 }">
                  <a href="../jjim/foodjjim_insert.do?fno=${vo.fno }" class="circle_btn"><i class="fa-sharp fa-solid fa-heart j_btn" style="color:gray"></i></a>
                </c:if>
                <c:if test="${myJjim_count>0 }">
                  <a href="../jjim/foodjjim_delete.do?fno=${vo.fno }" class="circle_btn"><i class="fa-sharp fa-solid fa-heart j_btn" style="color:#f46555"></i></a>
                </c:if>

                <%-- 좋아요 --%>
                <c:if test="${myLike_count==0 }">
                  <a href="../like/foodlike_insert.do?fno=${vo.fno }" class="circle_btn"><i class="fa-regular fa-thumbs-up" style="color:gray"><span style="font-size:16px">(${like_total })</span></i></a>
                </c:if>
                <c:if test="${myLike_count>0 }">
                  <a href="../like/foodlike_delete.do?fno=${vo.fno }" class="circle_btn"><i class="fa-regular fa-thumbs-up" style="color:#f46555"><span style="font-size:16px">(${like_total })</span></i></a>
                </c:if>

            </c:if>
              <a href="javascript:history.back()" class="circle_btn"><i class="fa fa-home" style="font-size:17px">목록</i></a>
            </td>
       </tr>
      </table>
   </div>
   <!-- 지도~ -->
    <div class= "col-sm-2">
       <div id="map" style="width:435;height:350px;"></div>

      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b3cee0c7ab68fc8a8f7906e38fdf071&libraries=services"></script>
      <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };  
      
      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();
      
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${addr1}', function(result, status) {
      
          // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {
      
              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
      
              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
              });
      
              // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                  content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
              });
              infowindow.open(map, marker);
      
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
          } 
      });    
      </script>
    </div>
 <c:if test="${count>0 }">
      
	      <div class="titleAndBtn">
	         <h2>최근 댓글리뷰</h2>
	         <a href="#foodReview_section">전체 보러가기</a>
	      
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
      
     <div class="fReview_body">
         
         
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
                            <input type=hidden name="no" value="${vo.fno }">
                            <input type=hidden name="cate_no" value="2">
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
                               <a href="../all_reply/all_reply_delete.do?arno=${rvo.arno }&no=${vo.fno}&cate_no=2" class="whitegray_btn">삭제</a>
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
	                            <input type=hidden name="no" value="${vo.fno }">
	                            <input type=hidden name="arno" value="${rvo.arno }">
	                            <input type=hidden name="cate_no" value="2">
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
   
</body>
</html>