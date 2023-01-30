package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class MainModel {
	// 모든 .do에서 실행
	
	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request, HttpServletResponse response)
	{
		/*HttpSession session=request.getSession();  -- 세션
		session.setAttribute("id", "hong");
		session.setAttribute("admin", "y");*/
		FoodDAO dao=new FoodDAO();
		ArrayList<CategoryVO> list=dao.foodCategoryData();
		request.setAttribute("list", list); // home.jsp
		
		CommonsModel.footerData(request); // Spring =>AOP (인터셉트)
		// include할 파일명을 전송
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
