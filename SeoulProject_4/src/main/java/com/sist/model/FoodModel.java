package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.dao.*;


@Controller
public class FoodModel {
	@RequestMapping("food/food_main.do") // 맛집 메인 페이지 
	public String food_main(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../food/food_main.jsp");
		return "../main/main.jsp";
	}

	// test용
		@RequestMapping("food/food_location.do")
		public String food_location(HttpServletRequest request,HttpServletResponse response)
		{
			try
			{
				request.setCharacterEncoding("UTF-8");
			}catch(Exception ex) {}
			String ss=request.getParameter("ss");
//			if(ss==null)
//				ss="성수";
			
			String page=request.getParameter("page");
			if(page==null)
				page="1";
			
			// 현재페이지
			int curpage=Integer.parseInt(page);
			// dao에서 데이터 읽기
			FoodDAO dao=new FoodDAO();
			ArrayList<FoodVO> list=dao.foodLocationFindData(curpage, ss);
			int totalpage=dao.foodLocationTotalPage(ss);
			
			// 20개씩 나눠놨기 때문에 BLOCK 줄 필요 없음? >> 응 그거 아니야ㅜ
			
			final int BLOCK=10;
			   int startPage=((curpage-1)/BLOCK*BLOCK)+1;// curpage=10   (9/10*10)+1
			   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			   /*
			    *     [1]  ~~~~  [10]  =========================> curpage : 1~10 ==> 1
			    *     ---                                                        ==> 10
			    *     startPage  endPage                          curpage : 11~20 ==> 11
			    *                                                                 ==> 20
			    *                                                                 
			    *     startPage : 1 ,  11  ,  21......
			    *     endPage   : 10 , 20 ,   30
			    */                   
			   if(endPage>totalpage)
				   endPage=totalpage;
			   // 대소문자 구분 주의요..
			   request.setAttribute("curpage", curpage);
			   request.setAttribute("totalpage", totalpage);
			   request.setAttribute("startpage", startPage);
			   request.setAttribute("endpage", endPage);
			   request.setAttribute("list", list);
			request.setAttribute("ss", ss);
			request.setAttribute("main_jsp", "../food/food_location.jsp");
			return "../main/main.jsp";
					
		}
//	@RequestMapping("food/food_list.do")
//	public String food_list(HttpServletRequest request, HttpServletResponse response)
//	{
//		// ../food/food_list.do?fcno=10
//		//System.out.println(1);
//		// 1. 요청값 받기
//		String fcno=request.getParameter("no");
//		// 데이터베이스에서 값 읽어오기
//		FoodDAO dao=new FoodDAO();
//		// 결과값을 얻어서 request에 담아주기 >> 
//		ArrayList<FoodVO> list=dao.foodListData(Integer.parseInt(fcno));
//		//LikeDAO ldao=new LikeDAO();
//		for(FoodVO fvo:list)
//		{
//			//System.out.println(fvo.getName());
//			//fvo.setCount(ldao.foodLikeInsert(null))
//		}
//		request.setAttribute("list", list);
//		FoodCategoryVO vo=dao.categoryInfoData(Integer.parseInt(fcno));
//		request.setAttribute("vo", vo);
//		//System.out.println(vo.getSubtitle());
//		//System.out.println(vo.getTitle());
//		request.setAttribute("main_jsp", "../food/food_list.jsp");
//		return "../main/main.jsp";
//				
//	}
	// test
	@RequestMapping("food/food_list2.do")
	public String food_list2(HttpServletRequest request, HttpServletResponse response)
	{
		// ../food/food_list.do?fcno=10
		//System.out.println(1);
		// 1. 요청값 받기
		String fcno=request.getParameter("no");
		// 데이터베이스에서 값 읽어오기
		FoodDAO dao=new FoodDAO();
		// 결과값을 얻어서 request에 담아주기 >> 
		ArrayList<FoodVO> list=dao.foodListData2(Integer.parseInt(fcno));
		//LikeDAO ldao=new LikeDAO();
//		for(FoodVO fvo:list)
//		{
			//System.out.println(fvo.getName());
			//fvo.setCount(ldao.foodLikeInsert(null))
//		}
		request.setAttribute("list", list);
		FoodCategoryVO vo=dao.categoryInfoData2(Integer.parseInt(fcno));
		request.setAttribute("vo", vo);
		//System.out.println(vo.getSubtitle());
		//System.out.println(vo.getTitle());
		request.setAttribute("main_jsp", "../food/food_list2.jsp");
		return "../main/main.jsp";
				
	}
	
	// 쿠키 최근 방문 기록 (검색용)
	
