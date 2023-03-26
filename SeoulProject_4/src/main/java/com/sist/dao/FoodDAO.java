package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	// 카테고리 데이터
	public ArrayList<FoodCategoryVO> mainpageFoodListData()
	{
		ArrayList<FoodCategoryVO> list=new ArrayList<FoodCategoryVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT "
					  +"fcno,title,subtitle,image "
					  +"FROM gg_foodCategory_4 "
					  +"ORDER BY fcno";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodCategoryVO vo=new FoodCategoryVO();
				vo.setFcno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSubtitle(rs.getString(3));
				vo.setImage(rs.getString(4));
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
	
	// ㅅ테스트 2
	public ArrayList<FoodCategoryVO> mainpageFoodListData2()
	{
		ArrayList<FoodCategoryVO> list=new ArrayList<FoodCategoryVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT "
					  +"fcno,title,subtitle,image "
					  +"FROM gg_foodCate_4 "
					  +"ORDER BY fcno";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodCategoryVO vo=new FoodCategoryVO();
				vo.setFcno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSubtitle(rs.getString(3));
				vo.setImage(rs.getString(4));
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
	// 검색 
	public ArrayList<FoodVO> foodLocationFindData(int page, String ss)
	{
		ArrayList<FoodVO> list=new ArrayList<FoodVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT fno,name,poster,score,hit,num "
					+"FROM (SELECT fno,name,poster,score,hit,rownum as num "
					+"FROM (SELECT fno,name,poster,score,hit "
					+"FROM gg_locationFood_4 "
				    +"WHERE addr LIKE '%'||?||'%')) "
				    +"WHERE num BETWEEN ? AND ?";
			
			
			ps=conn.prepareStatement(sql);
			int rowSize=9;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setString(1, ss);
			ps.setInt(2, start);
			ps.setInt(3, end);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				String poster=rs.getString(3);
				poster=poster.substring(0,poster.indexOf("^"));
				poster=poster.replace("#", "&");
				vo.setPoster(poster);
				vo.setScore(rs.getDouble(4));
				vo.setHit(rs.getInt(5));
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
	
	public int foodLocationTotalPage(String ss)
	{
		int totalpage=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT CEIL(COUNT(*)/20.0) FROM gg_locationFood_4 "
					+"WHERE addr LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			
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
	// 목록
//	public ArrayList<FoodVO> foodListData(int fcno)
//	{
//		
//		ArrayList<FoodVO> list=new ArrayList<FoodVO>();
//		try
//		{
//			conn=CreateConnection.getConnection();
//			String sql="SELECT /*+ INDEX_DESC(gg_foodDetail_4 lf_no_pk_4)*/fno,name,addr,tel,type,poster,hit "
//					  +"FROM gg_foodDetail_4 "
//					  +"WHERE fcno=?";
//			ps=conn.prepareStatement(sql);
//			ps.setInt(1, fcno);
//			ResultSet rs=ps.executeQuery();
//			while(rs.next())
//			{
//				FoodVO vo=new FoodVO();
//				vo.setFno(rs.getInt(1));
//				vo.setName(rs.getString(2));
//				String addr=rs.getString(3);
//				addr=addr.substring(0,addr.lastIndexOf("지"));
//				vo.setAddr(addr.trim());
//				vo.setTel(rs.getString(4));
//				vo.setType(rs.getString(5));
//				String poster=rs.getString(6);
//				poster=poster.substring(0,poster.indexOf("^"));
//				vo.setPoster(poster);
//				vo.setHit(rs.getInt(7));
//				list.add(vo);
//				
//			}
//			rs.close();
//		}catch(Exception ex)
//		{
//			ex.printStackTrace();
//		}
//		finally
//		{
//			CreateConnection.disConnection(conn, ps);
//		}
//		return list;
//	}
	
	// test 리스트 데이터 2
	public ArrayList<FoodVO> foodListData2(int fcno)
	{
		
		ArrayList<FoodVO> list=new ArrayList<FoodVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT /*+ INDEX_DESC(gg_locationFood_4 lf_no_pk_4)*/fcno,fno,name,addr,tel,type,poster,hit "
					  +"FROM gg_locationFood_4 "
					  +"WHERE fcno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fcno);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFcno(rs.getInt(1));
				vo.setFno(rs.getInt(2));
				vo.setName(rs.getString(3));
				String addr=rs.getString(4);
				addr=addr.substring(0,addr.lastIndexOf("지"));
				vo.setAddr(addr.trim());
				vo.setTel(rs.getString(5));
				vo.setType(rs.getString(6));
				String poster=rs.getString(7);
				poster=poster.substring(0,poster.indexOf("^"));
				vo.setPoster(poster);
				vo.setHit(rs.getInt(8));
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
	
	// 카테고리 정보
//	public FoodCategoryVO categoryInfoData(int fcno)
//	{
//		FoodCategoryVO vo=new FoodCategoryVO();
//		try
//		{
//			conn=CreateConnection.getConnection();
//			String sql="SELECT title,subtitle FROM gg_foodCategory_4 "
//					  +"WHERE fcno=?";
//			ps=conn.prepareStatement(sql);
//			ps.setInt(1, fcno);
//			ResultSet rs=ps.executeQuery();
//			rs.next();
//			vo.setTitle(rs.getString(1));
//			vo.setSubtitle(rs.getString(2));
//			rs.close();
//		}catch(Exception ex)
//		{
//			ex.printStackTrace();
//		}
//		finally
//		{
//			CreateConnection.disConnection(conn, ps);
//		}
//		return vo;
//	}
	
	
	// test 2 카테고리 데이터
	public FoodCategoryVO categoryInfoData2(int fcno)
	{
		FoodCategoryVO vo=new FoodCategoryVO();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT title,subtitle FROM gg_foodCate_4 "
					  +"WHERE fcno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fcno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setTitle(rs.getString(1));
			vo.setSubtitle(rs.getString(2));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
	
	// 맛집 상세보기 출력 
//	public FoodVO foodDetail(int fno)
//	{
//		FoodVO vo=new FoodVO();
//		try
//		{
//			conn=CreateConnection.getConnection();
//			String sql="UPDATE gg_foodDetail_4 SET "
//					  +"hit=hit+1 "
//					  +"WHERE fno=?";
//			ps=conn.prepareStatement(sql);
//			ps.setInt(1, fno);
//			ps.executeUpdate();
//			
//			sql="SELECT fno,name,tel,score,poster,addr,type,time,parking,menu,price,good,soso,bad,hit "
//			   +"FROM gg_foodDetail_4 "
//			   +"WHERE fno=?";
//			ps=conn.prepareStatement(sql);
//			ps.setInt(1, fno);
//			ResultSet rs=ps.executeQuery();
//			rs.next();
//			vo.setFno(rs.getInt(1));
//			vo.setName(rs.getString(2));
//			vo.setTel(rs.getString(3));
//			vo.setScore(rs.getDouble(4));
//			vo.setPoster(rs.getString(5));
//			vo.setAddr(rs.getString(6));
//			vo.setType(rs.getString(7));
//			vo.setTime(rs.getString(8));
//			vo.setParking(rs.getString(9));
//			vo.setMenu(rs.getString(10));
//			vo.setPrice(rs.getString(11));
//			vo.setGood(rs.getInt(12));
//			vo.setSoso(rs.getInt(13));
//			vo.setBad(rs.getInt(14));
//			vo.setHit(rs.getInt(15));
//			rs.close();
//			
//		}catch(Exception ex)
//		{
//			ex.printStackTrace();
//		}
//		finally
//		{
//			CreateConnection.disConnection(conn, ps);
//		}
//		return vo;
//		
//	}
	
	
	// 검색용 디테일
	
	public FoodVO foodFindDetail(int fno)
	{
		FoodVO vo=new FoodVO();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="UPDATE gg_locationFood_4 SET "
					  +"hit=hit+1 "
					  +"WHERE fno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fno);
			ps.executeUpdate();
			
			sql="SELECT fno,name,tel,score,poster,addr,type,time,parking,menu,price,good,soso,bad,hit "
			   +"FROM gg_locationFood_4 "
			   +"WHERE fno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setFno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setTel(rs.getString(3));
			vo.setScore(rs.getDouble(4));
			vo.setPoster(rs.getString(5));
			vo.setAddr(rs.getString(6));
			vo.setType(rs.getString(7));
			vo.setTime(rs.getString(8));
			vo.setParking(rs.getString(9));
			vo.setMenu(rs.getString(10));
			vo.setPrice(rs.getString(11));
			vo.setGood(rs.getInt(12));
			vo.setSoso(rs.getInt(13));
			vo.setBad(rs.getInt(14));
			vo.setHit(rs.getInt(15));
			rs.close();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
		
	}
	
	// 댓글 목록 출력 
	public List<AllReplyVO> foodRecentReply(int cate_no,int no)
	   {
	      List<AllReplyVO> list=new ArrayList<AllReplyVO>();
	      try
	      {
	         conn=CreateConnection.getConnection();
	         String sql="SELECT id,name,TO_CHAR(regdate,'YYYY-MM-DD'),msg,rownum "
	         		   +"FROM gg_allreply_4 "
	        		   +"WHERE cate_no=? AND no=? AND rownum<=2 "
	         		   +"ORDER BY regdate DESC";
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, cate_no);
	         ps.setInt(2, no);
	         ResultSet rs=ps.executeQuery();
	         while(rs.next())
	         {
	        	 AllReplyVO vo=new AllReplyVO();
	        	 vo.setId(rs.getString(1));
	        	 vo.setName(rs.getString(2));
	        	 vo.setDbday(rs.getString(3));
	        	 vo.setMsg(rs.getString(4));
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
}
