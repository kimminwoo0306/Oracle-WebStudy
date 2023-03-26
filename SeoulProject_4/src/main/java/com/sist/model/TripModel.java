//여행지, 축제 Model

package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.AllReplyDAO;
import com.sist.dao.FoodDAO;
import com.sist.dao.JjimDAO;
import com.sist.dao.LikeDAO;
import com.sist.dao.TripDAO;
import com.sist.vo.AllReplyVO;
import com.sist.vo.FoodVO;
import com.sist.vo.TripVO;

@Controller
public class TripModel {

	// 전체여행지페이지 페이지나누기
	@RequestMapping("trip/trip_all.do")
	public String trip_all(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		String tcno=request.getParameter("tcno");
		request.setAttribute("tcno",tcno);
		
		String searchWord=request.getParameter("searchWord");
		
		String[] tripCategory_name={"","명소","자연","즐길거리","쇼핑"};
		request.setAttribute("tripCategory_name",
		tripCategory_name[Integer.parseInt(tcno)]);
		 
		String[] content_title={"서울 구석구석 모든 여행지","서울 인기명소부터 숨은 명소까지",
		"서울 도심 속 자연을 느낄 수 있는 곳","서울의 다양한 즐길거리","서울 쇼핑의 시작과 끝"};
		request.setAttribute("content_title", content_title[Integer.parseInt(tcno)]);
		
		//전체여행지페이지 기본 리스트
		TripDAO dao=new TripDAO();
		List<TripVO> list=dao.tripAllListData(Integer.parseInt(tcno),curpage);
		int totalpage=dao.tripTotalPage(Integer.parseInt(tcno));
		 
		final int BLOCK=7;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage)
			endpage=totalpage;
		 
		request.setAttribute("list", list); request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage",endpage);
		
		request.setAttribute("main_jsp", "../trip/trip_all.jsp");
		return "../main/main.jsp";
	}

	// 여행지 쿠키
	@RequestMapping("trip/trip_before_detail.do")
	public String trip_before_detail(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("id");

		String user="";

		if (id==null)
			user="guest";
		else
			user=id;

		String tno=request.getParameter("tno");
		try {
			Cookie cookie=new Cookie(user + "_trip" + tno, tno); // 쿠키 이름, 쿠키값
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24); // 쿠키저장시간 24시간
			response.addCookie(cookie);
		} catch (Exception ex) {
		}
		return "redirect:../trip/trip_detail.do?tno=" + tno;
	}

	// 여행지 상세페이지
	@RequestMapping("trip/trip_detail.do")
	public String trip_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String tno=request.getParameter("tno");
		request.setAttribute("tno", tno);

		TripDAO dao=new TripDAO();
		TripVO vo=dao.tripDetail(Integer.parseInt(tno),1);

		// 주소에서 지역구만 자르기
		String gu=vo.getAddr();
		String[] addrSplit = gu.split(" ");
		gu=addrSplit[1];

		request.setAttribute("vo", vo);
		request.setAttribute("gu", gu);

		// 주변 맛집리스트 출력
		List<FoodVO> flist=dao.tripNearbyFood(gu);
		request.setAttribute("flist", flist);

		// 댓글리뷰 관련 : 리스트, 댓글개수
		AllReplyDAO adao=new AllReplyDAO();
		List<AllReplyVO> rList=adao.allReplyListData(Integer.parseInt(tno), 1);
		request.setAttribute("rList", rList);
		request.setAttribute("count", rList.size());

		//최근 댓글리뷰 리스트
		List<AllReplyVO> rcList=dao.tripRecentReply(1, Integer.parseInt(tno));
		request.setAttribute("rcList", rcList);
		
		//찜, 좋아요 관련 id 받기
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("id");
		
		//찜 개수 (개인)
		JjimDAO jdao=new JjimDAO();
		int mjc=jdao.myJjimCount(1,Integer.parseInt(tno), id);
		request.setAttribute("myJjim_count", mjc);
		
		//좋아요 개수 (개인, 전체)
		LikeDAO ldao=new LikeDAO();
		int mlc=ldao.myLikeCount(1,Integer.parseInt(tno), id); // cate_no 1번 여행지
		int alc=ldao.allLikeCount(1,Integer.parseInt(tno)); //cate_no 1번 여행지
		request.setAttribute("myLike_count", mlc);
		request.setAttribute("like_total", alc);
		
		request.setAttribute("main_jsp", "../trip/trip_detail.jsp");
		return "../main/main.jsp";

	}

   @RequestMapping("trip/trip_all_search.do")
   public String food_location(HttpServletRequest request,HttpServletResponse response)
   {
      try
      {
         request.setCharacterEncoding("UTF-8");
      }catch(Exception ex) {}
      
      String searchWord=request.getParameter("searchWord");

      //페이지 정보 받기
      String page=request.getParameter("page");
      if(page==null)
         page="1";
      
      //카테고리 관련 정보
      String tcno=request.getParameter("tcno");
      request.setAttribute("tcno", tcno);
      
      String tripCategory_name=request.getParameter("tripCategory_name");
      request.setAttribute("tripCategory_name", tripCategory_name);
      
      String content_title=request.getParameter("content_title");
      request.setAttribute("content_title", content_title);
      
      // 현재페이지
      int curpage=Integer.parseInt(page);

      // DAO
      TripDAO dao=new TripDAO();
      List<TripVO> tslist=dao.tripSearchAllListData(searchWord, Integer.parseInt(tcno), curpage);
      int totalpage=dao.tripCateSearchTotalPage(searchWord, Integer.parseInt(tcno));
      int srhCount=dao.tripCateSearchCount(searchWord, Integer.parseInt(tcno));
      
      //페이지네이션
      final int BLOCK=7;
      int startpage=((curpage-1)/BLOCK*BLOCK)+1;
      int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      if(endpage>totalpage)
         endpage=totalpage;
            
      request.setAttribute("tslist", tslist);
      request.setAttribute("curpage", curpage);
      request.setAttribute("totalpage", totalpage);
      request.setAttribute("startpage", startpage);
      request.setAttribute("endpage", endpage);
	  request.setAttribute("srhCount", srhCount);    
      request.setAttribute("searchWord", searchWord);
      request.setAttribute("main_jsp", "../trip/trip_all_search.jsp");
      return "../main/main.jsp";
            
   }	

}