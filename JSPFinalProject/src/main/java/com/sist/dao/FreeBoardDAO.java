package com.sist.dao;
// ==> SQL문장 작성이 핵심
import java.util.*;

import com.sist.vo.FreeBoardVO;

import java.sql.*;
/*
 *   SELECT , DELETE, UPDATE, INSERT
 *   인라인뷰, 조인, 서브쿼리
 *   -------------------
 */
public class FreeBoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	// 목록 출력
	public List<FreeBoardVO> boardListData(int page)
	{
		List<FreeBoardVO> list=new ArrayList<FreeBoardVO>();
		try
		{
			conn=CreateConnection.getConnection(); // 주소값 얻기(미리 생성 Connection)
			String sql="SELECT no, subject, name, TO_CHAR(regdate,'YYYY-MM-DD'), hit, num "
					  +"FROM (SELECT no, subject, name, regdate, hit, rownum as num "
					  +"FROM (SELECT /*+ INDEX_DESC(project_freeboard pf1_no_pk)*/no, subject, name, regdate, hit "
					  +"FROM project_freeboard)) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql); // sql 문장을 오라클 전송 -> 나중에 값을 채워서 수행
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FreeBoardVO vo=new FreeBoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				list.add(vo);
			}
			rs.close();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps); // 반환
		}
		return list;
	}
	// 총페이지
	public int boardTotalPage()
	{
		int total=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT CEIL(COUNT(*)/10.0) FROM project_freeboard";
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
	// 추가
	public void boardInsert(FreeBoardVO vo)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO project_freeboard(no,name,subject,content,pwd) "
					  +"VALUES(pf_no_seq.nextval,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			// 실행명령 ==> commit ==> executeUpdate() => commit 포함
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
	// 상세보기
	public FreeBoardVO boardDetailData(int no)
	{
		FreeBoardVO vo=new FreeBoardVO();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="UPDATE project_freeboard SET "
					  +"hit=hit+1 "
					  +"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			/////////////////////////////////////// 조회수 증가
			// 실제 게시물 번호에 해당되는 상세보기 데이터
			sql="SELECT no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD'),hit "
			   +"FROM project_freeboard "
			   +"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setHit(rs.getInt(6));
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
	// 수정
	// 삭제
	// 검색 => 다중 검색
	// 댓글 ===> 프로시저
}
