package com.gaji.dongnae.vo;

public class CategoryVO {
	private String category,value,count;

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

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
		return "CategoryVO [category=" + category + ", value=" + value + "]";
	}
		
}
