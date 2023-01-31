package com.sist.dao;

import java.util.*;
import com.sist.vo.*;

import java.sql.*;

public class BoardDAO {
	// 오라클 연결 객체
	private Connection conn;
	// 오라클 송수신 객체 (SQL => 데이터값 받기)
	private PreparedStatement ps;
	// MyBatis / JPA ==> xml에 등록
	// 게시판 관련 (CURD)
	// 웹프로그램의 비중 ==> 50%(DB) => 자바 (20%), HTML/CSS(20%), JavaScript(10%)
	public ArrayList<BoardVO> boardListData(int page)
	{ // 사용자가 데이터 전송 => 처리 (매개변수)
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql = "SELECT bno, title, name, TO_CHAR(regdate, 'YYYY-MM-DD'), hit,filesize, num "
					+ "FROM (SELECT bno, title, name, regdate, hit,filesize, rownum as num "
					+ "FROM (SELECT bno, title, name, regdate, hit, filesize "
					+ "FROM gg_board_4 ORDER BY bno DESC)) "
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
				BoardVO vo = new BoardVO();
				vo.setBno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setFilesize(rs.getInt(6));
				
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
	// 총페이지 가지고 온다
	// JSP(Model1) ==> MV패턴 ==> MVC패턴 (프로젝트 코드)
	// M(Model) V(View) => 자바 / HTML
	// C ==> 자바/HTML => 연결
	public int boardTotalPage() {
		int total = 0;
		try {
			conn=CreateConnection.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/10.0) FROM gg_board_4";
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
	// 목록 : 페이징 (인라인 뷰), 출력 순서, 블록별 (◀ [1][2][3]...▶)
	// 상세보기 : rownum (이전 / 다음)
	public BoardVO boardDetailData(int bno) {
		BoardVO vo = new BoardVO();
		try {
			conn=CreateConnection.getConnection();
			String sql = "UPDATE gg_board_4 SET "
					+ "hit= hit+1 "
					+ "WHERE bno=?";
			// => 기능 수행 => 한개의 기능에 여러개의 SQL문장을 실행 할 수 있다
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bno);
			ps.executeUpdate();
			
			// 2-1 사용자가 요청한 게시물 상세 받기
			sql = "SELECT bno, name, title, content, hit, TO_CHAR(regdate,'YYYY-MM-DD'),filename, filesize "
					+ "FROM gg_board_4 "
					+ "WHERE bno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			// 데이터값을 받아서 저장 => JSP에서 읽기
			vo.setBno(rs.getInt(1));
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
	public void boardInsert(BoardVO vo) {
		try {
			conn=CreateConnection.getConnection();
			String sql = "INSERT INTO gg_board_4(bno, name, title, content, pwd,filename,filesize) "
					+ "VALUES(gb_bno_seq_4.nextval, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			// ?에 값을 채운다
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setString(5, vo.getFilename());
			ps.setInt(6, vo.getFilesize());
			ps.executeUpdate(); // COMMIT 포함 => INSERT, UPDATE, DELETE
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
	}
	// 수정 데이터 읽기
	// 1. Ajax, VueJS, ReactJS, Timeleaf
	public BoardVO boardUpdateData(int bno) {
		BoardVO vo = new BoardVO();
		try {
			conn=CreateConnection.getConnection();
			String sql = "SELECT bno, name, title, content "
					+ "FROM gg_board_4 "
					+ "WHERE bno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setBno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setTitle(rs.getString(3));
			vo.setContent(rs.getString(4));
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
	// 수정  => pwd일치여부 => javaScript
	public boolean boardUpdate(BoardVO vo) { // 수정할 데이터 여러개 => VO, 한개, 두개, 일반변수
		// boolean => 비밀번호가 맞는 경우 / 틀린경우 => 경우의수가 여러개면 int, String, 두개명 : boolean
		// 수정 => 비밀번호(O) => 수정하고 상세보기로 이동, 비밀번호(X) => 수정없이 이전화면으로 이동
		boolean bCheck = false;
		try {
			// 1. 연결
			conn=CreateConnection.getConnection();
			// 2. SQL => 두번 수행
			// 2-1 => 비밀번호 확인
			String sql = "SELECT pwd FROM gg_board_4 "
					+ "WHERE bno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getBno());
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			rs.close();
			
			// 비밀번호를 체크
			if(db_pwd.equals(vo.getPwd())) {
				bCheck = true;
				// 실제 수정
				sql = "UPDATE gg_board_4 SET "
					+ "name=?, title=?, content=?, moddate=SYSDATE " //regdate=SYSDATE 수정날짜 
					+ "WHERE bno=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getTitle());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getBno());
				
				// 실행 명령
				ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		
		return bCheck;
	}
	// 삭제  => -----------------
	public BoardVO boardInfoData(int no)
	{
		BoardVO vo=new BoardVO();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT filename, filesize FROM gg_board_4 "
					  +"WHERE bno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setFilename(rs.getString(1));
			vo.setFilesize(rs.getInt(2));
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
	public boolean boardDelete(int bno, String pwd) {
		boolean bCheck = false;
		try {
			conn=CreateConnection.getConnection();
			// 비밀번호 체크
			String sql = "SELECT pwd FROM gg_board_4 "
					+ "WHERE bno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(pwd) ) {
				// 삭제
				sql = "DELETE FROM gg_board_4 "
					+ "WHERE bno=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, bno);
				ps.executeUpdate();
				
				bCheck=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CreateConnection.disConnection(conn, ps);
		}
		return bCheck;
	}
	public void replyInsert(BoardReplyVO vo)
	   {
		   try
		   {
			   conn=CreateConnection.getConnection();
			   String sql="INSERT INTO gg_reply_4(rno,bno,id,name,msg,group_id) "
					     +"VALUES(gr_rno_seq.nextval,?,?,?,?,(SELECT NVL(MAX(group_id)+1,1) FROM gg_reply_4))";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, vo.getBno());
			   ps.setString(2, vo.getId());
			   ps.setString(3, vo.getName());
			   ps.setString(4, vo.getMsg());
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
	// 찾기  => <select> <checkbox> ==> 파일안에서 처리
}