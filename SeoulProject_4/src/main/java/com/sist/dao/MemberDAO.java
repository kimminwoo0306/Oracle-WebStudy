package com.sist.dao;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.vo.MemberVO;
import java.sql.*;

public class MemberDAO {
   private Connection conn;
   private PreparedStatement ps;
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
   // 3. 회원 수정 
   // 4. ID찾기 
   public String memberIdfind(String name, String email)
   {
	   String id = "no";
	   System.out.println(name);
	   System.out.println(email);
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT rpad(substr(id,1,length(id)/2),length(id),'*') as id FROM gg_member_4 "
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
   public String memberPwdfind(String id, String email)
   {
	   String pwd = "no";
	   System.out.println(id);
	   System.out.println(email);
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql= "select rpad(substr(pwd,1,length(pwd)/2),length(pwd),'*') as pwd FROM gg_member_4 "
				   		+ "WHERE id = ? AND email = ?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ps.setString(2, email);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   pwd=rs.getString(1);
		   rs.close();
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return pwd;
   }
 
   public MemberVO member_info(String id) {
	   MemberVO vo=new MemberVO();
	   try {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT id,pwd,name,sex,nick,birth,email,phone,tos,admin,"
		   		+ "(SELECT SUBSTR(phone,5,4) FROM gg_member_4 WHERE id=?) tel1,"
		   		+ "(SELECT SUBSTR(phone,10,4) FROM gg_member_4 WHERE id=?) tel2 "
		   		+ "FROM gg_member_4 "
		   		+ "WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ps.setString(2, id);
		   ps.setString(3, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setId(rs.getString(1));
		   vo.setPwd(rs.getString(2));
		   vo.setName(rs.getString(3));
		   vo.setSex(rs.getString(4));
		   vo.setNick(rs.getString(5));
		   vo.setBirth(rs.getString(6));
		   vo.setEmail(rs.getString(7));
		   vo.setPhone(rs.getString(8));
		   vo.setTos(rs.getString(9));
		   vo.setAdmin(rs.getString(10));
		   vo.setTel1(rs.getString(11));
		   vo.setTel2(rs.getString(12));
		   rs.close();
	   }catch(Exception ex) {
		   ex.printStackTrace();
	   }finally {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return vo;
   }
   
// 3. 회원 수정 
   public MemberVO memberJoinUpdateData(String id)
   {
	   MemberVO vo=new MemberVO();
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT id,pwd,name,sex,nick,birth,email,phone,tos,admin "
				   + "(SELECT SUBSTR(phone,5,4) FROM gg_member_4 WHERE id=?) tel1,"
			   		+ "(SELECT SUBSTR(phone,10,4) FROM gg_member_4 WHERE id=?) tel2 "
				     +"FROM gg_member_4 "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ps.setString(2, id);
		   ps.setString(3, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setId(rs.getString(1));
		   vo.setPwd(rs.getString(2));
		   vo.setName(rs.getString(3));
		   vo.setSex(rs.getString(4));
		   vo.setNick(rs.getString(5));
		   vo.setBirth(rs.getString(6));
		   vo.setEmail(rs.getString(7));
		   vo.setPhone(rs.getString(8));
		   vo.setTos(rs.getString(9));
		   vo.setAdmin(rs.getString(10));
		   vo.setTel1(rs.getString(11));
		   vo.setTel2(rs.getString(12));
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
   
   // 회원 수정 
   public boolean memberJoinUpdate(MemberVO vo)
   {
	   boolean bCheck=false;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT pwd FROM gg_member_4 "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getId());
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   String db_pwd=rs.getString(1);
		   rs.close();
		   
		   if(db_pwd.equals(vo.getPwd()))
		   {
			   bCheck=true;
			   //id,pwd,name,sex,nick,birth,email,phone,tos,admin
			   sql="UPDATE gg_member_4 SET "
				  +"pwd=?,name=?,sex=?,nick=?,birth=?,email=?,phone=?,tos=? "
				  +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   
			   ps.setString(1, vo.getPwd());
			   ps.setString(2, vo.getName());
			   ps.setString(3, vo.getSex());
			   ps.setString(4, vo.getNick());
			   ps.setString(5, vo.getBirth());
			   ps.setString(6, vo.getEmail());
			   ps.setString(7, vo.getPhone());
			   ps.setString(8, vo.getTos());
			   ps.setString(9, vo.getId());
			   ps.executeUpdate();
			   
			  
		   }
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return bCheck;
   }
// 6. 회원 탈퇴 
   public boolean memberJoinDelete(String id,String pwd)
   {
	   boolean bCheck=false;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT pwd FROM gg_member_4 "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   String db_pwd=rs.getString(1);
		   rs.close();
		   
		   if(db_pwd.equals(pwd))
		   {
			   bCheck=true;
			   sql="DELETE FROM gg_member_4 "
				  +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   ps.executeUpdate();
		   }
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return bCheck;
   }

   public List<MemberVO> ad_allMemberList(int page){
	   List<MemberVO> list=new ArrayList<MemberVO>();
	   try {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT id,name,sex,email,phone,admin,num "
		   		+ "FROM(SELECT id,name,sex,email,phone,admin,rownum as num "
		   		+ "FROM(SELECT id,name,sex,email,phone,admin "
		   		+ "FROM gg_member_4)) "
		   		+ "WHERE num BETWEEN ? AND ?";
		   ps=conn.prepareStatement(sql);
		   int rowSize = 10;
			int start = (page*rowSize) - (rowSize-1); // 1, 11, 21 ...
			int end = page * rowSize; // 10, 20, 30
			// ?에 값을 채운다
			ps.setInt(1, start);
			ps.setInt(2, end);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next()) {
			   MemberVO vo=new MemberVO();
			   vo.setId(rs.getString(1));
			   vo.setName(rs.getString(2));
			   vo.setSex(rs.getString(3));
			   vo.setEmail(rs.getNString(4));
			   vo.setPhone(rs.getString(5));
			   vo.setAdmin(rs.getString(6));
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex) {
		   ex.printStackTrace();
	   }finally {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return list;
   }
   public void ad_memberDelete(String id) {
	   try {
		   conn=CreateConnection.getConnection();
		   String sql="DELETE FROM gg_member_4 "
		   		+ "WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ps.executeUpdate();
	   }catch(Exception ex) {
		   ex.printStackTrace();
	   }finally {
		   CreateConnection.disConnection(conn, ps);
	   }
   }
   public int MemberListTotalPage()
   {
 	   int total=0;
 	   try
 	   {
 		   conn=CreateConnection.getConnection();
 		   String sql="SELECT CEIL(COUNT(*)/10.0) FROM gg_member_4";
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
   public int membercount() {
	   int count=0;
	   try {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT COUNT(*) FROM gg_member_4";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex) {
		   ex.printStackTrace();
	   }finally {
		   CreateConnection.disConnection(conn, ps);
	   }
	   return count;
   }
}