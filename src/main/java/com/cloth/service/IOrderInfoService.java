package com.cloth.service;

import java.util.List;
import com.cloth.entity.OrderInfo;
import com.cloth.util.Pager;

public interface IOrderInfoService {
	/**
	 * 查询单个
	 * @param orderId
	 * @return
	 */
	public OrderInfo selectOneById(String orderId);
	/**
	 * 查询所有 list
	 * @return
	 */
	public List<OrderInfo> selectAllList();
	/**
	 * 分页
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public Pager<OrderInfo> selectAll(int pageIndex, int pageSize);
	/**
	 * 添加
	 * @param order
	 */
	public void insert(OrderInfo order);
	/**
	 * 修改
	 * @param order
	 * @return
	 */
	public boolean updateOrderInfoBy(OrderInfo order);
	/**
	 * 删除
	 * @param orderId
	 * @return
	 */
	public boolean deleteOrderInfoInfo(String orderId);
	
	/**
	 * 查询单个返回申请商品数量
	 * @param orderId
	 * @return
	 */
	public boolean selectOrderById(String orderId);
	
	/**
	 * 查询未处理的订单
	 * @return
	 */
	public List<OrderInfo> selectIsDo();
	public boolean passVerify(String orderId);
	public boolean noPassVerify(String orderId);
}
