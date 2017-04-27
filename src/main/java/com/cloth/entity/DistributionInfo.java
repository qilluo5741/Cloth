package com.cloth.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="DistributionInfo")
public class DistributionInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	@Column(length=40)
	private String distributionId;
	private Date distributionTime;//--配送时间
	private int isAcceptance;//  --是否验收  0 已验收 1 位验收 2 拒收
	private String disAddress;
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="orderId")
	private OrderInfo order;
	private String distributionRemark;
	public String getDistributionId() {
		return distributionId;
	}
	public void setDistributionId(String distributionId) {
		this.distributionId = distributionId;
	}
	public Date getDistributionTime() {
		return distributionTime;
	}
	public void setDistributionTime(Date distributionTime) {
		this.distributionTime = distributionTime;
	}
	
	public int getIsAcceptance() {
		return isAcceptance;
	}
	public void setIsAcceptance(int isAcceptance) {
		this.isAcceptance = isAcceptance;
	}
	public String getDisAddress() {
		return disAddress;
	}
	public void setDisAddress(String disAddress) {
		this.disAddress = disAddress;
	}
	public OrderInfo getOrder() {
		return order;
	}
	public void setOrder(OrderInfo order) {
		this.order = order;
	}
	public String getDistributionRemark() {
		return distributionRemark;
	}
	public void setDistributionRemark(String distributionRemark) {
		this.distributionRemark = distributionRemark;
	}
	public DistributionInfo(String distributionId, Date distributionTime,
			 int isAcceptance, String disAddress,OrderInfo order,
			 String distributionRemark) {
		this.distributionId = distributionId;
		this.distributionTime = distributionTime;
		this.isAcceptance = isAcceptance;
		this.disAddress = disAddress;
		this.order = order;
		this.distributionRemark = distributionRemark;
	}
	public DistributionInfo() {
	}
}