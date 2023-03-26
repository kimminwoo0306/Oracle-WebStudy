package com.sist.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sist.vo.AllLikeVO;

public class LikeDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//여행지 좋아요 insert (cate_no 1번 여행지)
	public void tripLikeInsert(AllLikeVO vo)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO gg_allLike_4 VALUES("
					+"(SELECT NVL(MAX(alno)+1,1) FROM gg_allLike_4),1,?,?)";
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
	//맛집 좋아요 insert (cate_no 2번 맛집)
	public void foodLikeInsert(AllLikeVO vo)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO gg_allLike_4 VALUES("
					+"(SELECT NVL(MAX(alno)+1,1) FROM gg_allLike_4),2,?,?)";
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
	
	// 여행지/맛집 1개당 나의 좋아요 개수
	public int myLikeCount(int cate_no, int no, String id)
	{
		int count=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT COUNT(*) FROM gg_allLike_4 "
					+"WHERE cate_no=? AND no=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cate_no); //cate_no 1번 여행지, 2번 맛집
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

	//여행지/맛집 1개에 대한 전체 좋아요 개수
	public int allLikeCount(int cate_no,int no)
	{
	      int count=0;
	      try
	      {
	         conn=CreateConnection.getConnection();
	         String sql="SELECT COUNT(*) FROM gg_allLike_4 "
	               +"WHERE cate_no=? AND no=?";
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, cate_no); // cate_no 1번 여행지, 2번 맛집
	         ps.setInt(2, no);
	         ResultSet rs=ps.executeQuery();
	         rs.next();
	         count=rs.getInt(1);
	         rs.close();
	      }catch (Exception ex) {
	         ex.printStackTrace();
	      } 
	      finally
	      {
	         CreateConnection.disConnection(conn, ps);
	      }
	      return count;
	}
	
	//여행지상세페이지 - 좋아요 취소
	public void tripLikeDelete(int cate_no,int no,String id)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="DELETE FROM gg_alllike_4 "
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
	
	//맛집상세페이지 - 좋아요 취소
		public void foodLikeDelete(int cate_no,int no,String id)
		{
			try
			{
				conn=CreateConnection.getConnection();
				String sql="DELETE FROM gg_alllike_4 "
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
