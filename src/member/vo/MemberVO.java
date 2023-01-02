package com.gaji.member.vo;

public class MemberVO {
	
	private String idx, id, pwd, name, birth, phone, postcord, roadaddress, detailaddress, email, status, admin, grade, hit;

	public MemberVO(String idx, String id, String pwd, String name, String birth, String phone, String postcord,
			String roadaddress, String detailaddress, String email, String status, String admin, String grade,
			String hit) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.postcord = postcord;
		this.roadaddress = roadaddress;
		this.detailaddress = detailaddress;
		this.email = email;
		this.status = status;
		this.admin = admin;
		this.grade = grade;
		this.hit = hit;
	}

	public MemberVO(String idx, String id, String pwd, String name, String birth, String phone, String postcord,
			String roadaddress, String detailaddress, String email) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.postcord = postcord;
		this.roadaddress = roadaddress;
		this.detailaddress = detailaddress;
		this.email = email;
	}

	public MemberVO(String pwd, String name, String birth, String phone, String postcord, 
			String roadaddress, String detailaddress, String email) {
		super();
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.postcord = postcord;
		this.roadaddress = roadaddress;
		this.detailaddress = detailaddress;
		this.email = email;
	}

	public MemberVO(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}

	public MemberVO() {
		super();
	}


	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPostcord() {
		return postcord;
	}

	public void setPostcord(String postcord) {
		this.postcord = postcord;
	}

	public String getRoadaddress() {
		return roadaddress;
	}

	public void setRoadaddress(String roadaddress) {
		this.roadaddress = roadaddress;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth
				+ ", phone=" + phone + ", postcord=" + postcord + ", roadaddress=" + roadaddress + ", detailaddress="
				+ detailaddress + ", email=" + email + ", status=" + status + ", admin=" + admin + ", grade=" + grade
				+ ", hit=" + hit + "]";
	}
	

	
}
