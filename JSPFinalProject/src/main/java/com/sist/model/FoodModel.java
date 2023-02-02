package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;
// Model => 여기서 요청 처리 메소드를 찾는다
/*
 *   food/food_location.do => DispatcherServlet
 *                              => service() => @RequestMapping() => 밑에 있는 메소드를 호출한다
 *                                                                     method.invoke()
 *                                                                     Model에 존재   
 */
@Controller
public class FoodModel {
	@RequestMapping("food/food_location.do")
	public String food_location(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			// 한글 변환 코드
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String ss=request.getParameter("ss");
		if(ss==null)
			ss="역삼";
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		// 현재 페이지 지정
		int curpage=Integer.parseInt(page);
		// DAO에서 page에 해당되는 부분을 가져온다
		FoodDAO  dao=new FoodDAO();
		ArrayList<FoodVO> list=dao.foodLocationFindData(curpage, ss);
		int totalpage=dao.foodLocationTotalPage(ss);

		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("ss", ss);
		request.setAttribute("main_jsp", "../food/food_location.jsp");
		CommonsModel.footerData(request);
		return "../main/main.jsp";
	}
	@RequestMapping("food/food_list.do")
	public String food_list(HttpServletRequest request, HttpServletResponse response)
	{
		// ../food/food_list.do?cno=10
		// 1. 요청값을 받는다
		String cno=request.getParameter("cno");
		// 데이터베이스에서 값을 읽어 온다
		FoodDAO dao=new FoodDAO();
		// 결과값을 얻어서 -> request에 담아준다 ==> rd.forward(request,response)
		ArrayList<FoodVO> list=dao.foodListData(Integer.parseInt(cno));
		request.setAttribute("list", list);
		CategoryVO vo=dao.categoryInfoData(Integer.parseInt(cno));
		request.setAttribute("vo", vo);
		// include하는 파일 전송
		
		request.setAttribute("main_jsp", "../food/food_list.jsp");
		CommonsModel.footerData(request);
		return "../main/main.jsp";
	}
	@RequestMapping("food/food_before_detail.do")
	public String food_before_detail(HttpServletRequest request, HttpServletResponse response)
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
	@RequestMapping("food/food_detail.do")
	public String food_detail(HttpServletRequest request, HttpServletResponse response)
	{
		//../food/food_detail.do?fno=1
		String fno=request.getParameter("fno");
		// 데이터베이스 연결 
		FoodDAO dao=new FoodDAO();
		FoodVO vo=dao.foodDetail(Integer.parseInt(fno));
		String address=vo.getAddress();
		String addr1=address.substring(0,address.lastIndexOf("지"));
		addr1=address.trim();
		String addr2=address.substring(address.lastIndexOf("지")+3);
		request.setAttribute("vo", vo);
		request.setAttribute("addr1", addr1);
		request.setAttribute("addr2", addr2);
		
		request.setAttribute("vo", vo);
		// => 레시피, 재료, Goods, 인근 명소
		// 화면 출력
		
		request.setAttribute("main_jsp", "../food/food_detail.jsp");
		AllReplyDAO adao=new AllReplyDAO();
		List<AllReplyVO> rList=adao.allReplyListData(Integer.parseInt(fno), 2);
		request.setAttribute("rList", rList);
		request.setAttribute("count", rList.size());
		CommonsModel.footerData(request);
		
		String type=vo.getType();
		int index=type.indexOf('/');
		if(index>-1)
		{
			type=type.replace('/', '|');
		}
		List<RecipeVO> nList=dao.food_recipe_data(type);
		request.setAttribute("nList1", nList); // commonsModel에 있는 nList와 겹치므로 이름을 다르게
		CommonsModel.footerData(request);
		return "../main/main.jsp";
	}
}
















