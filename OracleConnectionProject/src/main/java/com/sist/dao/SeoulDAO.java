package com.sist.dao;
import java.util.*;
import java.sql.*;
public class SeoulDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	private final String DRIVER="oracle.jdbc.driver.OracleDriver";
	private final String USER="hr";
	private final String PWD="happy";
	
	// 드라이버 등록\
	public SeoulDAO()
	{
		// 한번만 등록이 가능 => 객체 생성시 한번만 호출 : 자동로그인, ID 저장
		try
		{
			// 등록 => Class.forName(), Properties 이용
			Class.forName(DRIVER);
			// 패키지명.클래스명을 등록 -> 메모리 할당을 요청
			// -> MyBatis, Spring, Spting-boogdmf e
			// 스프링 => new 사용하지 않는다 => 메모리 할당 => ㅗ너테이션
			/*
			 *  @Repository
			 *  class A
			 *  
			 *  class B
			 *  {
			 * 	 @Autowired
			 * 	 A = a;[
			 * \\\ 
			 * 
			 *  }
			 */
		}catch(Exception ex) {}
	}
	// 오라클 연결 => DBCP
	public void getConnection()
	{
		try
		{
			conn=DriverManager.getConnection(URL,USER,PWD);
		}catch(Exception ex) {}
	}
	// 오라클 닫기
	public void disConnection()
	{
		try
		{
			if(ps!= null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	// 기능별 설정
	// VO, DAO -> 테이블 한개에 대한 기능
	public ArrayList<SeoulVO> seoulListData(int type)
	{
		String[] table_name= {"","seoul_location","seoul_nature","seoul_shop"};
		ArrayList<SeoulVO> list=new ArrayList<SeoulVO>();
		try
		{
			//1. 연결
			getConnection();
			//2. sql문장 전송
			String sql="SELECT no,title FROM "+table_name[type];
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				SeoulVO vo=new SeoulVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				list.add(vo);
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
	// DAO,DAO => Service

}
