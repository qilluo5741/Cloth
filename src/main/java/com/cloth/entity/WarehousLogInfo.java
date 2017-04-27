package com.cloth.entity;

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
public class WarehousLogInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	private String warehousLogId;//
	private int isIncrease;//  --是否入库   0入库  1 出库
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "outboundId")
	private OutboundInfo outbound;//  （出库表 允许为空）
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "inboundId")
	private InboundInfo inbound;//（入库表 允许为空）
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "warehouseId")
	private WarehouseInfo warehouse;//  (仓库  外键)
	private String warehousLogRemark;
	
	public String getWarehousLogId() {
		return warehousLogId;
	}
	public void setWarehousLogId(String warehousLogId) {
		this.warehousLogId = warehousLogId;
	}
	public int getIsIncrease() {
		return isIncrease;
	}
	public void setIsIncrease(int isIncrease) {
		this.isIncrease = isIncrease;
	}
	public OutboundInfo getOutbound() {
		return outbound;
	}
	public void setOutbound(OutboundInfo outbound) {
		this.outbound = outbound;
	}
	public InboundInfo getInbound() {
		return inbound;
	}
	public void setInbound(InboundInfo inbound) {
		this.inbound = inbound;
	}
	public WarehouseInfo getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(WarehouseInfo warehouse) {
		this.warehouse = warehouse;
	}
	public String getWarehousLogRemark() {
		return warehousLogRemark;
	}
	public void setWarehousLogRemark(String warehousLogRemark) {
		this.warehousLogRemark = warehousLogRemark;
	}
	public WarehousLogInfo() {
	}
	public WarehousLogInfo(String warehousLogId, int isIncrease,
			OutboundInfo outbound, InboundInfo inbound,
			WarehouseInfo warehouse, String warehousLogRemark) {
		this.warehousLogId = warehousLogId;
		this.isIncrease = isIncrease;
		this.outbound = outbound;
		this.inbound = inbound;
		this.warehouse = warehouse;
		this.warehousLogRemark = warehousLogRemark;
	}
	
}
