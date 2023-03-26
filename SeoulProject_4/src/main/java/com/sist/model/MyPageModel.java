package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.dao.JjimDAO;
import com.sist.dao.LikeDAO;
import com.sist.dao.MemberDAO;
import com.sist.dao.NoticeDAO;
import com.sist.dao.ReserveDAO;

import java.io.PrintWriter;
//import com.sist.dao.JjimDAO;
import java.util.*;
import com.sist.vo.*;
@Controller
public class MyPageModel {
   @RequestMapping("mypage/mypage_main.do")
   public String mypage_main(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("mypage_jsp", "../mypage/mypage_home.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	  
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/trip_jjim_list.do")
   public String mypage_trip_jjim(HttpServletRequest request,HttpServletResponse response)
   {
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   JjimDAO dao=new JjimDAO();
	   List<AllJjimVO> list=dao.tripJjimListData(id);
	   request.setAttribute("list", list);
	   request.setAttribute("mypage_jsp", "../jjim/trip_jjim_list.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/trip_jjim_delete.do")
   public String mypage_trip_jjim_delete(HttpServletRequest request,HttpServletResponse response)
   {
	   String ajno=request.getParameter("ajno");
	   JjimDAO dao=new JjimDAO();
	   dao.jjimDelete(Integer.parseInt(ajno));
	   return "redirect:trip_jjim_list.do";
   }
   @RequestMapping("mypage/food_jjim_list.do")
   public String mypage_food_jjim(HttpServletRequest request,HttpServletResponse response)
   {
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   JjimDAO dao=new JjimDAO();
	   List<AllJjimVO> list=dao.foodJjimListData(id);
	   request.setAttribute("list", list);
	   request.setAttribute("mypage_jsp", "../jjim/food_jjim_list.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/food_jjim_delete.do")
   public String mypage_food_jjim_delete(HttpServletRequest request,HttpServletResponse response)
   {
	   String ajno=request.getParameter("ajno");
	   JjimDAO dao=new JjimDAO();
	   dao.jjimDelete(Integer.parseInt(ajno));
	   return "redirect:food_jjim_list.do";
   }
   
   @RequestMapping("mypage/member_update.do")
   public String member_update(HttpServletRequest request,HttpServletResponse response) {
	   String id=request.getParameter("id");
	   
	   MemberDAO dao=new MemberDAO();
	   MemberVO vo=dao.member_info(id);
	   boolean result=false;
	   if(id.equals(vo.getId())) {
		   result=true;
	   }else {
		   
	   }
	   System.out.println(result);
	   
	   request.setAttribute("id", id);
	   request.setAttribute("vo", vo);
	   request.setAttribute("mypage_jsp", "../mypage/member_update.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/join_update.do")
   public String member_join_update(HttpServletRequest request,HttpServletResponse response)
   {
 	  HttpSession session=request.getSession();
 	  String id=(String)session.getAttribute("id");
 	   MemberDAO dao=new MemberDAO();
	   MemberVO vo=dao.member_info(id);
 	  
 	  request.setAttribute("vo", vo);
 	  request.setAttribute("mypage_jsp", "../mypage/member_update.jsp");
 	  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
 	  return "../main/main.jsp";
   }
   @RequestMapping("mypage/join_update_ok.do")
   public void member_join_update_ok(HttpServletRequest request,HttpServletResponse response)
   {
 	   // ajax 
	   try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String id=request.getParameter("id");
		  String pwd=request.getParameter("pwd");
		  String name=request.getParameter("name");
		  String sex=request.getParameter("sex");
		  String nick=request.getParameter("nick");
		  String day=request.getParameter("day");
		  String email=request.getParameter("email");
		  String phone1=request.getParameter("phone1");
		  String phone2=request.getParameter("phone2");
		  String phone3=request.getParameter("phone3");
		  String tos=request.getParameter("tos");
		  
		  System.out.println(id);
		  System.out.println(pwd);
		  System.out.println(name);
		  System.out.println(sex);
		  
		  MemberVO vo=new MemberVO();
		  vo.setId(id);
		  vo.setPwd(pwd);
		  vo.setName(name);
		  vo.setSex(sex);
		  vo.setNick(nick);
		  vo.setBirth(day);
		  vo.setEmail(email);
		  vo.setPhone(phone1+"-"+phone2+"-"+phone3);
		  vo.setTos("y");
 	  
 	  MemberDAO dao=new MemberDAO();
 	  boolean bCheck=dao.memberJoinUpdate(vo);
 	  try
 	  {
 	      PrintWriter out=response.getWriter();
 	      if(bCheck==true)
 	      {
 	    	  out.println("yes");
 	    	  HttpSession session=request.getSession();
 	    	  session.setAttribute("name", vo.getName());
 	      }
 	      else 
 	      {
 	    	  out.println("no");
 	      }
 	  }catch(Exception ex) {}
   }
   
   @RequestMapping("mypage/join_delete.do")
   public String member_delete(HttpServletRequest request,HttpServletResponse response)
   {
 	  
 	  request.setAttribute("mypage_jsp", "../mypage/join_delete.jsp");
 	  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
 	
 	  return "../main/main.jsp";
   }
   
   @RequestMapping("mypage/join_delete_ok.do")
   public void member_delete_ok(HttpServletRequest request,HttpServletResponse response)
   {
 	  HttpSession session=request.getSession();
 	  String id=(String)session.getAttribute("id");
 	  String pwd=request.getParameter("pwd");
 	  MemberDAO dao=new MemberDAO();
 	  boolean bCheck=dao.memberJoinDelete(id, pwd);
 	  try
 	  {
 		  PrintWriter out=response.getWriter();
 		  if(bCheck==true)
 		  {
 			  out.println("yes");
 			  session.invalidate();
 		  }
 		  else
 		  {
 			  out.println("no");
 		  }
 	  }catch(Exception ex) {}
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
   /////////////////////////////////////////////////////////////////////////////////////////
   @RequestMapping("mypage/board_list.do")
   public String my_board_list(HttpServletRequest request,HttpServletResponse response)
   {
 	// 사용자 보내준 데이터 받기 
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   
	   
	   String name=(String)session.getAttribute("name");
 	  
 		BoardDAO dao=new BoardDAO();
 		ArrayList<BoardVO> list=dao.my_boardListData(id);
 		request.setAttribute("name", name);
 		request.setAttribute("list", list);
 	  request.setAttribute("mypage_jsp", "../mypage/board_list.jsp");
 	  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
 	  
 	  return "../main/main.jsp";
   }
   @RequestMapping("mypage/update.do")
	public String board_update(HttpServletRequest request, HttpServletResponse response)
	   {
		   String bno=request.getParameter("bno");
		   BoardDAO dao=new BoardDAO();
		   BoardVO vo=dao.boardUpdateData(Integer.parseInt(bno));
		   HttpSession session=request.getSession();
		   String name=(String)session.getAttribute("name");
		   
		   request.setAttribute("vo", vo);
		   request.setAttribute("name", name);
		   request.setAttribute("mypage_jsp", "../mypage/board_update.jsp");
		   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		   
		   return "../main/main.jsp";
	   }
	@RequestMapping("mypage/update_ok.do")
	public String board_update_ok(HttpServletRequest request, HttpServletResponse response)
	   {
		   try
		   {
			   // 한글 변환
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   HttpSession session=request.getSession();
		   String name=(String)session.getAttribute("name");
		   String title=request.getParameter("title");
		   String content=request.getParameter("content");
		   String bno=request.getParameter("bno");
		   String moddate=request.getParameter(bno);
		   BoardVO vo=new BoardVO();
		   vo.setName(name);
		   vo.setTitle(title);
		   vo.setContent(content);
		   vo.setBno(Integer.parseInt(bno));
		   BoardDAO dao=new BoardDAO();
		   dao.ad_boardUpdate(vo);
		   String msg="yes";
		   request.setAttribute("msg", msg);
		   

		   return "redirect:board_list.do";
	   }
	//adminpage/board_delete.do
	@RequestMapping("mypage/board_delete.do")
	  public String admin_board_delete(HttpServletRequest request,HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  //DAO연동 
		  BoardDAO dao=new BoardDAO();
		  dao.ad_boardDelete(Integer.parseInt(no));
		  return "redirect:board_list.do";
	  }
	@RequestMapping("mypage/chage_pwd.do")
	  public String chage_pwd(HttpServletRequest request,HttpServletResponse response) {
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  String new_pwd=request.getParameter("new_pwd");
		  String pwd=request.getParameter("pwd");
		  String email=request.getParameter("email");
		  
		  MemberDAO dao=new MemberDAO();
		  
		  //dao.pwd_chage(email, pwd, new_pwd, id);
		  
		  
		  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		  request.setAttribute("mypage_jsp", "../mypage/chage_pwd.jsp");
		  return "../main/main.jsp";
	  }
	@RequestMapping("mypage/my_detail.do")
	public String ad_board_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String bno=request.getParameter("bno");
		
		   
		BoardDAO dao=new BoardDAO();
		BoardVO vo=dao.my_boardDetailData(Integer.parseInt(bno));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		request.setAttribute("mypage_jsp", "../mypage/board_detail.jsp");
		
		List<BoardReplyVO> list=dao.replyListData(Integer.parseInt(bno));
		request.setAttribute("list", list);
		request.setAttribute("count", list.size());
		
		return "../main/main.jsp";
	}
   
}