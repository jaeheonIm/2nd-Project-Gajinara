package com.gaji.board.vo;

public class categoryVO {
	private String category, value;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "categoryVO [category=" + category + ", value=" + value + "]";
	}
		
}
