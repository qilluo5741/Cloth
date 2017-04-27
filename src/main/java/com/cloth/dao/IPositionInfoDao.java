package com.cloth.dao;

import java.util.List;
import com.cloth.entity.PositionInfo;
import com.cloth.util.Pager;

public interface IPositionInfoDao {
	public List<PositionInfo> queryAllPositionInfo();
	public void addPositionInfo(PositionInfo posi);
	public boolean deletePositionInfo(String positionId);
	public PositionInfo selectOnePositionInfo(String positionId);
	public boolean updatePositionInfo(PositionInfo posi);
	public Pager<PositionInfo> selectByPager(int pageIndex, int pageSize);
}
