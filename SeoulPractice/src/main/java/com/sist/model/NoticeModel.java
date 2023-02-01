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
		private String[] prefix= {"","일반공지","축제공지","맛집공지","여행공지","예약공지"};
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
		/*
		@RequestMapping("notice/insert.do")
		public String notice_insert(HttpServletRequest request, HttpServletResponse response)
		{
			// 중간에 들어가는 파일을 지정
			request.setAttribute("main_jsp", "../notice/insert.jsp"); // 화면 출력
			return "../main/main.jsp";
		}
		@RequestMapping("notice/insert_ok.do")
		public String notice_insert_ok(HttpServletRequest request, HttpServletResponse response)
		{
			
			try {
				request.setCharacterEncoding("UTF-8");
				String path="c:\\download"; // 업로드된 파일 저장 위치
				int size=1024*1024*100; // 업로드된 파일의 최대 크기 : 100MB
				String enctype="UTF-8"; // 한글 파일명
				MultipartRequest mr=new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy());
				// 사용자가 보내준 데이터를 받는다
				String name=mr.getParameter("name");
				String title=mr.getParameter("title");
				String content=mr.getParameter("content");
				// String pwd=mr.getParameter("pwd");
				String filename=mr.getFilesystemName("upload");			
				// FreeBoardVO에 묶어서 오라클 전송
				NoticeVO vo=new NoticeVO();
				vo.setName(name);
				vo.setTitle(title);
				vo.setContent(content);
				if(filename==null) // 업로드가 없는 상태
				{
					vo.setFilename("");
					vo.setFilesize(0);
				}
				else // 업로드가 된 상태
				{
					File file=new File(path+"\\"+filename);
					vo.setFilename(filename);
					vo.setFilesize((int)file.length()); // 실제 저장된 파일의 크기를 읽어온다
				}
				NoticeDAO dao=new NoticeDAO();
				dao.NoticeInsert(vo);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 화면 이동
			return "redirect:list.do"; // sendRedirect("../board/list.do")
			/*
			 * insert  => list.do
			 * update  => detail.do
			 * delete  => list.do
			
		} */
		@RequestMapping("notice/detail.do")
		public String notice_detail(HttpServletRequest request, HttpServletResponse response)
		{
			// 출력에 필요한 데이터 전송
			// 사용자 요청한 데이터를 받아서 처리 => 게시물 번호
			String bno=request.getParameter("nno"); // 상세보기 => 1개만 출력한다. => primary key
			// DAO로 전송 => 오라클에서 데이터 읽기
			NoticeDAO dao=new NoticeDAO();
			NoticeVO vo=dao.NoticeDetailData(Integer.parseInt(bno));
			request.setAttribute("vo", vo);
			request.setAttribute("main_jsp", "../notice/detail.jsp");
			return "../main/main.jsp";
		}
}
