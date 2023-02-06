package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import com.sist.vo.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.JjimDAO;
import com.sist.dao.ReserveDAO;
<<<<<<< HEAD
import com.sist.dao.JjimDAO;
import java.util.*;
=======

>>>>>>> branch 'main' of https://github.com/kimminwoo0306/Oracle-WebStudy.git
import java.util.*;
import com.sist.vo.*;
@Controller
public class MyPageModel {
<<<<<<< HEAD
	@RequestMapping("mypage/mypage_main.do")
	public String mypage_main(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("mypage_jsp", "../mypage/mypage_home.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		CommonsModel.footerData(request);
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/jjim_list.do")
	public String mypage_jjim(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		JjimDAO dao=new JjimDAO();
		List<JjimVO> list=dao.jjimListData(id);
		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "../jjim/jjim_list.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		CommonsModel.footerData(request);
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/jjim_delete.do")
	public String mypage_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String jno=request.getParameter("no");
		JjimDAO dao=new JjimDAO();
		dao.jjimDelete(Integer.parseInt(jno));
		return "redirect:jjim_list.do";
	}
}
=======
   @RequestMapping("mypage/mypage_main.do")
   public String mypage_main(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("mypage_jsp", "../mypage/mypage_home.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   CommonsModel.footerData(request);
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/jjim_list.do")
   public String mypage_jjim(HttpServletRequest request,HttpServletResponse response)
   {
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   JjimDAO dao=new JjimDAO();
	   List<JjimVO> list=dao.jjimListData(id);
	   request.setAttribute("list", list);
	   request.setAttribute("mypage_jsp", "../jjim/jjim_list.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   CommonsModel.footerData(request);
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/jjim_delete.do")
   public String mypage_jjim_delete(HttpServletRequest request,HttpServletResponse response)
   {
	   String jno=request.getParameter("no");
	   JjimDAO dao=new JjimDAO();
	   dao.jjimDelete(Integer.parseInt(jno));
	   return "redirect:jjim_list.do";
   }
   @RequestMapping("mypage/mypage_reserve_info.do")
   public String mypage_reserve_info(HttpServletRequest request,HttpServletResponse response)
   {
	   String rno=request.getParameter("rno");
	   ReserveDAO dao=new ReserveDAO();
	   ReserveVO vo=dao.mypageReserveInfo(Integer.parseInt(rno));
	   request.setAttribute("vo", vo);
	   return "../mypage/mypage_reserve_info.jsp";
   }
}
>>>>>>> branch 'main' of https://github.com/kimminwoo0306/Oracle-WebStudy.git
