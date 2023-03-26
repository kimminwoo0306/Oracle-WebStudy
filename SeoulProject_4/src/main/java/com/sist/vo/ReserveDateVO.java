package com.sist.vo;
/*
FDNO  NOT NULL NUMBER        
RDATE NOT NULL NUMBER        
TIME  NOT NULL VARCHAR2(100)
 */
public class ReserveDateVO {
	private int fdno,rdate;
	private String time;
	public int getFdno() {
		return fdno;
	}
	public void setFdno(int fdno) {
		this.fdno = fdno;
	}
	public int getRdate() {
		return rdate;
	}
	public void setRdate(int rdate) {
		this.rdate = rdate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
