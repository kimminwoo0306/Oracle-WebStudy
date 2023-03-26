package com.sist.temp;
import java.util.*;
import java.sql.*;
public class GoodsAccountMain {
  private Connection conn;
  private PreparedStatement ps;
  private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
  
  public GoodsAccountMain()
  {
	  try
	  {
		  Class.forName("oracle.jdbc.driver.OracleDriver");
	  }catch(Exception ex) {}
  }
  public void getConnection()
  {
	  try
	  {
		  conn=DriverManager.getConnection(URL,"hr","happy");
	  }catch(Exception ex){}
  }
  public void disConnection()
  {
	  try
	  {
		  if(ps!=null) ps.close();
		  if(conn!=null) conn.close();
	  }catch(Exception ex) {}
  }
  public void goodsAccountInsert(int no,int account)
  {
	  try
	  {
		  getConnection();
		  String sql="UPDATE goods_all SET "
				    +"account=? "
				    +"WHERE no=?";
		  ps=conn.prepareStatement(sql);
		  ps.setInt(1, account);
		  ps.setInt(2, no);
		  ps.executeUpdate();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  disConnection();
	  }
  }
  
  public static void main(String[] args) {
	GoodsAccountMain gm=new GoodsAccountMain();

	
  }
  public void foodReserveTimeInsert(int rdate,String time)
  {
	  try
	  {
		  getConnection();
		  String sql="INSERT INTO gg_foodDate_4 VALUES("
				    +"(SELECT NVL(MAX(fdno)+1,1) FROM gg_foodDate_4),?,?)";
		  ps=conn.prepareStatement(sql);
		  ps.setInt(1, rdate);
		  ps.setString(2, time);
		  ps.executeUpdate();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  disConnection();
	  }
  }
  // 예약가능한 날 저장 
  public void foodReserveDayInsert(int fno,String reserve_day)
  {
	  try
	  {
		  getConnection();
		  String sql="UPDATE gg_locationFood_4 SET "
				    +"reserve_day=? "
				    +"WHERE fno=?";
		  ps=conn.prepareStatement(sql);
		  ps.setString(1, reserve_day);
		  ps.setInt(2, fno);
		  ps.executeUpdate();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  disConnection();
	  }
  }
  public List<Integer> foodNumberData()
  {
	  List<Integer> list=new ArrayList<Integer>();
	  try
	  {
		  getConnection();
		  String sql="SELECT fno FROM gg_locationFood_4";
		  ps=conn.prepareStatement(sql);
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  list.add(rs.getInt(1));
		  }
		  rs.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  disConnection();
	  }
	  return list;
  }
  public String reserve_day()
  {
	  String s="";
	  int[] com=new int[(int)(Math.random()*10)+7];
	  int su=0;
	  boolean bCheck=false;
	  for(int i=0;i<com.length;i++)
	  {
		  bCheck=true;
		  while(bCheck)
		  {
			  su=(int)(Math.random()*30)+1;
			  bCheck=false;
			  for(int j=0;j<i;j++)
			  {
				  if(com[j]==su)
				  {
				     bCheck=true;
				     break;
				  }
				  
			  }
		  }
		  com[i]=su;
	  }
	  
	  for(int i:com)
	  {
		  s+=i+",";
	  }
	  s=s.substring(0,s.lastIndexOf(","));
	  return s;
  }
  
  public String reserve_time()
  {
	  String s="";
	  int[] com=new int[(int)(Math.random()*5)+5];
	  int su=0;
	  boolean bCheck=false;
	  for(int i=0;i<com.length;i++)
	  {
		  bCheck=true;
		  while(bCheck)
		  {
			  su=(int)(Math.random()*16)+1;
			  bCheck=false;
			  for(int j=0;j<i;j++)
			  {
				  if(com[j]==su)
				  {
				     bCheck=true;
				     break;
				  }
				  
			  }
		  }
		  com[i]=su;
	  }
	  
	  Arrays.sort(com);
	  
	  for(int i:com)
	  {
		  s+=i+",";
	  }
	  s=s.substring(0,s.lastIndexOf(","));
	  return s;
  }
}








