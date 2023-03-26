<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.allTopTitle{
	margin: 60px 0 30px 0;
	text-align: center;
}
h3{
	margin:0;	
}
h3.subtitle{
	margin: 0 0 10px 0;
	height:36px;
	line-height:36px;
	background:#004fff;
	color:white;
	font-size:16px;
/* 	border-bottom:3px solid #004fff;
	color: #004fff; */
}
.table>thead>tr>th,.table>tbody>tr>th,.table>tfoot>tr>th,
.table>thead>tr>td, .table>tbody>tr>td,.table>tfoot>tr>td
{
	border:0;
}
caption{
	padding: 0;
}
.text_btn{
    padding: 0;
    width: 25%;
    font-size: 14px;
    text-align: center;
    border: 0;
    border-right: 1px solid #004fff;
    border-radius: 0;
    cursor:pointer;
}
.text_btn:last-child{
	border-right:0;
}
.whitegray_btn{
	padding: 8px;
	margin: 6px 3px;
	width:60px;
	height:42px;
	text-align:center;
	display:inline-block;
	cursor:pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'POST',
		url:'../reserve/food_list.do',
		data:{"fd":'한식'},
		success:function(response)
		{
			$('#food_list').html(response); // JSON (스프링)
		}
	})
	
 	$('.foods').click(function(){
		let fd=$(this).text();
		$.ajax({
			type:'POST',
			url:'../reserve/food_list.do',
			data:{"fd":fd},
			success:function(response)
			{
				$('#food_list').html(response); // JSON (스프링)
			}
		})
	}) 
	
	
})
</script>
</head>
<body>
<div class="container">


   <div style="height: 60px"></div>
   <table class="table" style="width: 100%;height: 800px; box-shadow:0 3px 10px 0 rgba(0,0,0,0.2)">
     <tr>
       <td style="width:409px;height:500px;">
         <table class="table">
           <caption><h3 class="text-center subtitle">맛집 선택</h3></caption>
           <tr style="border-bottom:3px solid #004fff">
            <td style="display:flex;justify-content:space-evenly;padding: 8px 8px 16px 8px;">
             <span class="text_btn foods" >한식</span>
             <span class="text_btn foods" >양식</span>
             <span class="text_btn foods" >중식</span>
             <span class="text_btn foods" >일식</span>
             <span class="text_btn foods" >기타</span>
            </td>
           </tr>
           <tr>
             <td>
              <div id="food_list" style="height:450px;overflow-y:scroll">
                
              </div>
             </td>
           </tr>
         </table>
       </td>
       <td width=409 height="500">
         <table class="table">
           <caption><h3 class="text-center subtitle">예약일 선택</h3></caption>
           <tr>
             <td>
               <div id=select_date></div>
             </td>
           </tr>
         </table>
         <div id="submsg" style="display:none;">
	         <div style="width:20px;height:20px;position:relative;top:30px;left:50px;background:#d9edf7;"></div>
	         <span style="position:relative;top:7px;left:80px;">예약가능날짜</span>
         </div>
       </td>
       <td width=351 rowspan="2" height="700" style="border-left:2px solid #e0e0e0;">
         <table class="table">
           <caption><h3 class="text-center subtitle">예약 정보</h3></caption>
           <tr>
             <td class="text-center" colspan=2>
                 <img id="food_img" src="image/ready.png" style="margin:0 0 10px 0;width:295px;height:295px;" >
             </td>
           </tr>
           <tr>
             <th style="padding:8px 8px 8px 16px;">맛집명</th>
             <td class="text-left" colspan=2>
               <span id="food_name">(선택전)</span>
             </td>
           </tr>
           <tr>
             <th width=30% style="padding:8px 8px 8px 16px;">예약일</th>
             <td width=70%><span id="r_day" >(선택전)</span></td>
           </tr>
           <tr>
             <th width="30%" style="padding:8px 8px 8px 16px;">예약시간</th>
             <td width=70%><span id="r_time">(선택전)</span></td>
           </tr>
           <tr>
             <th width="30%" style="padding:8px 8px 8px 16px;">예약인원</th>
             <td width=70%><span id="r_inwon">(선택전)</span></td>
           </tr>
           <tr>
             <td colspan="2" class="text-center ok_btn" style="display:none;padding: 30px 0;">
               <form method="post" action="../reserve/reserve_ok.do">
                 <input type=hidden name="fno" id="fno">
                 <input type=hidden name="reserveday" id="reserveday">
                 <input type=hidden name="reservetime" id="reservetime">
                 <input type=hidden name="reserveinwon" id="reserveinwon">
                 <input type=submit value="예약하기" class="blue_btn" style="width:50%;">
               </form>
             </td>
           </tr>
         </table>
       </td>
     </tr>
     <tr>
       <td class="default" width="35%" height="220">
         <table class="table">
           <caption><h3 class="text-center subtitle">시간 선택</h3></caption>
           <tr>
             <td>
               <div id="select_time" style="position:relative;left:5px;"></div>
             </td>
           </tr>
         </table>
       </td>
       <td width="35%" height="220">
         <table class="table">
           <caption><h3 class="text-center subtitle">인원 선택</h3></caption>
           <tr>
             <td>
               <div id="select_inwon" style="position:relative;left:10px;"></div>
             </td>
           </tr>
         </table>
       </td>
     </tr>
   </table>
   
   
</div>
</body>
</html>