package com.cloth.dao;

import java.util.List;

import com.cloth.entity.SupplierInfo;
import com.cloth.util.Pager;

public interface ISupplierInfoDao {
	
	/**
	 * 查询全部
	 * @return
	 */
	public List<SupplierInfo> selectAll();
	
	/**
	 * 查询单个
	 * @param supplierId
	 * @return
	 */
	public boolean selectOne(String supplierName, String supplierPeople, String supplierAddress);
	
	/**
	 * 分页查询全部
	 * @return
	 */
	public Pager<SupplierInfo> querySelectAll(int pageIndex,int pageSize);
	
	/**
	 * 添加
	 * @param supplier
	 * @return
	 */
	public boolean insert(SupplierInfo supplier);
	
	
}
