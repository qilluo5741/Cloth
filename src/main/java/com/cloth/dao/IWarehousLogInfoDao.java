package com.cloth.dao;

import java.util.List;

import com.cloth.entity.WarehousLogInfo;
import com.cloth.util.Pager;

public interface IWarehousLogInfoDao {
	public List<WarehousLogInfo> selectAllList();
	public Pager<WarehousLogInfo> selectAll(int pageIndex, int pageSize);
}
