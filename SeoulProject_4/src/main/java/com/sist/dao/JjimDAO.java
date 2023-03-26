package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.*;
import com.sist.vo.AllJjimVO;

public class JjimDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//여행지 찜 insert (cate_no 1번 여행지)
	public void tripJjimInsert(AllJjimVO vo)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO gg_allJjim_4 VALUES("
					+"(SELECT NVL(MAX(ajno)+1,1) FROM gg_allJjim_4),1,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ps.setString(2, vo.getId());
			ps.executeUpdate();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		
	}
	//맛집 찜 insert (cate_no 2번 맛집)
	public void foodJjimInsert(AllJjimVO vo)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO gg_allJjim_4 VALUES("
					+"(SELECT NVL(MAX(ajno)+1,1) FROM gg_allJjim_4),2,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ps.setString(2, vo.getId());
			ps.executeUpdate();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		
	}
	// 여행지/맛집 1개에 대한 나의 찜개수
	public int myJjimCount(int cate_no,int no,String id)
	{
		int count=0;
		try 
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT COUNT(*) FROM gg_allJjim_4 "
					+"WHERE cate_no=? AND no=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cate_no);
			ps.setInt(2, no);
			ps.setString(3, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
					
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return count;
		
	}
	//마이페이지 - 맛집 찜 목록
	public List<AllJjimVO> foodJjimListData(String id)
	{
		List<AllJjimVO> list=new ArrayList<AllJjimVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT ajno,no,"
					+ "(SELECT DISTINCT name FROM gg_locationFood_4 WHERE fno=gg_allJjim_4.no),"
					+ "(SELECT DISTINCT poster FROM gg_locationFood_4 WHERE fno=gg_allJjim_4.no),"
					+ "(SELECT DISTINCT addr FROM gg_locationFood_4 WHERE fno=gg_allJjim_4.no),"
					+ "(SELECT DISTINCT tel FROM gg_locationFood_4 WHERE fno=gg_allJjim_4.no) FROM gg_allJjim_4 WHERE id=? and cate_no=2";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				AllJjimVO vo=new AllJjimVO();
				vo.setAjno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setName(rs.getString(3));
				String poster=rs.getString(4);
				poster=poster.substring(0,poster.indexOf("^"));
				poster=poster.replace("#", "&");
				vo.setPoster(poster);
				vo.setAddr(rs.getString(5));
				vo.setTel(rs.getString(6));
				list.add(vo);
			}
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
	//마이페이지 - 여행지 찜 목록
	public List<AllJjimVO> tripJjimListData(String id)
	{
		List<AllJjimVO> list=new ArrayList<AllJjimVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT /*+ INDEX_DESC(gg_allJjim_4 jj_jno_pk_4*/ ajno,no, "
					+"(SELECT DISTINCT name FROM gg_trip_4 WHERE tno=gg_allJjim_4.no), "
					+"(SELECT DISTINCT image FROM gg_trip_4 WHERE tno=gg_allJjim_4.no), "
					+"(SELECT DISTINCT addr FROM gg_trip_4 WHERE tno=gg_allJjim_4.no) "
					+"FROM gg_allJjim_4 "
					+"WHERE id=? and cate_no=1";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				AllJjimVO vo=new AllJjimVO();
				vo.setAjno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setPoster(rs.getString(4));
				vo.setAddr(rs.getString(5));
				list.add(vo);
			}
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
	//마이페이지 찜 취소
	public void jjimDelete(int ajno)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="DELETE FROM gg_allJjim_4 "
					+"WHERE ajno=?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1, ajno);
			ps.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}	
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		
	}
	//여행지상세페이지 - 찜 취소
	public void tripJjimDelete(int cate_no,int no,String id)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="DELETE FROM gg_allJjim_4 "
					+"WHERE cate_no=1 AND no=? AND id=? ";  //cate_no 1번 여행지
			
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1, no);
			ps.setString(2, id);
			ps.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}	
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}	
	}
	
	// 맛집상세페이지 - 찜 취소
	public void foodJjimDelete(int cate_no,int no,String id)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="DELETE FROM gg_allJjim_4 "
					+"WHERE cate_no=2 AND no=? AND id=? ";  //cate_no 2번 맛집
			
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1, no);
			ps.setString(2, id);
			ps.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}	
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}	
	}
}
