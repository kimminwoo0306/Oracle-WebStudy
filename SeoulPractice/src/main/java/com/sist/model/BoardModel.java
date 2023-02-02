package com.sist.model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class BoardModel {
	@RequestMapping("board/list.do")
	 public String board(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
	      if (page == null) {
	         page = "1";
	      }
	      int curpage = Integer.parseInt(page);
	BoardDAO dao=new BoardDAO();
	ArrayList<BoardVO> list=dao.boardListData(curpage);
	int totalpage = dao.boardTotalPage();
    
    final int BLOCK = 10;
    int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
    int endPage = ((curpage-1)/BLOCK * BLOCK) + BLOCK;
    if (endPage > totalpage)
        endPage = totalpage;
    
    request.setAttribute("list", list);
    request.setAttribute("curpage", curpage);
    request.setAttribute("totalpage", totalpage);
    request.setAttribute("startPage", startPage);
    request.setAttribute("endPage", endPage);
    request.setAttribute("main_jsp", "../board/list.jsp"); // main.jsp에서 include되는 파일 지정
    return "../main/main.jsp";
	}
	@RequestMapping("board/insert.do")
	public String board_insert(HttpServletRequest request, HttpServletResponse response)
	{
		// 중간에 들어가는 파일을 지정
		request.setAttribute("main_jsp", "../board/insert.jsp"); // 화면 출력
		return "../main/main.jsp";
	}
	@RequestMapping("board/insert_ok.do")
	public String board_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		
		try {
			request.setCharacterEncoding("UTF-8");
			String path="C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SeoulPractice\\upload"; // 업로드된 파일 저장 위치
			int size=1024*1024*100; // 업로드된 파일의 최대 크기 : 100MB
			String enctype="UTF-8"; // 한글 파일명
			MultipartRequest mr=new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy());
			// 사용자가 보내준 데이터를 받는다
			String name=mr.getParameter("name");
			String title=mr.getParameter("title");
			String content=mr.getParameter("content");
			String pwd=mr.getParameter("pwd");
			String filename=mr.getFilesystemName("upload");			
			// BoardVO에 묶어서 오라클 전송
			BoardVO vo=new BoardVO();
			vo.setName(name);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setPwd(pwd);
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
			BoardDAO dao=new BoardDAO();
			dao.boardInsert(vo);
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
		 */
	}
	@RequestMapping("board/detail.do")
	public String board_detail(HttpServletRequest request, HttpServletResponse response)
	{
		// 출력에 필요한 데이터 전송
		// 사용자 요청한 데이터를 받아서 처리 => 게시물 번호
		String bno=request.getParameter("bno"); // 상세보기 => 1개만 출력한다. => primary key
		// DAO로 전송 => 오라클에서 데이터 읽기
		BoardDAO dao=new BoardDAO();
		BoardVO vo=dao.boardDetailData(Integer.parseInt(bno));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../board/detail.jsp");
		
		List<BoardReplyVO> list=dao.replyListData(Integer.parseInt(bno));
		request.setAttribute("list", list);
		request.setAttribute("count", list.size());
		
		return "../main/main.jsp";
	}
	@RequestMapping("board/delete.do")
	public String board_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String bno=request.getParameter("bno");
		String pwd=request.getParameter("pwd");
		BoardDAO dao=new BoardDAO();
		BoardVO vo=dao.boardInfoData(Integer.parseInt(bno));
		boolean bCheck=dao.boardDelete(Integer.parseInt(bno),pwd);
		
		if(bCheck==true)
		{
			request.setAttribute("msg", "yes");
			if(vo.getFilesize()>0) // 파일 존재하면 파일 삭제
			{
				try
				{
					File file=new File("c:\\download\\"+vo.getFilename());
					file.delete();
				}catch(Exception ex) {}
			}
			else
			{
				
			}
		}
		else
		{
			request.setAttribute("msg", "no");
		}
		return "../board/update_ok.jsp"; // delete파일 대신 ${msg}잇는 파일에 적용
	}

	/*
	 * @RequestMapping("board/delete_ok.do") public String
	 * board_delete_ok(HttpServletRequest request, HttpServletResponse response) {
	 * String bno=request.getParameter("bno"); String
	 * pwd=request.getParameter("pwd");
	 * 
	 * BoardDAO dao=new BoardDAO(); BoardVO
	 * vo=dao.boardInfoData(Integer.parseInt(bno)); boolean
	 * bCheck=dao.boardDelete(Integer.parseInt(bno), pwd); if(bCheck==true) { // 파일
	 * 삭제 if(vo.getFilesize()>0) // 파일 존재하면 파일 삭제 { try { File file=new
	 * File("c:\\download\\"+vo.getFilename()); file.delete(); }catch(Exception ex)
	 * {} } else {
	 * 
	 * } } return "redirect:list.do"; }
	 */
	@RequestMapping("board/update.do")
	public String board_update(HttpServletRequest request, HttpServletResponse response)
	   {
		   String bno=request.getParameter("bno");
		   BoardDAO dao=new BoardDAO();
		   BoardVO vo=dao.boardUpdateData(Integer.parseInt(bno));
		   
		   request.setAttribute("vo", vo);
		   request.setAttribute("main_jsp", "../board/update.jsp"); // 화면 출력
		   return "../main/main.jsp";
	   }
	@RequestMapping("board/update_ok.do")
	public String board_update_ok(HttpServletRequest request, HttpServletResponse response)
	   {
		   try
		   {
			   // 한글 변환
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   String name=request.getParameter("name");
		   String title=request.getParameter("title");
		   String content=request.getParameter("content");
		   String pwd=request.getParameter("pwd");
		   String bno=request.getParameter("bno");
		   String moddate=request.getParameter(bno);
		   BoardVO vo=new BoardVO();
		   vo.setName(name);
		   vo.setTitle(title);
		   vo.setContent(content);
		   vo.setPwd(pwd);
		   vo.setBno(Integer.parseInt(bno));
		   BoardDAO dao=new BoardDAO();
		   boolean bCheck=dao.boardUpdate(vo);
		   String msg="";
		   if(bCheck==true)
			   request.setAttribute("msg", "yes");
		   else
			   request.setAttribute("msg", "no");

		return "../board/update_ok.jsp";
	   }
	@RequestMapping("board/reply_insert.do")
	public String board_reply_insert(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String bno=request.getParameter("bno");
		String msg=request.getParameter("msg");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		BoardReplyVO vo=new BoardReplyVO();
		vo.setBno(Integer.parseInt(bno));
		vo.setMsg(msg);
		vo.setId(id);
		vo.setName(name);
		BoardDAO dao=new BoardDAO();
		dao.replyInsert(vo);
		return "redirect:detail.do?bno="+bno;
	}
	@RequestMapping("board/reply_update.do")
	public String reply_update(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String bno=request.getParameter("bno");
		String rno=request.getParameter("rno");
		String msg=request.getParameter("msg");
		//DAO 연결
		BoardDAO dao=new BoardDAO();
		dao.replyUpdate(Integer.parseInt(rno), msg);
		return "redirect:detail.do?bno="+bno;
	}
	@RequestMapping("board/reply_reply_insert.do")
	public String reply_reply_insert(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String bno=request.getParameter("bno");
		String pno=request.getParameter("pno"); // 댓글번호 => 상위번호
		String msg=request.getParameter("msg");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		
		BoardReplyVO vo=new BoardReplyVO();
		vo.setBno(Integer.parseInt(bno));
		vo.setId(id);
		vo.setName(name);
		vo.setMsg(msg);
		BoardDAO dao=new BoardDAO();
		// 답변 => 메소드 호출
		dao.replyReplyInsert(Integer.parseInt(pno), vo);
		return "redirect:detail.do?bno="+bno;
	}
	@RequestMapping("board/reply_delete.do")
	public String reply_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String rno=request.getParameter("rno");
		String bno=request.getParameter("bno");
		BoardDAO dao=new BoardDAO();
		// 삭제처리
		dao.replyDelete(Integer.parseInt(rno));
		return "redirect:detail.do?bno="+bno;
	}
}