package com.sist.dao;
import java.util.*;
import java.sql.*;
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	private final String DRIVER="oracle.jdbc.driver.OracleDriver";
	private final String USER="hr";
	private final String PWD="happy";
	
	// 드라이버 등록\
	public FoodDAO()
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
	// 기능
	// 1. 목록 출력 => 인라인뷰, 인덱스 이용
	public ArrayList<FoodVO> foodListData(int page)
	{
		ArrayList<FoodVO> list=new ArrayList<FoodVO>();
		try
		{
			// 1. 연결
			getConnection();
			// 2. sql문장 제작
			String sql="SELECT fno,name,poster,score,num "
					  +"FROM (SELECT fno,name,poster,score,rownum as num "
					  +"FROM (SELECT /*+ INDEX_ASC(food_location pk_food_location)*/ fno,name,poster,score "
					  +"FROM food_location)) "
					  +"WHERE num BETWEEN ? AND ?";
			// 3. 오라클로 전송
			ps=conn.prepareStatement(sql);
			// 4. ?에 값 채우기
			int rowSize=20;
			int start=(rowSize*page)-(rowSize-1);
			int end=(rowSize*page);
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			// 5. 실행 요청
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setScore(rs.getDouble(4));
				//vo는 맛집 정보를 가지고 있따
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
	
}
