package com.sist.dao;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.vo.MemberVO;
import java.sql.*;

public class MemberDAO {
   private Connection conn;
   private PreparedStatement ps;
   
   // 1. 회원 가입 
   /*
    *   ID       NOT NULL VARCHAR2(20)  
		PWD      NOT NULL VARCHAR2(10)  
		NAME     NOT NULL VARCHAR2(34)  
		SEX               VARCHAR2(6)   
		BIRTHDAY NOT NULL VARCHAR2(15)  
		EMAIL             VARCHAR2(50)  
		POST     NOT NULL VARCHAR2(7)   
		ADDR1    NOT NULL VARCHAR2(200) 
		ADDR2             VARCHAR2(200) 
		PHONE    NOT NULL VARCHAR2(20)  
		CONTENT           CLOB          
		ADMIN             CHAR(1)       
		RGDATE            DATE 
    */
   //1. ID중복체크 
   public int memberIdCheck(String id)
   {
	   int count=0;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT COUNT(*) FROM gg_member_4 "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return count;
   }
   
   //3. Email 검색 
   public int memberEmailCheck(String email)
   {
	   int count=0;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT COUNT(*) FROM gg_member_4 "
				     +"WHERE email=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, email);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return count;
   }
 //3. 닉네임 검색 
   public int memberNickCheck(String nick)
   {
	   int count=0;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT COUNT(*) FROM gg_member_4 "
				     +"WHERE nick=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, nick);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return count;
   }
   //4. 전화번호 검색 
   public int memberPhoneCheck(String phone)
   {
	   int count=0;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT COUNT(*) FROM gg_member_4 "
				     +"WHERE phone=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, phone);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return count;
   }
   public void memberInsert(MemberVO vo)
   {
	   try
	   {	//private String id, pwd, name, sex, nick, birth, email, phone, tos, admin, msg;
		   conn=CreateConnection.getConnection();
		   String sql="INSERT INTO gg_member_4 (id,pwd,name,sex,nick,birth,email,phone,tos,admin) "
				   + "VALUES(?,?,?,?,?,?,?,?,?,'n')";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getId());
		   ps.setString(2, vo.getPwd());
		   ps.setString(3, vo.getName());
		   ps.setString(4, vo.getSex());
		   ps.setString(5, vo.getNick());
		   ps.setString(6, vo.getBirth());
		   ps.setString(7, vo.getEmail());
		   ps.setString(8, vo.getPhone());
		   ps.setString(9, vo.getTos());
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
   // 2. 로그인 
   public MemberVO memberLogin(String id,String pwd)
   {
	   MemberVO vo=new MemberVO();
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT COUNT(*) from gg_member_4 "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int count=rs.getInt(1);
		   rs.close();
		   ///////////////////////////////////////// ID존재여부 확인 
		   if(count==0)
		   {
			   vo.setMsg("NOID");
		   }
		   else  //ID존재 
		   {
			   sql="SELECT id,pwd,name,admin FROM gg_member_4 "
				  +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   rs=ps.executeQuery();
			   rs.next();
			   String db_id=rs.getString(1);
			   String db_pwd=rs.getString(2);
			   String db_name=rs.getString(3);
			   String db_admin=rs.getString(4);
			   rs.close();
			   
			   if(db_pwd.equals(pwd))//로그인 
			   {
				   vo.setMsg("OK");
				   vo.setId(db_id);
				   vo.setName(db_name);
				   vo.setAdmin(db_admin);
			   }
			   else // 비밀번호가 틀린 상태
			   {
				   vo.setMsg("NOPWD");
			   }
		   }
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
   
   //3. 닉네임 검색 
   
   
   // 3. 회원 수정 
   // 4. ID찾기 
   public String memberIdfind(String name, String email)
   {
	   String id = "";
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT id FROM gg_member_4 "
		   			+ "WHERE name = ? AND email = ?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, name);
		   ps.setString(2, email);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   id=rs.getString(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return id;
   }
   // 5. PWD 찾기 
   // 6. 회원 탈퇴 
}