package com.sist.vo;
/*
FNO     NOT NULL NUMBER         
FCNO             NUMBER         
IMAGE   NOT NULL VARCHAR2(1000) 
NAME    NOT NULL VARCHAR2(100)  
SCORE   NOT NULL NUMBER(2,1)    
ADDR    NOT NULL VARCHAR2(300)  
TEL     NOT NULL VARCHAR2(20)   
TYPE    NOT NULL VARCHAR2(100)  
PRICE            VARCHAR2(100)  
TIME             VARCHAR2(200)  
MENU             VARCHAR2(500)  
PARKING          VARCHAR2(200)  
JJIM             NUMBER         
FLIKE            NUMBER         
HIT              NUMBER         
GOOD             NUMBER         
SOSO             NUMBER         
BAD              NUMBER         
 */
public class FoodVO {
	private int fno,fcno,jjim,flike,hit,good,soso,bad;
	private double score;
	private String poster,name,addr,tel,type,price,time,menu,parking;
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getFcno() {
		return fcno;
	}
	public void setFcno(int fcno) {
		this.fcno = fcno;
	}
	public int getJjim() {
		return jjim;
	}
	public void setJjim(int jjim) {
		this.jjim = jjim;
	}
	public int getFlike() {
		return flike;
	}
	public void setFlike(int flike) {
		this.flike = flike;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getSoso() {
		return soso;
	}
	public void setSoso(int soso) {
		this.soso = soso;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	
	
	
}
