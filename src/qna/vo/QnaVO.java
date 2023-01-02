package com.gaji.qna.vo;

public class QnaVO {
	private String qnaIdx, id, title, content, regdate, img, hit, cc, qnaPwd, phone, email;

	
	public QnaVO(String qnaIdx, String id, String title, String content, String regdate, String img, String hit,
			String cc, String qnaPwd, String phone, String email) {
		this.qnaIdx = qnaIdx;
		this.id = id;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.img = img;
		this.hit = hit;
		this.cc = cc;
		this.qnaPwd = qnaPwd;
		this.phone = phone;
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQnaPwd() {
		return qnaPwd;
	}

	public void setQnaPwd(String qnaPwd) {
		this.qnaPwd = qnaPwd;
	}

	public QnaVO() {
		
	}

	public String getQnaIdx() {
		return qnaIdx;
	}

	public void setQnaIdx(String qnaIdx) {
		this.qnaIdx = qnaIdx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

	public String getCc() {
		return cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

	@Override
	public String toString() {
		return "QnaVO [qnaIdx=" + qnaIdx + ", id=" + id + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", img=" + img + ", hit=" + hit + ", cc=" + cc + ", qnaPwd=" + qnaPwd + ", phone=" + phone
				+ ", email=" + email + "]";
	}

	
	
	
}
