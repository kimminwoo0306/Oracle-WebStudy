package com.sist.dao;
import java.util.*;
import java.sql.*;
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private String URL="jdbc:oracle:thin:@localhost:1521:XE";
	public FoodDAO()
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
		}catch(Exception ex) {}
	}
	public void disConnection()
	{
		try
		{
			if(conn!= null) conn.close();
			if(ps!=null) ps.close();
		}catch(Exception ex) {}
	}
	// 맛집 카테고리 추가
	public void CategoryInsert(CategoryVO vo)
	{
		try
		{
			getConnection();
			String sql="INSERT INTO foodcategory_4 VALUES(fc_fcno_seq_4.nextval,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			// ?값 채우기]
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getSubtitle());
			ps.setString(3, vo.getImage());
			ps.setString(4, vo.getLink());
			// 실행요청
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
	//
	public ArrayList<CategoryVO> foodCategoryInfoData()
	{
		ArrayList<CategoryVO> list=new ArrayList<CategoryVO>();
		try
		{
			//1. 연결
			getConnection();
			//2. sql문장 제작
			String sql="SELECT fcno,title,link FROM foodcategory_4 ORDER BY fcno ASC";
			//3. sql 전송
			ps=conn.prepareStatement(sql);
			//4. sql 실행요청
			ResultSet rs=ps.executeQuery();
			//5. ArrayList에 담기
			while(rs.next())
			{
				if(rs!=null)
				{
					CategoryVO vo=new CategoryVO();
					vo.setFcno(rs.getInt(1));
					vo.setTitle(rs.getString(2));
					vo.setLink("https://www.mangoplate.com"+rs.getString(3));
					list.add(vo);
				}
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
	// 음식점 출력
	public void foodDetail(FoodVO vo)
	{
		try
		{
			getConnection();
			String sql="INSERT INTO foodDetail_4(fno,fcno,image,name,score,addr,tel,type,price,time,"
					  +"menu,parking,good,soso,bad) VALUES(fd_fno_seq_4.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			//?에 값을 채운다
			ps.setInt(1, vo.getFcno());
			ps.setString(2, vo.getImage());
			ps.setString(3, vo.getName());
			ps.setDouble(4, vo.getScore());
			ps.setString(5, vo.getAddr());
			ps.setString(6, vo.getTel());
			ps.setString(7, vo.getType());
			ps.setString(8, vo.getPrice());
			ps.setString(9, vo.getTime());
			ps.setString(10, vo.getMenu());
			ps.setString(11, vo.getParking());
			ps.setInt(12, vo.getGood());
			ps.setInt(13, vo.getSoso());
			ps.setInt(14, vo.getBad());
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
}
