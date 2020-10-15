package com.test.entity;


public class OrderRecord {
	private Integer oid;
	//订单编号
	private String uuid;
	//订单状态 0-订单创建，等待上架发货
	//1-等待用户收货
	//2-完成
	private Integer status;
	//商品id
	private Integer fid;
	//购买数量
	private Integer number;
	//创建时间
	private String createTime;
	//配送时间
	private String sendTime;
	//完成时间
	private String doneTime;
	//买家id
	private Integer buyId;

	//填写地址
	private String name;
	//买家
	private User buyUser;

	//出售商品
	private Food food;
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public String getDoneTime() {
		return doneTime;
	}
	public void setDoneTime(String doneTime) {
		this.doneTime = doneTime;
	}

	public Integer getBuyId() {
		return buyId;
	}
	public void setBuyId(Integer buyId) {
		this.buyId = buyId;
	}
	public User getBuyUser() {
		return buyUser;
	}
	public void setBuyUser(User buyUser) {
		this.buyUser = buyUser;
	}

	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "OrderRecord [oid=" + oid + ", uuid=" + uuid + ", status=" + status + ",fid=" + fid + ", number="
				+ number + ", createTime=" + createTime + ", sendTime=" + sendTime + ", doneTime=" + doneTime
				+ ", buyId=" + buyId + ", buyUser=" + buyUser + ", Food=" + food + "]";
	}
		
	
}
