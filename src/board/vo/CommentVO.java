package com.gaji.board.vo;

public class CommentVO {
	
	private String commentIdx, boardIdx, id, content, regdate;

	public String getCommentIdx() {
		return commentIdx;
	}

	public void setCommentIdx(String commentIdx) {
		this.commentIdx = commentIdx;
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

	@Override
	public String toString() {
		return "CommentVO [commentIdx=" + commentIdx + ", boardIdx=" + boardIdx + ", id=" + id + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}

	
}
