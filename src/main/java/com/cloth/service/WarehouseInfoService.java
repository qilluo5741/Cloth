package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.cloth.dao.IWarehouseInfoDao;
import com.cloth.entity.WarehouseInfo;
import com.cloth.util.Pager;
@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class WarehouseInfoService implements IWarehouseInfoService {
	@Autowired
	private IWarehouseInfoDao dao;	
	public Pager<WarehouseInfo> selectAll(int pageIndex, int pageSize) {
		return dao.selectAll(pageIndex, pageSize);
	}
	public List<WarehouseInfo> selectAllList() {
		return dao.selectAllList();
	}
	public WarehouseInfo selectOneById(String warehouseId) {
		return dao.selectOneById(warehouseId);
	}
}
