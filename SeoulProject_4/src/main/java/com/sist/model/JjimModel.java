package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.JjimDAO;
import com.sist.vo.AllJjimVO;

@Controller
public class JjimModel {
//	// 카테고리 상세 
//	@RequestMapping("jjim/foodjjim_insert.do")
//	public String jjim_insert(HttpServletRequest request, HttpServletResponse response)
//	{
//		String fno=request.getParameter("fno");
//		
//		HttpSession session=request.getSession();
//		String id=(String)session.getAttribute("id");
//		
//		AllJjimVO vo=new AllJjimVO();
//		vo.setNo(Integer.parseInt(fno));
//		vo.setId(id);
//		
//		// db연동
//		JjimDAO dao=new JjimDAO();
//		dao.foodJjimInsert(vo);
//		
//		return "redirect:../food/food_detail.do?fno="+fno;
//	}
	// 검색용 상세
	@RequestMapping("jjim/foodjjim_insert.do")
	public String jjim_find_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String fno=request.getParameter("fno");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		AllJjimVO vo=new AllJjimVO();
		vo.setNo(Integer.parseInt(fno));
		vo.setId(id);
		
		// db연동
		JjimDAO dao=new JjimDAO();
		dao.foodJjimInsert(vo);
		
		return "redirect:../food/food_find_detail.do?fno="+fno;
	}
	
	@RequestMapping("jjim/tripjjim_insert.do")
	public String tripjjim_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String tno=request.getParameter("tno");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		AllJjimVO vo=new AllJjimVO();
		vo.setNo(Integer.parseInt(tno));
		vo.setId(id);
		
		// db연동
		JjimDAO dao=new JjimDAO();
		dao.tripJjimInsert(vo);
		
		return "redirect:../trip/trip_detail.do?tno="+tno;
	}
	@RequestMapping("jjim/tripjjim_delete.do")
	public String tripjjim_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String tno=request.getParameter("tno");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		AllJjimVO vo=new AllJjimVO();
		vo.setNo(Integer.parseInt(tno));
		vo.setId(id);
		
		// db연동
		JjimDAO dao=new JjimDAO();
		dao.tripJjimDelete(1, Integer.parseInt(tno), id);
		
		return "redirect:../trip/trip_detail.do?tno="+tno;
	}
//	// 카테고리용 상세페이지 삭제
//	@RequestMapping("jjim/foodjjim_delete.do")
//	public String foodjjim_delete(HttpServletRequest request, HttpServletResponse response)
//	{
//		String fno=request.getParameter("fno");
//		
//		HttpSession session=request.getSession();
//		String id=(String)session.getAttribute("id");
//		
//		AllJjimVO vo=new AllJjimVO();
//		vo.setNo(Integer.parseInt(fno));
//		vo.setId(id);
//		
//		// db연동
//		JjimDAO dao=new JjimDAO();
//		dao.foodJjimDelete(2, Integer.parseInt(fno), id);
//		
//		return "redirect:../food/food_detail.do?fno="+fno;
//	}
	// 검색용 상세페이지 삭제 
	@RequestMapping("jjim/foodjjim_delete.do")
	public String foodjjim_find_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String fno=request.getParameter("fno");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		AllJjimVO vo=new AllJjimVO();
		vo.setNo(Integer.parseInt(fno));
		vo.setId(id);
		
		// db연동
		JjimDAO dao=new JjimDAO();
		dao.foodJjimDelete(2, Integer.parseInt(fno), id);
		
		return "redirect:../food/food_find_detail.do?fno="+fno;
	}
}
