package com.gaji.dongnae.vo;

import java.sql.Date;

public class BoardVO {
	
	private String id,category,title,content,thumbnail,img,status,name,uriBoardIdx;
	private Date regdate;
	private int hit,likes,cc,price;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getBoardIdx() {
		return uriBoardIdx;
	}
	public void setBoardIdx(String boardIdx) {
		this.uriBoardIdx = boardIdx;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getCc() {
		return cc;
	}
	public void setCc(int cc) {
		this.cc = cc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", thumbnail=" + thumbnail + ", img=" + img + ", regdate=" + regdate + ", boardIdx=" + uriBoardIdx
				+ ", hit=" + hit + ", likes=" + likes + ", cc=" + cc + ", status=" + status + ", price=" + price + "]";
	}
}
