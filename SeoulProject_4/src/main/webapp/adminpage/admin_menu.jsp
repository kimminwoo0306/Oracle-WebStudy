<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#responsive-admin-menu{
position:relative;
top:80px;
}
</style>
</head>
<body>
  <div id="menu" >
			<a href="../adminpage/ad_member_list.do" title="mm"><i class="icon-user"></i><span> 
			회원</span></a>
			<a href="../adminpage/notice_list.do" title="News"><i class="icon-bullhorn"></i><span> 공지사항</span></a>
			<a href="../adminpage/ad_board_reply_list.do" title="Pages"><i class="icon-file-alt"></i><span> 자유 게시판 댓글 관리</span></a>
			<a href="../adminpage/ad_all_reply_list.do" title="Pages"><i class="icon-plane"></i><span> 여행지 / 맛집 댓글관리</span></a>
    
			<a href="" title="Media" class="submenu" name="media-sub"><i class="icon-eye-open"></i><span>  
			커뮤니티 관리</span></a>
			<!-- Media Sub Menu -->
				<div id="media-sub" style="display: none;">
					
					<a href="../adminpage/board_list.do" title="Photo Gallery"><i class="icon-picture"></i><span>  
					자유게시판</span></a>
				</div>
			<!-- Media Sub Menu -->

			<a href="" class="submenu" name="other-sub" title="Other Contents"><i class="icon-book"></i><span> 
			서비스 관리</span></a>
			<!-- Other Contents Sub Menu -->
				<div id="other-sub" style="display: none;">
					<a href="../adminpage/admin_reserve.do" title="Forms"><i class="icon-list"></i><span>  
					예약관리</span></a>
					
					
				</div>
			<!-- Other Contents Sub Menu -->
			
	</div>
</body>
</html>