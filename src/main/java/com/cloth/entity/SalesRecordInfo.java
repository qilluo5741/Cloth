package com.cloth.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table
public class SalesRecordInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	private String salesRecordId;
	private Date salesRecordTime;
	private double salesRecordMoney;
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "goodsOrderId")
	private GoodsOrderInfo goodsOrder;//--¶©µ¥Íâ¼ü
	private String salesRecordRemark;
	
	public String getSalesRecordId() {
		return salesRecordId;
	}
	public void setSalesRecordId(String salesRecordId) {
		this.salesRecordId = salesRecordId;
	}
	public Date getSalesRecordTime() {
		return salesRecordTime;
	}
	public void setSalesRecordTime(Date salesRecordTime) {
		this.salesRecordTime = salesRecordTime;
	}
	public double getSalesRecordMoney() {
		return salesRecordMoney;
	}
	public void setSalesRecordMoney(double salesRecordMoney) {
		this.salesRecordMoney = salesRecordMoney;
	}
	public GoodsOrderInfo getGoodsOrder() {
		return goodsOrder;
	}
	public void setGoodsOrder(GoodsOrderInfo goodsOrder) {
		this.goodsOrder = goodsOrder;
	}
	public String getSalesRecordRemark() {
		return salesRecordRemark;
	}
	public void setSalesRecordRemark(String salesRecordRemark) {
		this.salesRecordRemark = salesRecordRemark;
	}
}
