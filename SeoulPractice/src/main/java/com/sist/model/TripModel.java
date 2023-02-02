//여행지, 축제 Model

package com.sist.model;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
public class TripModel {
	
	
	@RequestMapping("trip/trip_all.do") //전체여행지 페이지
	public String trip_all(HttpServletRequest request,HttpServletResponse response)
	{
		
		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		String tcno=request.getParameter("tcno");
		request.setAttribute("tcno",tcno);
		
		String[] tripCategory_name={"","명소","자연","즐길거리","쇼핑"};
		request.setAttribute("tripCategory_name", tripCategory_name[Integer.parseInt(tcno)]);
		
		String[] content_title={"서울 구석구석 모든 여행지","서울 인기명소부터 숨은 명소까지",
								"서울 도심 속 자연을 느낄 수 있는 곳","서울의 다양한 즐길거리","서울 쇼핑의 시작과 끝"};
		request.setAttribute("content_title", content_title[Integer.parseInt(tcno)]);
		
		TripDAO dao=new TripDAO();
		List<TripVO> list=dao.tripAllListData(Integer.parseInt(tcno),curpage);
		int totalpage=dao.tripTotalPage(Integer.parseInt(tcno));
		
		final int BLOCK=7;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage)
			endpage=totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("main_jsp","../trip/trip_all.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("trip/trip_detail.do") //여행지 상세페이지
	public String trip_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String tno=request.getParameter("tno");
		request.setAttribute("tno", tno);
		
		TripDAO dao=new TripDAO();
		TripVO vo=dao.tripDetail(Integer.parseInt(tno));
		
		request.setAttribute("main_jsp", "../trip/trip_detail.jsp");
		AllReplyDAO adao=new AllReplyDAO();
		List<AllReplyVO> rList=adao.allReplyListData(Integer.parseInt(tno), 1);
		request.setAttribute("rList", rList);
		request.setAttribute("count", rList.size());
		
		//주소에서 지역구만 자르기
		String gu=vo.getAddr();
		String[] addrSplit=gu.split(" ");
		gu=addrSplit[1];
		
		request.setAttribute("vo", vo);
		request.setAttribute("gu", gu);
		
		request.setAttribute("main_jsp", "../trip/trip_detail.jsp");
		return "../main/main.jsp";
	}


}
