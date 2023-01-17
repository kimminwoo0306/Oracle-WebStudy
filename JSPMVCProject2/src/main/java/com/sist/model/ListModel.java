package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
public class ListModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		ArrayList<String> list=new ArrayList<String>();
		list.add("홍길동");
		list.add("손흥민");
		list.add("김민우");
		list.add("김남훈");
		list.add("박지성");
		request.setAttribute("list", list);
		return "view/list.jsp";
	}

}
