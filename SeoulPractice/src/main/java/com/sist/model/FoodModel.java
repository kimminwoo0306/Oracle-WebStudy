package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	@RequestMapping("food/food_location.do")
	public String food_location(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String ss=request.getParameter("ss");
		if(ss==null)
			ss="마포";
		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		// 현재페이지
		int curpage=Integer.parseInt(page);
		// dao에서 데이터 읽기
		FoodDAO dao=new FoodDAO();
		ArrayList<FoodVO> list=dao.foodLocationFindData(curpage, ss);
		int totalpage=dao.foodLocationTotalPage(ss);
		
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("ss", ss);
		request.setAttribute("main_jsp", "../food/food_location.jsp");
		return "../main/main.jsp";
				
	}
	@RequestMapping("food/food_list.do")
	public String food_list(HttpServletRequest request, HttpServletResponse response)
	{
		// ../food/food_list.do?fcno=10
		// 1. 요청값 받기
		String fcno=request.getParameter("fcno");
		// 데이터베이스에서 값 읽어오기
		FoodDAO dao=new FoodDAO();
		// 결과값을 얻어서 request에 담아주기 >> 
		ArrayList<FoodVO> list=dao.foodListData(Integer.parseInt(fcno));
		request.setAttribute("list", list);
		FoodCategoryVO vo=dao.categoryInfoData(Integer.parseInt(fcno));
		request.setAttribute("vo", vo);
		
		request.setAttribute("main_jsp", "../food/food_list.jsp");
		return "../main/main_jsp";
				
	}
	@RequestMapping("food/food_detail.do")
	public String food_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String fno=request.getParameter("fno");
		FoodDAO dao=new FoodDAO();
		FoodVO vo=dao.foodDetail(Integer.parseInt(fno));
		String addr=vo.getAddr();
		String addr1=addr.substring(0, addr.lastIndexOf("지"));
		addr1=addr1.trim();
		String addr2=addr.substring(addr.lastIndexOf("지")+3);
		request.setAttribute("vo",vo);
		request.setAttribute("addr1", addr1);
		request.setAttribute("addr2", addr2);
		
		request.setAttribute("main_jsp", "../food/food_detail.jsp");
		return "../main/main_jsp";
	}
	
}
