package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.ISizeInfoDao;
import com.cloth.entity.SizeInfo;
import com.cloth.util.Pager;

@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class SizeServiceImpl implements ISizeService {

	@Autowired
	private ISizeInfoDao dao;
	
	/**
	 * 分页查询所有
	 */
	public Pager<SizeInfo> queryAllSize(int pageIndex, int pageSize) {
		return dao.queryAllSize(pageIndex, pageSize);
	}

	/**
	 * 新增尺寸
	 */
	public boolean insertSize(SizeInfo sizes) {
		return dao.insertSize(sizes);
	}
	
	/**
	 * 查询所有尺寸返回list
	 */
	public List<SizeInfo> selectAllToList() {
		return dao.selectAllToList();
	}

	/**
	 * 是否存在该尺寸
	 */
	public boolean selectIsExistsSize(String sizeName,String goodsTypeName) {
		return dao.selectIsExistsSize(sizeName,goodsTypeName);
	}
}
