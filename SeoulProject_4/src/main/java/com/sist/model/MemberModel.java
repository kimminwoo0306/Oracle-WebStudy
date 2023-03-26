package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

import java.util.*;
@Controller
public class MemberModel {
  @RequestMapping("member/join.do")
  public String member_join(HttpServletRequest request,HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../member/join.jsp");
	  return "../main/main.jsp";
  }
  // => javascript => Ajax ,Vue,React (단독으로 수행)
  @RequestMapping("member/idcheck.do")
  public String member_idCheck(HttpServletRequest request,HttpServletResponse response)
  {
	  return "../member/idcheck.jsp";
  }
  @RequestMapping("member/idcheck_result.do")
  public String member_idcheck_result(HttpServletRequest request,HttpServletResponse response)
  {
	  String id=request.getParameter("id");
	  MemberDAO dao=new MemberDAO();
	  int count=dao.memberIdCheck(id);
	  request.setAttribute("count", count);//JSP로 값을 전송 
	  return "../member/idcheck_result.jsp";
  }
  @RequestMapping("member/postfind.do")
  public String member_postfind(HttpServletRequest request,HttpServletResponse response)
  {
	  return "../member/postfind.jsp";
  }
  
  @RequestMapping("member/tel_check.do")
  public String member_tel_check(HttpServletRequest request,HttpServletResponse response)
  {
	  String phone=request.getParameter("phone");
	  MemberDAO dao=new MemberDAO();
	  int count=dao.memberPhoneCheck(phone);
	  request.setAttribute("count", count);
	  return "../member/tel_check.jsp";
  }
  
  @RequestMapping("member/join_ok.do")
  public String member_insert(HttpServletRequest request,HttpServletResponse response)
  {
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
	  dao.memberInsert(vo);
	  
	  return "redirect:../main/main.do";
  }
  @RequestMapping("member/login.do")
  public String member_login(HttpServletRequest request,HttpServletResponse response)
  {
	  return "../member/login.jsp";
  }
  @RequestMapping("member/loginok.do")
  public String member_loginok(HttpServletRequest request,HttpServletResponse response)
  {
	  //data:{"id":id,"pwd":pwd}
	  String id=request.getParameter("id");
	  String pwd=request.getParameter("pwd");
	  MemberDAO dao=new MemberDAO();
	  // 결과값 받기 
	  
	  MemberVO vo=dao.memberLogin(id, pwd);
	  if(vo.getMsg().equals("OK"))// 로그인되었다면 
	  {
		  //session에 저장 => 모든 jsp로 사용이 가능하게 만든다 (전역변수) => 지속적인 유지 => ID,Name,admin...
		  //session생성 
		  HttpSession session=request.getSession();
		  // session,cookie => request를 이용해서 생성한다 
		  session.setAttribute("id", vo.getId());
		  session.setAttribute("name", vo.getName());
		  session.setAttribute("admin", vo.getAdmin());
	  }
	  request.setAttribute("result", vo.getMsg());
	  
	  return "../member/loginok.jsp";
  }
  @RequestMapping("member/logout.do")
  public String member_logout(HttpServletRequest request,HttpServletResponse response)
  {
	  HttpSession session=request.getSession();
	  session.invalidate();// 모든 정보 해제 
	  return "redirect:../main/main.do";
  }
  @RequestMapping("member/email_check.do")
  public String member_email_check(HttpServletRequest request,HttpServletResponse response)
  {
	  String email=request.getParameter("email");
	  MemberDAO dao=new MemberDAO();
	  System.out.println(email);
	  int count=dao.memberEmailCheck(email);
	  System.out.println(count);
	  request.setAttribute("count", count);
	  return "../member/email_check.jsp";
  }
  @RequestMapping("member/nick_check.do")
  public String member_nick_check(HttpServletRequest request,HttpServletResponse response)
  {
	  String nick=request.getParameter("nick");
	  MemberDAO dao=new MemberDAO();
	  System.out.println(nick);
	  int count=dao.memberNickCheck(nick);
	  System.out.println(count);
	  request.setAttribute("count", count);
	  return "../member/email_check.jsp";
  }
  //아이디 찾기
  @RequestMapping("member/idfind.do")
  public String member_idFind(HttpServletRequest request,HttpServletResponse response)
  {
	  return "../member/idfind.jsp";
  }
  @RequestMapping("member/idfind_result.do")
  public String member_idFind_result(HttpServletRequest request,HttpServletResponse response)
  {
	  String name=request.getParameter("name");
	  String email=request.getParameter("email");
	  System.out.println(name);
	  System.out.println(email);
	  MemberDAO dao=new MemberDAO();
	  String idfind=dao.memberIdfind(name, email);
	  System.out.println("model :" + idfind);
	  request.setAttribute("idfind", idfind);//JSP로 값을 전송 
	  return "../member/idfind_result.jsp";
  }
  
  //비밀번호 찾기
  @RequestMapping("member/pwdfind.do")
  public String member_pwdFind(HttpServletRequest request,HttpServletResponse response)
  {
	  return "../member/pwdfind.jsp";
  }
  @RequestMapping("member/pwdfind_result.do")
  public String member_pwdFind_result(HttpServletRequest request,HttpServletResponse response)
  {
	  String id=request.getParameter("id");
	  String email=request.getParameter("email");
	  System.out.println("id :" +id);
	  System.out.println("email : " +email);
	  MemberDAO dao=new MemberDAO();
	  String pwdfind=dao.memberPwdfind(id, email);
	  System.out.println("리턴값 :" + pwdfind);
	  request.setAttribute("pwdfind", pwdfind);//JSP로 값을 전송 
	  return "../member/pwdfind_result.jsp";
  }

  
}









