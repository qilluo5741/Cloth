package com.cloth.service;

import java.util.List;

import com.cloth.entity.InboundInfo;
import com.cloth.util.Pager;

public interface IInboundInfoService {

	/**
	 * 查询全部
	 * @return
	 */
	public List<InboundInfo> selectList();
	
	/**
	 * 添加
	 * @param inbound
	 * @return
	 */
	public boolean insert(InboundInfo inbound);
	
	/**
	 * 分页查询
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public Pager<InboundInfo> querySelectAll(int pageIndex, int pageSize);
	
}
