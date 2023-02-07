package com.sist.dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.*;
import java.io.*;

public class CartDAO {
   private static SqlSessionFactory ssf; // CreateConnection
   static {
      // XML 파싱하는 부분 (XML 읽기)
      try {
         Reader reader = Resources.getResourceAsReader("Config.xml");
         ssf = new SqlSessionFactoryBuilder().build(reader);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   
   // insert
   /*
       <insert id="goodsCartInsert" parameterType="CartVO">
       INSERT INTO project_goods_buy VALUES(pgb_bno_seq.nextval,#{gno},#{id},#{account},#{total_price},'n',SYSDATE)
       </insert>
    */
   public static void goodsCartInsert(CartVO vo) {
      ssf.openSession(true).insert("goodsCartInsert",vo);
   }
   // select
   /*
    *  <select id="goodCartListData" resultType="CartVO" parameterType="string">
       SELECT bno, gno, id, account, total_price, TO_CHAR(regdate,'YYYY-MM-DD') as dbday,
       buy_ok, goods_poster, goods_name, goods_price
       FROM project_goods_buy pgb, goods_all ga
       WHERE pgb.gno = ga.no
       AND id = #{id}
       </select>
    */
   public static List<CartVO> goodCartListData(String id) {
      List<CartVO> list = null;
      try {
         
         SqlSession session = ssf.openSession();
         list = session.selectList("goodCartListData", id);
         //return ssf.openSession().selectList("goodCartListData", id); // openSession에 true를 주면 commit 사용 안주면 미사용
         session.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return list;
   }
   // delete
   /*
    * <delete id="goodsCartDelete" parameterType="int">
       DELETE FROM project_goods_buy
       WHERE bno = #{bno}
       </delete>
    */
   public static void goodsCartDelete(int bno) {
      ssf.openSession(true).delete("goodsCartDelete",bno); // delete(int bno) => 나중에는 자동으로 sql문장까지 만들어줌
   }
}