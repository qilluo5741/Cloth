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

/**
 * 财务表
 * @author Administrator
 *
 */
@Entity
@Table(name="FinancialInfo")
public class FinancialInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	@Column(length=40)
	private String financialId;
	private String isSpending;//  --是否支出  0 支出 1 收入 
	private String financialMoney;
	private Date financialTime;
	@ManyToOne(cascade=CascadeType.REMOVE,fetch=FetchType.EAGER,optional=false)
	@JoinColumn(name="procurementId")
	private ProcurementInfo procurement;// --采购表  --采购表
	@ManyToOne(cascade=CascadeType.REMOVE,fetch=FetchType.EAGER,optional=false)
	@JoinColumn(name="salesRecordId")
	private SalesRecordInfo salesRecord;//--销售记录表
	private String financialRemark;
	public String getFinancialRemark() {
		return financialRemark;
	}
	public void setFinancialRemark(String financialRemark) {
		this.financialRemark = financialRemark;
	}
	public String getFinancialId() {
		return financialId;
	}
	public void setFinancialId(String financialId) {
		this.financialId = financialId;
	}
	public String getIsSpending() {
		return isSpending;
	}
	public void setIsSpending(String isSpending) {
		this.isSpending = isSpending;
	}
	public String getFinancialMoney() {
		return financialMoney;
	}
	public void setFinancialMoney(String financialMoney) {
		this.financialMoney = financialMoney;
	}
	public Date getFinancialTime() {
		return financialTime;
	}
	public void setFinancialTime(Date financialTime) {
		this.financialTime = financialTime;
	}
	public ProcurementInfo getProcurement() {
		return procurement;
	}
	public void setProcurement(ProcurementInfo procurement) {
		this.procurement = procurement;
	}
	public SalesRecordInfo getSalesRecord() {
		return salesRecord;
	}
	public void setSalesRecord(SalesRecordInfo salesRecord) {
		this.salesRecord = salesRecord;
	}
	public FinancialInfo(String financialId, String isSpending,
			String financialMoney, Date financialTime,
			ProcurementInfo procurement, SalesRecordInfo salesRecord,
			String financialRemark) {
		this.financialId = financialId;
		this.isSpending = isSpending;
		this.financialMoney = financialMoney;
		this.financialTime = financialTime;
		this.procurement = procurement;
		this.salesRecord = salesRecord;
		this.financialRemark = financialRemark;
	}
	public FinancialInfo() {
	}
}
