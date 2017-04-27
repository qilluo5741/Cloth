package com.cloth.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.ILocalReturnDao;
import com.cloth.entity.LocalReturnInfo;
import com.cloth.util.Pager;

@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class LocalReturnServiceImpl implements ILocalReturnService {
	
	@Autowired
	private ILocalReturnDao dao;

	/**
	 * 分页查询所有
	 */
	public Pager<LocalReturnInfo> queryLocalAll(int pageIndex, int pageSize) {
		return dao.queryLocalAll(pageIndex, pageSize);
	}

	/**
	 * 修改本地退货状态
	 */
	public boolean updateReturnStatus(String returnId) {
		return dao.updateReturnStatus(returnId);
	}
	
	/**
	 * 根据id查询单个退货记录
	 */
	public LocalReturnInfo selectOntByReturnId(String returnId) {
		return dao.selectOntByReturnId(returnId);
	}

	public boolean returnGoods(LocalReturnInfo locals, String empId,
			String outboundId) {
		return dao.returnGoods(locals, empId, outboundId);
	}
}
