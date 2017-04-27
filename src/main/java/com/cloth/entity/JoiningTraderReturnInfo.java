package com.cloth.entity;

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

/**
 * 加盟商退（换）货
 * @author Administrator
 *
 */
@Entity
@Table(name="JoiningTraderReturnInfo")
public class JoiningTraderReturnInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	@Column(length=40)
	private String joiningTraderReturnId;//
	private int returnOrExchange;//退（换）货
	private String returnTime;//--退（换）货发起时间
	private String returnRemark;//--退（换）货说明
	private String goodsName;//退（换）货商品编号
	private String colorName;//退（换）货商品颜色
	private String sizeName;//退（换）货商品大小
	private int goodsNum;//退（换）货商品数量
	private int returnStatus;//退（换）货状态  0审核中   1 成功  2  失败
	@ManyToOne(cascade=CascadeType.REMOVE,fetch=FetchType.EAGER,optional=false)
	@JoinColumn(name="joiningTraderId")
	private JoiningTraderInfo joiningTrader;//--加盟Id外键
	public String getJoiningTraderReturnId() {
		return joiningTraderReturnId;
	}
	public void setJoiningTraderReturnId(String joiningTraderReturnId) {
		this.joiningTraderReturnId = joiningTraderReturnId;
	}
	public String getReturnTime() {
		return returnTime;
	}
	public void setReturnTime(String returnTime) {
		this.returnTime = returnTime;
	}
	public String getReturnRemark() {
		return returnRemark;
	}
	public void setReturnRemark(String returnRemark) {
		this.returnRemark = returnRemark;
	}
	public int getReturnOrExchange() {
		return returnOrExchange;
	}
	public void setReturnOrExchange(int returnOrExchange) {
		this.returnOrExchange = returnOrExchange;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
	public String getSizeName() {
		return sizeName;
	}
	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public int getReturnStatus() {
		return returnStatus;
	}
	public void setReturnStatus(int returnStatus) {
		this.returnStatus = returnStatus;
	}
	
	public JoiningTraderInfo getJoiningTrader() {
		return joiningTrader;
	}
	public void setJoiningTrader(JoiningTraderInfo joiningTrader) {
		this.joiningTrader = joiningTrader;
	}
	public JoiningTraderReturnInfo() {
	}
	public JoiningTraderReturnInfo(String joiningTraderReturnId,
			int returnOrExchange, String returnTime, String returnRemark,
			String goodsName, String colorName, String sizeName, int goodsNum,
			int returnStatus, JoiningTraderInfo joiningTrader) {
		super();
		this.joiningTraderReturnId = joiningTraderReturnId;
		this.returnOrExchange = returnOrExchange;
		this.returnTime = returnTime;
		this.returnRemark = returnRemark;
		this.goodsName = goodsName;
		this.colorName = colorName;
		this.sizeName = sizeName;
		this.goodsNum = goodsNum;
		this.returnStatus = returnStatus;
		this.joiningTrader = joiningTrader;
	}
}
