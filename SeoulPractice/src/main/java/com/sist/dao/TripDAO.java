//여행지, 축제 DAO

package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class TripDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//메인페이지 - 여행지 명소리스트
	public List<TripVO> tripLandmarkList()
	{
		List<TripVO> list=new ArrayList<TripVO>();
		try
		{
			//주소 추가하기(OO구)
			conn=CreateConnection.getConnection();
			String sql="SELECT /*+ INDEX_ASC(gg_trip_4 t_tno_pk_4)*/ "
					   +"tcno,tno,name,image,addr,hit,rownum FROM gg_trip_4 "
					   +"WHERE tcno=1 "
					   +"AND rownum<=12";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				TripVO vo=new TripVO();
				vo.setTcno(rs.getInt(1));
				vo.setTno(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setImage(rs.getString(4));
				String addr=rs.getString(5);
				String[] addrSplit=addr.split(" ");
				vo.setAddr(addrSplit[1]);
				vo.setHit(rs.getInt(6));
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
	//메인페이지 - 여행지 자연/즐길거리/쇼핑 리스트
	public List<TripVO> tripOhterList(int tcno)
	{
		List<TripVO> list=new ArrayList<TripVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT /*+ INDEX_ASC(gg_trip_4 t_tno_pk_4)*/ "
					   +"tcno,tno,name,image,addr,hit,rownum FROM gg_trip_4 "
					   +"WHERE tcno=? "
					   +"AND rownum<=12";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, tcno);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				TripVO vo=new TripVO();
				vo.setTcno(rs.getInt(1));
				vo.setTno(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setImage(rs.getString(4));
				String addr=rs.getString(5);
				String[] addrSplit=addr.split(" ");
				vo.setAddr(addrSplit[1]);
				vo.setHit(rs.getInt(6));
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
	
	//메인페이지 - 축제리스트
	public List<FestivalVO> festivalListData()
	{
		List<FestivalVO> list=new ArrayList<FestivalVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT /*+ INDEX_ASC(gg_trip_4 t_tno_pk_4)*/ "
					    +"name, image, rownum FROM gg_festival_4 "
						+"WHERE rownum <=12";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FestivalVO vo=new FestivalVO();
				vo.setName(rs.getString(1));
				vo.setImage(rs.getString(2));
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
	
	//전체여행지페이지 - 여행지리스트
	public List<TripVO> tripAllListData(int tcno,int page)
	{
		List<TripVO> list=new ArrayList<TripVO>();
		try
		{
			conn=CreateConnection.getConnection();
			/*int[] tripCategory={1,2,3,4};*/ //1번 명소, 2번 자연, 3번 즐길거리, 4번 쇼핑
			String sql="SELECT tcno,tno,name,image,addr,hit,num "
					  +"FROM (SELECT /*+ INDEX_ASC(gg_trip_4 t_tno_pk_4)*/ "
					  +"tcno,tno,name,image,addr,hit,rownum as num "
					  +"FROM gg_trip_4 "
					  +"WHERE tcno=?) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=9;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, tcno);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				TripVO vo=new TripVO();
				vo.setTcno(rs.getInt(1));
				vo.setTno(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setImage(rs.getString(4));
				String addr=rs.getString(5);
				String[] addrSplit=addr.split(" ");
				vo.setAddr(addrSplit[1]);
				vo.setHit(rs.getInt(6));
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
	
	//전체여행지페이지 - 여행지리스트 총페이지
	public int tripTotalPage(int tcno)
	{
		int totalpage=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT CEIL(count(*)/9.0) FROM gg_trip_4 "
					  +"WHERE tcno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, tcno);
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
	
	
	
	//전체여행지페이지 - 지역필터링 여행지리스트
	public List<TripVO> tripAreaListData(int tcno,int page,String gu)
	{
		List<TripVO> list=new ArrayList<TripVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT tcno,tno,name,image,addr,hit,num "
					  +"FROM (SELECT /*+ INDEX_ASC(gg_trip_4 t_tno_pk_4)*/ "
					  +"tcno,tno,name,image,addr,hit,rownum as num "
					  +"FROM gg_trip_4 "
					  +"WHERE tcno=?"
					  +"AND REGEXP_LIKE(addr,?)) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=9;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, tcno);
			ps.setString(2, gu);
			ps.setInt(3, start);
			ps.setInt(4, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				TripVO vo=new TripVO();
				vo.setTcno(rs.getInt(1));
				vo.setTno(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setImage(rs.getString(4));
				String addr=rs.getString(5);
				String[] addrSplit=addr.split(" ");
				vo.setAddr(addrSplit[1]);
				vo.setHit(rs.getInt(6));
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
	
	
	//전체여행지페이지 - 지역필터링 여행지리스트 총페이지
	public int tripAreaTotalPage(int tcno,String gu)
	{
		int areaTotalPage=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT CEIL(count(*)/9.0) FROM gg_trip_4 "
					  +"WHERE tcno=? "
					  +"AND REGEXP_LIKE(addr,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, tcno);
			ps.setString(2, gu);
			ResultSet rs=ps.executeQuery();
			rs.next();
			areaTotalPage=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return areaTotalPage;
	}	
	
	
	
	
	public TripVO tripDetail(int tno)
	{
		TripVO vo=new TripVO();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="UPDATE gg_trip_4 SET "
					  +"hit=hit+1 "
					  +"WHERE tno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, tno);
			ps.executeUpdate();
			
			sql="SELECT tcno,tno,name,image,content,addr,hit,jjim,tlike "
			    +"FROM gg_trip_4 "
			    +"WHERE tno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, tno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setTcno(rs.getInt(1));
			vo.setTno(rs.getInt(2));
			vo.setName(rs.getString(3));
			vo.setImage(rs.getString(4));
			vo.setContent(rs.getString(5));
			vo.setAddr(rs.getString(6));
			vo.setHit(rs.getInt(7));
			vo.setJjim(rs.getInt(8));
			vo.setTlike(rs.getInt(9));
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

}









