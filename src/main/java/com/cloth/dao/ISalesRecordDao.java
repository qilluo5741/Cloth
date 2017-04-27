package com.cloth.dao;

import java.util.List;

import com.cloth.entity.SalesRecordInfo;
import com.cloth.util.Pager;

public interface ISalesRecordDao {
	public Pager<SalesRecordInfo> selectAllByPager(int pageIndex,int pageSize);
	public boolean insertOne(SalesRecordInfo salesRecord);
	public List<SalesRecordInfo> queryAllSalesRecordInfo();
}
