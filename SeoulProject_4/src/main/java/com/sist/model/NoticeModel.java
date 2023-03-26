package com.sist.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;

	@Controller
	public class NoticeModel {
		private String[] prefix= {"","일반공지","이벤트공지","맛집공지","여행공지","예약공지"};
		@RequestMapping("notice/list.do")
		 public String notice(HttpServletRequest request, HttpServletResponse response) {
			String page = request.getParameter("page");
		      if (page == null) {
		         page = "1";
		      }
		      int curpage = Integer.parseInt(page);
		NoticeDAO dao=new NoticeDAO();
		List<NoticeVO> list=dao.noticeListData(curpage);
		int totalpage = dao.NoticeTotalPage();
	    
	    final int BLOCK = 10;
	    int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
	    int endPage = ((curpage-1)/BLOCK * BLOCK) + BLOCK;
	    if (endPage > totalpage)
	        endPage = totalpage;
	    if (totalpage==0)
	    	totalpage = totalpage+1;
	    
	    for(NoticeVO vo:list)
		{
			vo.setPrefix("["+prefix[vo.getType()]+"]");
		}
	    
	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
	    request.setAttribute("main_jsp", "../notice/list.jsp"); // main.jsp에서 include되는 파일 지정
	    return "../main/main.jsp";
		}

		@RequestMapping("notice/detail.do")
		public String notice_detail(HttpServletRequest request, HttpServletResponse response)
		{
			String bno=request.getParameter("nno"); // 상세보기 => 1개만 출력한다. => primary key
			NoticeDAO dao=new NoticeDAO();
			NoticeVO vo=dao.NoticeDetailData(Integer.parseInt(bno));
			request.setAttribute("vo", vo);
			request.setAttribute("main_jsp", "../notice/detail.jsp");
			return "../main/main.jsp";//
		}
		@RequestMapping("notice/ad_detail.do")
		   public String ad_notice_detail(HttpServletRequest request,HttpServletResponse response)
		   {
			   String nno=request.getParameter("nno");
			   NoticeDAO dao=new NoticeDAO();
			   NoticeVO vo=dao.noticeDetailData(Integer.parseInt(nno));
			   vo.setPrefix(prefix[vo.getType()]);
			   request.setAttribute("vo", vo);
			   request.setAttribute("main_jsp", "../notice/ad_detail.jsp");
			   
			   return "../main/main.jsp";
		   }
}
