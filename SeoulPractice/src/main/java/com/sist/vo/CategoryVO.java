package com.sist.vo;
/*
FCNO     NOT NULL NUMBER         
TITLE    NOT NULL VARCHAR2(300)  
SUBTITLE NOT NULL VARCHAR2(1000) 
IMAGE    NOT NULL VARCHAR2(260)  
LINK     NOT NULL VARCHAR2(100)  
 */
public class CategoryVO {
	private int fcno;
	private String title,subtitle,poster,link;
	public int getFcno() {
		return fcno;
	}
	public void setFcno(int fcno) {
		this.fcno = fcno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	

}
