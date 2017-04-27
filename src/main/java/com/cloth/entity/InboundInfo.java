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
 * 商品入库
 * @author Administrator
 *
 */

@Entity
@Table(name="InboundInfo")
public class InboundInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	@Column(length=40)
	private String inboundId;
	private Date inboundTime;//--入库时间
	@ManyToOne(cascade=CascadeType.REMOVE,fetch=FetchType.EAGER,optional=false)
	@JoinColumn(name="empId")
	private EmpInfo emp;//--审核人（审核人）
	private String goodsName;
	private int reOrPo;//--退货或采购
	@ManyToOne(cascade=CascadeType.REMOVE,fetch=FetchType.EAGER)
	@JoinColumn(name="procurementId")
	private ProcurementInfo procurement;//  --采购表（外键 采购的批次）
	@ManyToOne(cascade=CascadeType.REMOVE,fetch=FetchType.EAGER)
	@JoinColumn(name="warehouseId")
	private WarehouseInfo warehouse;//  (仓库)
	private String inboundRemark;//--入库说明
	
	public int getReOrPo() {
		return reOrPo;
	}
	public void setReOrPo(int reOrPo) {
		this.reOrPo = reOrPo;
	}
	public String getInboundId() {
		return inboundId;
	}
	public void setInboundId(String inboundId) {
		this.inboundId = inboundId;
	}
	public Date getInboundTime() {
		return inboundTime;
	}
	public void setInboundTime(Date inboundTime) {
		this.inboundTime = inboundTime;
	}
	public String getInboundRemark() {
		return inboundRemark;
	}
	public void setInboundRemark(String inboundRemark) {
		this.inboundRemark = inboundRemark;
	}
	
	public EmpInfo getEmp() {
		return emp;
	}
	public void setEmp(EmpInfo emp) {
		this.emp = emp;
	}
	
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public ProcurementInfo getProcurement() {
		return procurement;
	}
	public void setProcurement(ProcurementInfo procurement) {
		this.procurement = procurement;
	}
	public WarehouseInfo getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(WarehouseInfo warehouse) {
		this.warehouse = warehouse;
	}
	public InboundInfo() {
	}
	public InboundInfo(String inboundId, Date inboundTime, EmpInfo emp,
			String goodsName, ProcurementInfo procurement,
			WarehouseInfo warehouse, String inboundRemark) {
		this.inboundId = inboundId;
		this.inboundTime = inboundTime;
		this.emp = emp;
		this.goodsName = goodsName;
		this.procurement = procurement;
		this.warehouse = warehouse;
		this.inboundRemark = inboundRemark;
	}
	
}
