package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;
public class DeptModel {
	public void deptListdata(HttpServletRequest request)
	{
		DeptDAO dao=new DeptDAO();
		ArrayList<DeptVO> list=dao.deptListData();
		request.setAttribute("list", list);
	}
}
