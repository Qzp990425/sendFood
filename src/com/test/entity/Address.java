package com.test.entity;

public class Address {
	private Integer aid;
	private Integer uid;
	private String name;
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Address [aid=" + aid + ", uid=" + uid + ", name=" + name + "]";
	}
	
	
}