	 @RequestMapping("food/food_find_before_detail.do")
	   public String food_find_before_detail(HttpServletRequest request,HttpServletResponse response)
	   {
	      HttpSession session=request.getSession();
	      String id=(String)session.getAttribute("id");
	      
	      String user="";
	      
	      if(id==null)
	         user="guest";
	      else
	         user=id;
	      
	      String fno=request.getParameter("fno");
	      try
	      {
	         Cookie cookie=new Cookie(user+"_food_loc"+fno, fno);
	         cookie.setPath("/");
	         cookie.setMaxAge(60*60*24);
	         response.addCookie(cookie);
	      }catch(Exception ex) {}
	      return "redirect:../food/food_find_detail.do?fno="+fno;
	   }
	 // 쿠키 (카테고리용)
	 @RequestMapping("food/food_before_detail.do")
	   public String food_before_detail(HttpServletRequest request,HttpServletResponse response)
	   {
	      HttpSession session=request.getSession();
	      String id=(String)session.getAttribute("id");
	      
	      String user="";
	      
	      if(id==null)
	         user="guest";
	      else
	         user=id;
	      
	      String fno=request.getParameter("fno");
	      try
	      {
	         Cookie cookie=new Cookie(user+"_food"+fno, fno);
	         cookie.setPath("/");
	         cookie.setMaxAge(60*60*24);
	         response.addCookie(cookie);
	      }catch(Exception ex) {}
	      return "redirect:../food/food_detail.do?fno="+fno;
	   }
	 
	 
	 // 
	 
	 
	 // 카테고리 용 푸드 상세페이지
//	 @RequestMapping("food/food_detail.do")
//		public String food_detail(HttpServletRequest request, HttpServletResponse response)
//		{
//			String fno=request.getParameter("fno");
//			// 데이터베이스 연결
//			FoodDAO dao=new FoodDAO();
//			FoodVO vo=dao.foodDetail(Integer.parseInt(fno));
//			String addr=vo.getAddr();
//			String addr1=addr.substring(0, addr.lastIndexOf("지"));
//			addr1=addr1.trim();
//			String addr2=addr.substring(addr.lastIndexOf("지")+3);
//			request.setAttribute("vo",vo);
//			request.setAttribute("addr1", addr1);
//			request.setAttribute("addr2", addr2);
//			// 화면 출력
//			
//			// 댓글 
//			AllReplyDAO rdao=new AllReplyDAO();
//			List<AllReplyVO> rList=rdao.allReplyListData(Integer.parseInt(fno), 3);
//			request.setAttribute("rList", rList);
//			request.setAttribute("count", rList.size());
//			
//			// 최신 댓글 출력
//			List<AllReplyVO> frList=dao.foodRecentReply(3, Integer.parseInt(fno));
//			request.setAttribute("frList", frList);
//			
//			// 찜, 좋아요 관련 id 받기
//			HttpSession session=request.getSession();
//			String id=(String)session.getAttribute("id");
//			
//			// 찜 개수(개인)
//			JjimDAO jdao=new JjimDAO();
//			int jcount=jdao.myJjimCount(2,Integer.parseInt(fno), id);
//			request.setAttribute("myJjim_count", jcount);
//			
//			// 좋아요 개수 (개인, 전체)
//			LikeDAO ldao=new LikeDAO();
//			int mc=ldao.myLikeCount(2,Integer.parseInt(fno), id);
//			int tc=ldao.allLikeCount(2,Integer.parseInt(fno));
//			request.setAttribute("myLike_count", mc);
//			request.setAttribute("like_total", tc);
//		
//			request.setAttribute("main_jsp", "../food/food_detail.jsp");
//			return "../main/main.jsp";
//		}
	 // 검색용 상세페이지
	 @RequestMapping("food/food_find_detail.do")
		public String foodFinddetail(HttpServletRequest request, HttpServletResponse response)
		{
			String fno=request.getParameter("fno");
			// 데이터베이스 연결
			FoodDAO dao=new FoodDAO();
			FoodVO vo=dao.foodFindDetail(Integer.parseInt(fno));
			String addr=vo.getAddr();
			String addr1=addr.substring(0, addr.lastIndexOf("지"));
			addr1=addr1.trim();
			String addr2=addr.substring(addr.lastIndexOf("지")+3);
			request.setAttribute("vo",vo);
			request.setAttribute("addr1", addr1);
			request.setAttribute("addr2", addr2);
			// 화면 출력
			
			// 댓글 
			AllReplyDAO rdao=new AllReplyDAO();
			List<AllReplyVO> rList=rdao.allReplyListData(Integer.parseInt(fno), 2);
			request.setAttribute("rList", rList);
			request.setAttribute("count", rList.size());
			
			// 최신 댓글 출력
			List<AllReplyVO> frList=dao.foodRecentReply(2, Integer.parseInt(fno));
			request.setAttribute("frList", frList);
			
			// 찜, 좋아요 관련 id 받기
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			
			// 찜 개수(개인)
			JjimDAO jdao=new JjimDAO();
			int jcount=jdao.myJjimCount(2,Integer.parseInt(fno), id);
			request.setAttribute("myJjim_count", jcount);
			
			// 좋아요 개수 (개인, 전체)
			LikeDAO ldao=new LikeDAO();
			int mc=ldao.myLikeCount(2,Integer.parseInt(fno), id);
			int tc=ldao.allLikeCount(2,Integer.parseInt(fno));
			request.setAttribute("myLike_count", mc);
			request.setAttribute("like_total", tc);
		
			request.setAttribute("main_jsp", "../food/food_find_detail.jsp");
			return "../main/main.jsp";
		}
}
