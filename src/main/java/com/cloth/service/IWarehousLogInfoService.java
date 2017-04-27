package com.cloth.service;

import java.util.List;

import com.cloth.entity.WarehousLogInfo;
import com.cloth.util.Pager;

public interface IWarehousLogInfoService {
	public List<WarehousLogInfo> selectAllList();
	public Pager<WarehousLogInfo> selectAll(int pageIndex, int pageSize);
}
