package com.sist.vo;
/*
FTNO NOT NULL NUMBER       
TIME NOT NULL VARCHAR2(20)  
 */
public class ReserveTimeVO {
	private int ftno;
	private String time;
	public int getFtno() {
		return ftno;
	}
	public void setFtno(int ftno) {
		this.ftno = ftno;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
