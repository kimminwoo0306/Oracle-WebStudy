package com.sist.vo;
import java.util.*;
/*
 *  NNO     NOT NULL NUMBER        
	TYPE             NUMBER        
	NAME    NOT NULL VARCHAR2(34)  
	TITLE   NOT NULL VARCHAR2(300) 
	CONTENT NOT NULL CLOB          
	REGDATE          DATE          
	MODDATE          DATE          
	HIT              NUMBER        
	ID               VARCHAR2(20)
 */
public class NoticeVO {
	private int nno, type, hit, filesize;
	private String name, title, content, id,dbday, filename, prefix;
	private Date regdate, moddate;
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getModdate() {
		return moddate;
	}
	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	
}
