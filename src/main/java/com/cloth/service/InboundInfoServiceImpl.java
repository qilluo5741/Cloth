package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloth.dao.IInboundInfoDao;
import com.cloth.entity.InboundInfo;
import com.cloth.util.Pager;

@Service
public class InboundInfoServiceImpl implements IInboundInfoService {

	@Autowired
	private IInboundInfoDao dao;
	
	/**
	 * 添加
	 */
	public boolean insert(InboundInfo inbound) {
		return dao.insert(inbound);
	}

	/**
	 * 分页
	 */
	public Pager<InboundInfo> querySelectAll(int pageIndex, int pageSize) {
		return dao.querySelectAll(pageIndex, pageSize);
	}

	/**
	 * 查询全部
	 */
	public List<InboundInfo> selectList() {
		return dao.selectList();
	}
}
