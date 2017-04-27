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
@Table(name="OrderInfo")
public class OrderInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	@Column(length=40)
	private String orderId;
	private Date orderTime;
	private int goodsNum;//--此商品数量
	@ManyToOne(cascade=CascadeType.REMOVE,fetch=FetchType.EAGER,optional=false)
	@JoinColumn(name="joiningTraderId")
	private JoiningTraderInfo joiningTrader;//--加盟商
	private int isdo;//-- 是否处理     0 已处理  1 未处理  2 拒绝处理
	private String orderRemark;
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public int getIsdo() {
		return isdo;
	}
	public void setIsdo(int isdo) {
		this.isdo = isdo;
	}
	public String getOrderRemark() {
		return orderRemark;
	}
	public void setOrderRemark(String orderRemark) {
		this.orderRemark = orderRemark;
	}
	public JoiningTraderInfo getJoiningTrader() {
		return joiningTrader;
	}
	public void setJoiningTrader(JoiningTraderInfo joiningTrader) {
		this.joiningTrader = joiningTrader;
	}
	public OrderInfo() {
	}
	public OrderInfo(String orderId, Date orderTime,int goodsNum, 
			JoiningTraderInfo joiningTrader, int isdo, String orderRemark) {
		this.orderId = orderId;
		this.orderTime = orderTime;
		this.goodsNum = goodsNum;
		this.joiningTrader = joiningTrader;
		this.isdo = isdo;
		this.orderRemark = orderRemark;
	}
	
}
