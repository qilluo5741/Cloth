package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.IWarehousLogInfoDao;
import com.cloth.entity.WarehousLogInfo;
import com.cloth.util.Pager;
@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class WarehousLogInfoServiceImpl implements IWarehousLogInfoService {
	@Autowired
	private IWarehousLogInfoDao dao;
	public Pager<WarehousLogInfo> selectAll(int pageIndex, int pageSize) {
		return dao.selectAll(pageIndex, pageSize);
	}
	public List<WarehousLogInfo> selectAllList() {
		return dao.selectAllList();
	}
}
