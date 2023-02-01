package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;

public class SearchDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//---------- 검색 관련 여행지 ----------
	//검색결과페이지 - 여행지리스트
	public List<TripVO> searchTripAllListData(String searchWord, int page)
	{
		List<TripVO> list=new ArrayList<TripVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT tno,name,image,hit,num "
					  +"FROM (SELECT /*+ INDEX_ASC(gg_trip_4 t_tno_pk_4)*/ tno,name,image,hit,rownum as num "
					  +"FROM gg_trip_4 "
					  +"WHERE REGEXP_LIKE(name,?) "
					  +"OR REGEXP_LIKE(addr,?)) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=5;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setString(1, searchWord);
			ps.setString(2, searchWord);
			ps.setInt(3, start);
			ps.setInt(4, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
			TripVO vo=new TripVO();
			vo.setTno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setImage(rs.getString(3));
			list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
			finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
			
	//검색결과페이지 - 여행지리스트 총페이지
	public int searchTripTotalPage(String searchWord)
	{
		int totalpage=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT CEIL(count(*)/5.0) "
					  +"FROM (SELECT /*+ INDEX_ASC(gg_trip_4 t_tno_pk_4)*/ tno,name,image,hit,rownum as num "
					  +"FROM gg_trip_4 "
					  +"WHERE REGEXP_LIKE(name,?) "
					  +"OR REGEXP_LIKE(addr,?)) ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, searchWord);
			ps.setString(2, searchWord);
			ResultSet rs=ps.executeQuery();
			rs.next();
			totalpage=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return totalpage;
	}
	//검색결과페이지 - 여행지 총 개수
	public int searchTripCount(String searchWord)
	{
		int tripCount=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT count(*) "
					  +"FROM gg_trip_4 "
					  +"WHERE REGEXP_LIKE(name,?) "
					  +"OR REGEXP_LIKE(addr,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, searchWord);
			ps.setString(2, searchWord);
			ResultSet rs=ps.executeQuery();
			rs.next();
			tripCount=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return tripCount;
	}

	
	//---------- 검색 관련 맛집 ----------
	//검색결과페이지 - 맛집리스트
	public List<FoodVO> searchFoodAllListData(String searchWord,int page)
	{
		List<FoodVO> list=new ArrayList<FoodVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT fno,name,poster,num "
					  +"FROM (SELECT /*+ INDEX_ASC(gg_fooddetail_4 fd_fno_pk_4)*/ fno,name,poster,rownum as num "
					  +"FROM gg_fooddetail_4 "
					  +"WHERE regexp_like(name,?) "
					  +"OR regexp_like(addr,?)) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=5;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setString(1, searchWord);
			ps.setString(2, searchWord);
			ps.setInt(3, start);
			ps.setInt(4, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFcno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
	//검색결과페이지 - 맛집총페이지
	public int searchFoodTotalPage(String searchWord)
	{
		int totalpage=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT CEIL(count(*)/5.0) "
					  +"FROM gg_fooddetail_4 "
					  +"WHERE REGEXP_LIKE(name,?) "
					  +"OR REGEXP_LIKE(addr,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, searchWord);
			ps.setString(2, searchWord);
			ResultSet rs=ps.executeQuery();
			rs.next();
			totalpage=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return totalpage;
	}
	//검색결과페이지 - 맛집 총 개수
	public int searchFoodCount(String searchWord)
	{
		int foodCount=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT count(*) FROM gg_fooddetail_4 "
					   +"WHERE regexp_LIKE(name,?) "
					   +"OR regexp_LIKE(addr,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, searchWord);
			ps.setString(2, searchWord);
			ResultSet rs=ps.executeQuery();
			rs.next();
			foodCount=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return foodCount; 
	}
	//---------- 검색 관련 커뮤니티 ----------
	
}