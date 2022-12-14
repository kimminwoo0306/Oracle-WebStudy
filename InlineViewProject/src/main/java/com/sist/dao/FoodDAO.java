package com.sist.dao;
import java.util.*;
import java.sql.*;
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	// 1. 드라이버 등록
	public FoodDAO()
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	// 2.  연결
	public void getConnection()
	{
		try
		{
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	// 3. 해제
	public void disConnection()
	{
		try
		{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	// 4. 기능
	// 4-1 페이징기법 => 인라인뷰 => 이미지 (5개)
	public ArrayList<FoodVO> foodListData(int page) // 매개변수 (사용자로부터 요청값)
	{
		ArrayList<FoodVO> list=new ArrayList<FoodVO>();
		/*
		try
		{
			// 1. 연결
			getConnection();
			// 2. sql 문장 제작
			String sql="SELECT fno, name, poster "
					  +"FROM food_location "
					  +"ORDER BY fno ASC";
			// 3. 오라클 전송
			ps=conn.prepareStatement(sql);
			// 4. 실행 후 결과값 저장
			ResultSet rs=ps.executeQuery();
			
			int i=0; // 20개씩 나눠주는 변수
			int j=0; // while의 횟수
			final int rowSize=20; 
			int pagecnt=(page*rowSize)-rowSize;  // 시작 위치 -> ArrayList에 저장시점
			// while, for -> 반복문, 시작부터 끝까지 수행
			while(rs.next())
			{
				if(i<rowSize && j>=pagecnt)
				{
					FoodVO vo=new FoodVO();
					vo.setFno(rs.getInt(1));
					vo.setName(rs.getString(2));
					String poster=rs.getString(3);
					poster=poster.substring(0,poster.indexOf("^"));
					vo.setPoster(poster);
					list.add(vo);
					i++;
				}
				j++;
			}
			rs.close();
			// 5. 저장된 데이터 ArrayList에 이동
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		} 
		return total; */
		
		// 인라인 뷰를 이용한 코딩 => 상위 5개, 페이지(해당 위치)
		// 적용되는 위치
		try
		{
			// 1. 연결
			getConnection();
			// 2. sql 문장
			String sql="SELECT fno, name, poster,num "
					  +"FROM (SELECT fno, name, poster, rownum as num "
					  +"FROM (SELECT fno,name,poster "
					  +"FROM food_location ORDER BY fno ASC)) "
					  +"WHERE num BETWEEN ? AND ?";
			// 3. 오라클 전송
			ps=conn.prepareStatement(sql);
			// 4. ?에 값을 채운다
			int rowSize=20;
			int start=(rowSize*page)-(rowSize-1);
			// 1page ==> 1
			// 2pqge ==> 21
			int end=rowSize*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			// 5. 결과값 받기
			ResultSet rs=ps.executeQuery();
			// 6. ArrayList에 첨부
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				String poster=rs.getString(3);
				poster=poster.substring(0,poster.indexOf("^"));
				vo.setPoster(poster);
				
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
	public int foodTotalPage()
	{
		int total=0;
		try
		{
			// 1. 연결
			getConnection();
			// 2. sql 문장 제작
			String sql="SELECT CEIL(COUNT(*)/20.0) FROM food_location"; // 총페이지 구하기
			// 3. 오라클 전송
			ps=conn.prepareStatement(sql);
			// 4. 실행요청 -> 결과값 받기
			ResultSet rs=ps.executeQuery();
			// 5. 커서 위치 변경 => 실제 출력 메모리 위치에 변경
			rs.next();
			total=rs.getInt(1);
			rs.close();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return total;
	}
	// 4-2 검색 => LIKE
	// 4-3 상세보기 => 주소잘라서 출력
	public FoodVO foodDetailData(int fno)
	{
		FoodVO vo=new FoodVO();
		try
		{
			// 1. 연결
			getConnection();
			// 2. sql 문장
			String sql="SELECT fno,name,tel,score,type,time,parking,menu,poster "
					  +"FROM (SELECT * FROM food_location) "
					  +"WHERE fno="+fno;
			// 3. 오라클 전송
			ps=conn.prepareStatement(sql);
			// 4. 결과값 저장
			ResultSet rs=ps.executeQuery();
			// 5. vo에 저장
			rs.next();
			vo.setFno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setTel(rs.getString(3));
			vo.setScore(rs.getDouble(4));
			vo.setType(rs.getString(5));
			vo.setTime(rs.getString(6));
			vo.setParking(rs.getString(7));
			vo.setMenu(rs.getString(8));
			vo.setPoster(rs.getString(9));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return vo;
	}
	public static void main(String[] args) {
		FoodDAO dao=new FoodDAO();
		Scanner scan=new Scanner(System.in);
		int totalpage=dao.foodTotalPage();
		System.out.print("1~"+totalpage+" 사이의 페이지 입력: ");
		int page=scan.nextInt();
		
		ArrayList<FoodVO> list=dao.foodListData(page);
		System.out.println("============= 결과값 출력 =============");
		for(FoodVO vo:list)
		{
			System.out.println(vo.getFno()+" "+vo.getName());
		}
	}
}






















