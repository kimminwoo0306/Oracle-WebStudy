package com.sist.vo;
/*
 *     ajno NUMBER,
    cate_no NUMBER,
    no NUMBER,
    id VARCHAR2(20),
 */
public class AllJjimVO {
	private int ajno,cate_no,no;
	private String id,poster,name,addr,tel;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getAjno() {
		return ajno;
	}
	public void setAjno(int ajno) {
		this.ajno = ajno;
	}
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	

}