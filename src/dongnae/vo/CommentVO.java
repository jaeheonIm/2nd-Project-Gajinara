package com.gaji.dongnae.vo;

import java.sql.Date;

public class CommentVO {
	private String id,content,name,uriCommentIdx,uriBoardIdx;
	private Date regdate;
	
	public CommentVO(String uriBoardIdx, String id, String content) {
		this.uriBoardIdx = uriBoardIdx;
		this.id = id;
		this.content = content;
	}
	public CommentVO() {
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUriBoardIdx() {
		return uriBoardIdx;
	}
	public void setUriBoardIdx(String uriBoardIdx) {
		this.uriBoardIdx = uriBoardIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUriCommentIdx() {
		return uriCommentIdx;
	}
	public void setUriCommentIdx(String uriCommentIdx) {
		this.uriCommentIdx = uriCommentIdx;
	}
	public String getUriBoradIdx() {
		return uriBoardIdx;
	}
	public void setUriBoradIdx(String uriBoradIdx) {
		this.uriBoardIdx = uriBoradIdx;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "CommentVO [id=" + id + ", content=" + content + ", uriCommentIdx=" + uriCommentIdx + ", uriBoradIdx="
				+ uriBoardIdx + ", regdate=" + regdate + "]";
	}
	
}
