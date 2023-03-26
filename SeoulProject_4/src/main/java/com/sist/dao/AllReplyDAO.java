package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class AllReplyDAO {

  private Connection conn;
  private PreparedStatement ps;

  //댓글리뷰 등록
  public void allReplyInsert(AllReplyVO vo)
  {
	  try
	  {
		  conn=CreateConnection.getConnection();
		  String sql="INSERT INTO gg_allreply_4 VALUES(gar_arno_seq_4.nextval,?,?,?,?,?,SYSDATE)";
		  ps=conn.prepareStatement(sql);
		  ps.setInt(1, vo.getCate_no());
		  ps.setInt(2, vo.getNo());
		  ps.setString(3, vo.getId());
		  ps.setString(4, vo.getName());
		  ps.setString(5, vo.getMsg());
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
  
  //댓글 목록
  public List<AllReplyVO> allReplyListData(int no,int cate_no)
  {

	  List<AllReplyVO> list=new ArrayList<AllReplyVO>();
	  try
	  {
		  conn=CreateConnection.getConnection();
		  String sql="SELECT arno,cate_no,no,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') "
				    +"FROM gg_allreply_4 "
				    +"WHERE no=? AND cate_no=? "
				    +"ORDER BY arno DESC";
		  ps=conn.prepareStatement(sql);
		  ps.setInt(1, no);
		  ps.setInt(2, cate_no);
		  
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  AllReplyVO vo=new AllReplyVO();
			  vo.setArno(rs.getInt(1));
			  vo.setCate_no(rs.getInt(2));
			  vo.setNo(rs.getInt(3));
			  vo.setId(rs.getString(4));
			  vo.setName(rs.getString(5));
			  vo.setMsg(rs.getString(6));
			  vo.setDbday(rs.getString(7));
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
  
  //댓글 삭제 
  public void allReplyDelete(int arno)
  {
	  try
	  {
		  conn=CreateConnection.getConnection();
		  String sql="DELETE FROM gg_allreply_4 "
				    +"WHERE arno=?";
		  ps=conn.prepareStatement(sql);
		  ps.setInt(1, arno);
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
  //댓글 수정 
  public void allReplyUpdate(int arno,String msg)
  {
	  try
	  {
		  conn=CreateConnection.getConnection();
		  String sql="UPDATE gg_allreply_4 SET "
				    +"msg=? "
				    +"WHERE arno=?";
		  ps=conn.prepareStatement(sql);
		  ps.setString(1, msg);
		  ps.setInt(2, arno);
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

  public List<AllReplyVO> ad_allReplyListData(int page)
  {

	  List<AllReplyVO> list=new ArrayList<AllReplyVO>();
	  try
	  {
		  conn=CreateConnection.getConnection();
		  String sql="SELECT arno,cate_no,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS'),rownum "
		  		    + "FROM(SELECT arno,cate_no,id,name,msg,regdate,rownum as num "
		  		    + "FROM(SELECT arno,cate_no,id,name,msg,regdate "
				    +"FROM gg_allreply_4 ORDER BY arno DESC)) "
				    + "WHERE num BETWEEN ? AND ? ";
		  ps=conn.prepareStatement(sql);
		  int rowSize = 10;
			int start = (page*rowSize) - (rowSize-1); // 1, 11, 21 ...
			int end = page * rowSize; // 10, 20, 30
			// ?에 값을 채운다
			ps.setInt(1, start);
			ps.setInt(2, end);
		  
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  AllReplyVO vo=new AllReplyVO();
			  vo.setArno(rs.getInt(1));
			  vo.setCate_no(rs.getInt(2));
			  vo.setId(rs.getString(3));
			  vo.setName(rs.getString(4));
			  vo.setMsg(rs.getString(5));
			  vo.setDbday(rs.getString(6));
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
  public void ad_allReplyDelete(int arno)
  {
	  try
	  {
		  conn=CreateConnection.getConnection();
		  String sql="DELETE FROM gg_allreply_4 "
				    +"WHERE arno=?";
		  ps=conn.prepareStatement(sql);
		  ps.setInt(1, arno);
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
  public int AllreplyTotalPage()
  {
	   int total=0;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/10.0) FROM gg_AllReply_4";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   total=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return total;
  }
 
  public List<BoardReplyVO> ad_boardReplyListData(int page)
  {

	  List<BoardReplyVO> list=new ArrayList<BoardReplyVO>();
	  try
	  {
	  
		  conn=CreateConnection.getConnection();
		  String sql="SELECT rno,bno,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS'),num "
				    +"FROM(SELECT rno,bno,id,name,msg,regdate,rownum as num "
				    + "FROM(SELECT rno,bno,id,name,msg,regdate "
				    + "FROM gg_reply_4 ORDER BY rno DESC)) "
				    + "WHERE num BETWEEN ? AND ? ";
		  ps=conn.prepareStatement(sql);
		  
		  int rowSize = 10;
			int start = (page*rowSize) - (rowSize-1); // 1, 11, 21 ...
			int end = page * rowSize; // 10, 20, 30
			// ?에 값을 채운다
			ps.setInt(1, start);
			ps.setInt(2, end);
		  
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  BoardReplyVO vo=new BoardReplyVO();
			  vo.setRno(rs.getInt(1));
			  vo.setBno(rs.getInt(2));
			  vo.setId(rs.getString(3));
			  vo.setName(rs.getString(4));
			  vo.setMsg(rs.getString(5));
			  vo.setDbday(rs.getString(6));
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
  public void ad_boardReplyDelete(int rno)
  {
	  try
	  {
		  conn=CreateConnection.getConnection();
		  String sql="DELETE FROM gg_reply_4 "
				    +"WHERE rno=?";
		  ps=conn.prepareStatement(sql);
		  ps.setInt(1, rno);
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
  public int BoardreplyTotalPage()
  {
	   int total=0;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/10.0) FROM gg_reply_4";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   total=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return total;
  }

}