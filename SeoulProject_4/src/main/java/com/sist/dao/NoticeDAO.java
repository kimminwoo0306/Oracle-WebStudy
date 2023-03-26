package com.sist.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.sist.vo.BoardVO;
import com.sist.vo.NoticeVO;

public class NoticeDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public List<NoticeVO> noticeListData(int page)
	{ // 사용자가 데이터 전송 => 처리 (매개변수)
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql = "SELECT nno, type, title, name, TO_CHAR(regdate, 'YYYY-MM-DD'), hit,filesize, num "
					+ "FROM (SELECT nno, type, title, name, regdate, hit,filesize, rownum as num "
					+ "FROM (SELECT nno, type, title, name, regdate, hit, filesize "
					+ "FROM gg_noticeboard_4 ORDER BY nno DESC)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			int rowSize = 10;
			int start = (page*rowSize) - (rowSize-1); // 1, 11, 21 ...
			int end = page * rowSize; // 10, 20, 30
			// ?에 값을 채운다
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			// 실행
			ResultSet rs = ps.executeQuery();
			// 값을 ArrayList에 저장
			while(rs.next()) {
				NoticeVO vo = new NoticeVO();
				vo.setNno(rs.getInt(1));
				vo.setType(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setDbday(rs.getString(5));
				vo.setHit(rs.getInt(6));
				vo.setFilesize(rs.getInt(7));
				
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
	public int NoticeTotalPage() {
		int total = 0;
		try {
			conn=CreateConnection.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/10.0) FROM gg_noticeboard_4";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		
		return total;
	}
	public NoticeVO NoticeDetailData(int nno) {
		NoticeVO vo = new NoticeVO();
		try {
			conn=CreateConnection.getConnection();
			String sql = "UPDATE gg_noticeboard_4 SET "
					+ "hit= hit+1 "
					+ "WHERE nno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, nno);
			ps.executeUpdate();
			
			// 2-1 사용자가 요청한 게시물 상세 받기
			sql = "SELECT nno, name, title, content, hit, TO_CHAR(regdate,'YYYY-MM-DD'),filename, filesize "
					+ "FROM gg_noticeboard_4 "
					+ "WHERE nno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, nno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setTitle(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setHit(rs.getInt(5));
			vo.setDbday(rs.getString(6));
			vo.setFilename(rs.getString(7));
			vo.setFilesize(rs.getInt(8));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
	// 글쓰기 => request
	public void NoticeInsert(NoticeVO vo) {
		try {
			conn=CreateConnection.getConnection();
			String sql = "INSERT INTO gg_noticeboard_4(nno, name, title, content, filename,filesize) "
					+ "VALUES(gnb_nno_seq_4.nextval, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			// ?에 값을 채운다
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getContent());
			ps.setString(5, vo.getFilename());
			ps.setInt(6, vo.getFilesize());
			ps.executeUpdate(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
	////////////////////////////////////////////////////////////////////////////admin
	 public int noticeTotalPage()
	   {
		   int total=0;
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="SELECT CEIL(COUNT(*)/10.0) FROM gg_noticeboard_4";
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
	public void noticeInsert(NoticeVO vo)
	   {
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="INSERT INTO gg_noticeboard_4(nno,type,name,title,content,regdate,hit) VALUES("
					     +"(SELECT NVL(MAX(nno)+1,1) FROM gg_noticeboard_4),?,?,?,?,SYSDATE,0)";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, vo.getType());
			   ps.setString(2, vo.getName());
			   ps.setString(3, vo.getTitle());
			   ps.setString(4, vo.getContent());
			   ps.executeUpdate();//commit()
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   CreateConnection.disConnection(conn, ps);
		   }
	   }
	   public void noticeDelete(int nno)
	   {
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="DELETE FROM gg_noticeboard_4 "
					     +"WHERE nno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, nno);
			   ps.executeUpdate();//commit()
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   CreateConnection.disConnection(conn, ps);
		   }
	   }
	   public NoticeVO noticeUpdateData(int nno)
	   {
		   NoticeVO vo=new NoticeVO();
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="SELECT nno,name,title,content,type "
					     +"FROM gg_noticeboard_4 "
					     +"WHERE nno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, nno);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setNno(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setTitle(rs.getString(3));
			   vo.setContent(rs.getString(4));
			   vo.setType(rs.getInt(5));
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
	   
	   public void noticeUpdate(NoticeVO vo)
	   {
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="UPDATE gg_noticeboard_4 SET "
					     +"type=?,title=?,content=? "
					     +"WHERE nno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, vo.getType());
			   ps.setString(2, vo.getTitle());
			   ps.setString(3, vo.getContent());
			   ps.setInt(4, vo.getNno());
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
	   
	   public NoticeVO noticeDetailData(int nno)
	   {
		   NoticeVO vo=new NoticeVO();
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="UPDATE gg_noticeboard_4 SET "
					     +"hit=hit+1 "
					     +"WHERE nno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, nno);
			   ps.executeUpdate();
			   
			   sql="SELECT nno,name,title,content,type,hit,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') "
					     +"FROM gg_noticeboard_4 "
					     +"WHERE nno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, nno);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setNno(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setTitle(rs.getString(3));
			   vo.setContent(rs.getString(4));
			   vo.setType(rs.getInt(5));
			   vo.setHit(rs.getInt(6));
			   vo.setDbday(rs.getString(7));
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
	   ////////////////////////////////////////////////////////////////////////////////admin
}