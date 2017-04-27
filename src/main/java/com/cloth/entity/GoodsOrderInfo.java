package com.cloth.entity;

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
@Table(name="goodsOrderInfo")
public class GoodsOrderInfo {

	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	@Column(length=40)
	private String goodsOrderId;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="orderId")
	private OrderInfo order;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="goodsId")
	private GoodsInfo goods;

	public String getGoodsOrderId() {
		return goodsOrderId;
	}

	public void setGoodsOrderId(String goodsOrderId) {
		this.goodsOrderId = goodsOrderId;
	}

	public OrderInfo getOrder() {
		return order;
	}

	public void setOrder(OrderInfo order) {
		this.order = order;
	}

	public GoodsInfo getGoods() {
		return goods;
	}

	public void setGoods(GoodsInfo goods) {
		this.goods = goods;
	}

	public GoodsOrderInfo() {
	}

	public GoodsOrderInfo(String goodsOrderId, OrderInfo order, GoodsInfo goods) {
		this.goodsOrderId = goodsOrderId;
		this.order = order;
		this.goods = goods;
	}
}
