package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.LikeDAO;
import com.sist.vo.AllLikeVO;

@Controller
public class LikeModel {
	// 맛집 카테고리 상세페이지 좋아요
//	@RequestMapping("like/foodlike_insert.do")
//	public String foodlike_insert(HttpServletRequest request, HttpServletResponse response)
//	{
//		String fno=request.getParameter("fno");
//		
//		HttpSession session=request.getSession();
//		String id=(String)session.getAttribute("id");
//		
//		AllLikeVO vo=new AllLikeVO();
//		vo.setNo(Integer.parseInt(fno));
//		vo.setId(id);
//		
//		LikeDAO dao=new LikeDAO();
//		dao.foodLikeInsert(vo);
//		
//		return "redirect:../food/food_detail.do?fno="+fno;
//	}
	// 맛집 검색 상세페이지 좋아요
	@RequestMapping("like/foodlike_insert.do")
	public String foodlike_Find_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String fno=request.getParameter("fno");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		AllLikeVO vo=new AllLikeVO();
		vo.setNo(Integer.parseInt(fno));
		vo.setId(id);
		
		LikeDAO dao=new LikeDAO();
		dao.foodLikeInsert(vo);
		
		return "redirect:../food/food_find_detail.do?fno="+fno;
	}
	@RequestMapping("like/triplike_insert.do")
	public String triplike_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String tno=request.getParameter("tno");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		AllLikeVO vo=new AllLikeVO();
		vo.setNo(Integer.parseInt(tno));
		vo.setId(id);

		LikeDAO dao=new LikeDAO();
		dao.tripLikeInsert(vo);
		
		return "redirect:../trip/trip_detail.do?tno="+tno;
	}
	@RequestMapping("like/triplike_delete.do")
	public String triplike_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String tno=request.getParameter("tno");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		AllLikeVO vo=new AllLikeVO();
		vo.setNo(Integer.parseInt(tno));
		vo.setId(id);

		LikeDAO dao=new LikeDAO();
		dao.tripLikeDelete(1, Integer.parseInt(tno), id);
		
		return "redirect:../trip/trip_detail.do?tno="+tno;
	}
	// 카테고리 상세페이지 좋아요 삭제 
//	@RequestMapping("like/foodlike_delete.do")
//	public String foodlike_delete(HttpServletRequest request, HttpServletResponse response)
//	{
//		String fno=request.getParameter("fno");
//		
//		HttpSession session=request.getSession();
//		String id=(String)session.getAttribute("id");
//		
//		AllLikeVO vo=new AllLikeVO();
//		vo.setNo(Integer.parseInt(fno));
//		vo.setId(id);
//
//		LikeDAO dao=new LikeDAO();
//		dao.foodLikeDelete(2, Integer.parseInt(fno), id);
//		
//		return "redirect:../food/food_detail.do?fno="+fno;
//	}
	
	// 검색 상세페이지 좋아요 삭제 
	@RequestMapping("like/foodlike_delete.do")
	public String foodlike_Find_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String fno=request.getParameter("fno");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		AllLikeVO vo=new AllLikeVO();
		vo.setNo(Integer.parseInt(fno));
		vo.setId(id);

		LikeDAO dao=new LikeDAO();
		dao.foodLikeDelete(2, Integer.parseInt(fno), id);
		
		return "redirect:../food/food_find_detail.do?fno="+fno;
	}
}
