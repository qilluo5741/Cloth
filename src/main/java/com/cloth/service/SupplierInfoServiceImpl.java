package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.ISupplierInfoDao;
import com.cloth.entity.SupplierInfo;
import com.cloth.util.Pager;

@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class SupplierInfoServiceImpl implements ISupplierInfoService {

	@Autowired
	private ISupplierInfoDao dao;
	
	/**
	 * 分页查询全部
	 */
	public Pager<SupplierInfo> querySelectAll(int pageIndex, int pageSize) {
		return dao.querySelectAll(pageIndex, pageSize);
	}

	/**
	 * 查询全部
	 */
	public List<SupplierInfo> selectAll() {
		return dao.selectAll();
	}
	
	/**
	 * 添加
	 */
	public boolean insert(SupplierInfo supplier) {
		return dao.insert(supplier);
	}

	/**
	 *  查询单个
	 */
	public boolean selectOne(String supplierName, String supplierPeople, String supplierAddress) {
		return dao.selectOne(supplierName, supplierPeople, supplierAddress);
	}
}
