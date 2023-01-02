package com.gaji.member.vo;

public class BoardVO {
	
	private String boardIdx, id, category, title, content, price, regdate, thumbnail, img, hit, likes, cc, status, buyerId;

	public BoardVO(String boardIdx, String id, String category, String title, String content, String price,
			String regdate, String thumbnail, String img, String hit, String likes, String cc, String status,
			String buyerId) {
		super();
		this.boardIdx = boardIdx;
		this.id = id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.price = price;
		this.regdate = regdate;
		this.thumbnail = thumbnail;
		this.img = img;
		this.hit = hit;
		this.likes = likes;
		this.cc = cc;
		this.status = status;
		this.buyerId = buyerId;
	}

	public String getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(String boardIdx) {
		this.boardIdx = boardIdx;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getLikes() {
		return likes;
	}

	public void setLikes(String likes) {
		this.likes = likes;
	}

	public String getCc() {
		return cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	@Override
	public String toString() {
		return "BoardVO [boardIdx=" + boardIdx + ", id=" + id + ", category=" + category + ", title=" + title
				+ ", content=" + content + ", price=" + price + ", regdate=" + regdate + ", thumbnail=" + thumbnail
				+ ", img=" + img + ", hit=" + hit + ", likes=" + likes + ", cc=" + cc + ", status=" + status
				+ ", buyerId=" + buyerId + "]";
	}

}
