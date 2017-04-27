package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.IOrderInfoDao;
import com.cloth.entity.OrderInfo;
import com.cloth.util.Pager;
@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class OrderInfoServiceImpl implements IOrderInfoService {
	@Autowired
	private IOrderInfoDao dao;
	public boolean deleteOrderInfoInfo(String orderId) {
		return dao.deleteOrderInfoInfo(orderId);
	}

	public void insert(OrderInfo order) {
		dao.insert(order);
	}

	public Pager<OrderInfo> selectAll(int pageIndex, int pageSize) {
		return dao.selectAll(pageIndex, pageSize);
	}

	public List<OrderInfo> selectAllList() {
		return dao.selectAllList();
	}

	public OrderInfo selectOneById(String orderId) {
		return dao.selectOneById(orderId);
	}

	public boolean updateOrderInfoBy(OrderInfo order) {
		return dao.updateOrderInfoBy(order);
	}

	/**
	 * 查询未处理的订单
	 */
	public List<OrderInfo> selectIsDo() {
		return dao.selectIsDo();
	}

	/**
	 * 查询申请单上商品的数量是否足够
	 */
	public boolean selectOrderById(String orderId) {
		return dao.selectOrderById(orderId);
	}
	public boolean passVerify(String orderId) {
		return dao.passVerify(orderId);
	}
	public boolean noPassVerify(String orderId) {
		return dao.noPassVerify(orderId);
	}
}
