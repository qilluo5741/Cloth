package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.ISalesRecordDao;
import com.cloth.entity.SalesRecordInfo;
import com.cloth.util.Pager;

@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class SalesRecordServiceImpl implements ISalesRecordService {

	@Autowired
	private ISalesRecordDao srDao;
	
	public Pager<SalesRecordInfo> selectAllByPager(int pageIndex, int pageSize) {
		return srDao.selectAllByPager(pageIndex, pageSize);
	}
	
	public boolean insertOne(SalesRecordInfo salesRecord) {
		return srDao.insertOne(salesRecord);
	}
	public List<SalesRecordInfo> queryAllSalesRecordInfo(){
		return srDao.queryAllSalesRecordInfo();
	}
}
