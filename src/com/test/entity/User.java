package com.test.entity;


public class User {
	
	private Integer uid;
	//用户手机号
	private String tel;
	//用户密码
	private String password;
	//用户姓名
	private String name;
	//用户创建时间
	private String createTime;
	//学号
	private String sno;
	//余额
	private Integer account;
	
	
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public Integer getAccount() {
		return account;
	}

	public void setAccount(Integer account) {
		this.account = account;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", tel=" + tel + ", password=" + password + ", name=" + name + ", createTime="
				+ createTime + ", sno=" + sno + ", account=" + account + "]";
	}

	
}
