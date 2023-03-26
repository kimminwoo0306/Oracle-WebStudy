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
         String sql="SELECT /*+ INDEX_ASC(gg_festival_4 f_fno_pk_4)*/ "
                   +"name,image,period,web,addr,rownum FROM gg_festival_4 "
                  +"WHERE rownum <=12";
         ps=conn.prepareStatement(sql);
         ResultSet rs=ps.executeQuery();
         while(rs.next())
         {
            FestivalVO vo=new FestivalVO();
            vo.setName(rs.getString(1));
            vo.setImage(rs.getString(2));
            vo.setPeriod(rs.getString(3));
            vo.setWeb(rs.getString(4));
            vo.setAddr(rs.getString(5));
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
   
   //여행지 상세페이지
   public TripVO tripDetail(int tno,int no)
   {
      TripVO vo=new TripVO();
      try
      {
         conn=CreateConnection.getConnection();
         if(no==1)
         {
        	 
         
	         String sql="UPDATE gg_trip_4 SET "
	                 +"hit=hit+1 "
	                 +"WHERE tno=?";
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, tno);
	         ps.executeUpdate();
	     }
         String sql="SELECT tcno,tno,name,image,content,addr,hit,jjim "
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
   
   //여행지상세페이지 - 여행지 주변 맛집리스트 10곳
   public List<FoodVO> tripNearbyFood(String gu)
   {
      List<FoodVO> list=new ArrayList<FoodVO>();
      try
      {
         conn=CreateConnection.getConnection();
         String sql="SELECT fno,poster,name,rownum "
                 +"FROM gg_locationfood_4 "
                 +"WHERE REGEXP_LIKE(addr,?) "
                 +"AND rownum<=10";
         ps=conn.prepareStatement(sql);
         ps.setString(1, gu);
         ResultSet rs=ps.executeQuery();
         while(rs.next())
         {
            FoodVO vo=new FoodVO();
            vo.setFno(rs.getInt(1));
            String poster=rs.getString(2);
            poster=poster.substring(0,poster.indexOf("^"));
            vo.setPoster(poster);
            vo.setName(rs.getString(3));
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
   
   //여행지상세페이지 - 여행지 최신 댓글리뷰
   public List<AllReplyVO> tripRecentReply(int cate_no,int no)
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
   
   //전체여행지페이지 - 여행지 카테고리 내 검색
   public List<TripVO> tripSearchAllListData(String searchWord,int tcno,int page)
   {
      List<TripVO> list=new ArrayList<TripVO>();
      try
      {
         conn=CreateConnection.getConnection();
         String sql="SELECT tcno,tno,name,image,addr,hit,num "
                 +"FROM (SELECT /*+ INDEX_ASC(gg_trip_4 t_tno_pk_4)*/ "
                 +"tcno,tno,name,image,addr,hit,rownum as num "
                 +"FROM gg_trip_4 "
                 +"WHERE addr LIKE '%'||?||'%' OR name LIKE '%'||?||'%') "
                 +"WHERE tcno=? "
                 +"AND num BETWEEN ? AND ?";
         ps=conn.prepareStatement(sql);
         int rowSize=9;
         int start=(rowSize*page)-(rowSize-1);
         int end=rowSize*page;
         ps.setString(1, searchWord);
         ps.setString(2, searchWord);
         ps.setInt(3, tcno);
         ps.setInt(4, start);
         ps.setInt(5, end);
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
   
   //전체여행지페이지 - 여행지 카테고리 내 검색결과리스트 총페이지
   public int tripCateSearchTotalPage(String searchWord,int tcno)
   {
      int totalpage=0;
      try
      {
         conn=CreateConnection.getConnection();
         String sql="SELECT CEIL(count(*)/9.0) FROM "
               +"(SELECT * FROM gg_trip_4 "
               +"WHERE REGEXP_LIKE(addr,?) OR REGEXP_LIKE(name,?)) "
                 +"WHERE tcno=? ";
         ps=conn.prepareStatement(sql);
         ps.setString(1, searchWord);
         ps.setString(2, searchWord);
         ps.setInt(3, tcno);
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
   //전체여행지페이지 - 검색결과 총개수
   public int tripCateSearchCount(String searchWord,int tcno)
   {
      int count=0;
      try
      {
         conn=CreateConnection.getConnection();
         String sql="SELECT count(*) FROM "
                   +"(SELECT * FROM gg_trip_4 "
                   +"WHERE REGEXP_LIKE(addr,?) OR REGEXP_LIKE(name,?)) "
                   +"WHERE tcno=? ";
         ps=conn.prepareStatement(sql);
         ps.setString(1, searchWord);
         ps.setString(2, searchWord);
         ps.setInt(3, tcno);
         ResultSet rs=ps.executeQuery();
         rs.next();
         count=rs.getInt(1);
         rs.close();
      }catch(Exception ex)
      {
         ex.printStackTrace();
      }finally
      {
         CreateConnection.disConnection(conn, ps);
      }
      return count;
   }
}



