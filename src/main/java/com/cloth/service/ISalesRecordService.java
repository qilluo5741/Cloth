package com.cloth.service;

import java.util.List;

import com.cloth.entity.SalesRecordInfo;
import com.cloth.util.Pager;

public interface ISalesRecordService {
	public Pager<SalesRecordInfo> selectAllByPager(int pageIndex,int pageSize);
	public boolean insertOne(SalesRecordInfo salesRecord);
	public List<SalesRecordInfo> queryAllSalesRecordInfo();
}
